private ["_pad","_padID","_abort"];
_helis = [
["UH-80 Ghost Hawk",90000,"B_Heli_Transport_01_camo_F",180],
["AH-99 Blackfoot",150000,"B_Heli_Attack_01_F",300],
["MH-9 Hummingbird",40000,"B_Heli_Light_01_F",60]
];

_id = _this select 3;
_heli = _helis select _id;
_abort = false;

if(money >= _heli select 1) then{
    // Suche freies Helipad
    _pad = heliPad1;
    if(count (nearestObjects[heliPad1,["Air"],10]) == 0 && (padStatus select 0)==0)then{
        _pad = heliPad1;
        _padID = 0;
        padStatus set [0,1];
    }else{
        if(count (nearestObjects[heliPad2,["Air"],10]) == 0 && (padStatus select 1)==0)then{
	        _pad = heliPad2;
	        padStatus set [1,1];
   		 }else{
             if(count (nearestObjects[heliPad3,["Air"],10]) == 0 && (padStatus select 2)==0)then{
		        _pad = heliPad3;
		        padStatus set [2,1];
    		 }else{
		        player sideChat "Alle HeliPads sind belegt. Bitte warten oder Helipads räumen!";
		       	_abort = true;
            }
    }
    };
    if(_abort) exitWith{};
    _pos = getPos _pad;
    
    // Verzögerung 
    player sideChat format ["Deine Bestellung ist in Bearbeitung,bitte warten!Vorraussichtliche Bearbeitungszeit: %1 Sekunden.",(_heli select 3)];
    sleep (_heli select 3);
    
    // Heli Spawnen
    (_heli select 2) createVehicle (_pos);
    player sideChat format ["Deine Bestellung ist abgeschlossen. Der Heli steht bereit!"];
    
    //Geld Abziehen
    money = money - (_heli select 1);
    publicVariable "money";
}else{
    player sideChat "Nicht genug Geld!";
}