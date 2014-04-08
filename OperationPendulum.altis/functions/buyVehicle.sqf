private ["_spot","_spotID","_abort"];
_cars = [
["IFV-6a Cheetah",75000,"B_APC_Tracked_01_AA_F",100],
["IFV-6c Panther",75000,"B_APC_Tracked_01_rcws_F",100],
["AMV-7 Marshall",75000,"B_APC_Wheeled_01_cannon_F",120],
["M4 Scorcher",150000,"B_MBT_01_arty_F",180],
["M2A1 Slammer",125000,"B_MBT_01_cannon_F",240],
["Sandstorm MLRS",200000,"B_MBT_01_mlrs_F",180]
];

_id = _this select 3;
_car = _cars select _id;
_abort = false;

if(money >= _car select 1) then{
    // Suche freien Stellplatz
    _spot = vehicleSpawn1;
    if(count (nearestObjects[vehicleSpawn1,["Armored"],10]) == 0 && (spotStatus select 0)==0)then{
        _spot = vehicleSpawn1;
        _spotID = 0;
        spotStatus set [0,1];
    }else{
        if(count (nearestObjects[vehicleSpawn2,["Armored"],10]) == 0 && (spotStatus select 1)==0)then{
	        _spot = vehicleSpawn2;
	        spotStatus set [1,1];
   		 }else{
		       player sideChat "Alle Stellplätze sdind belegt. Bitte stellplatz räumen!";
               	_abort = true;
     }
    
    };
    if(_abort) exitWith{};
    _pos = getPos _spot;
    
    // Verzögerung 
    player sideChat format ["Deine Bestellung ist in Bearbeitung,bitte warten!Vorraussichtliche Bearbeitungszeit: %1 Sekunden.",(_car select 3)];
    sleep (_car select 3);
    
    // Heli Spawnen
    (_car select 2) createVehicle (_pos);
    player sideChat format ["Deine Bestellung ist abgeschlossen. Das Fahrzeug steht bereit!"];
    
    //Geld Abziehen
    money = money - (_car select 1);
    publicVariable "money";
}else{
    player sideChat "Nicht genug Geld!";
}