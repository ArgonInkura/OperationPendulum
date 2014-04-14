_caller = _this select 1;
if(task > 0) then {
    hint "Du hast bereits eine Mission!";
}else{
    ["Dein Squad wurde in Bereitschaft versetzt!"] call oppSideChatAll;
    //sleep floor random 150;
    ["Deinem Squad wurde eine Mission zugeteilt!"] call oppSideChatAll;
    
    _missions=[
    [1,2,3,4,5,6], 	// Secure
    [1,2,3,4]		//Sabotage
    ];
    
    _typeID = floor random count _missions;
    _typeMissions = _missions select _typeID;
    
    _missionID = floor random count (_missions select _typeID);
    _mission = _typeMissions select _missionID;
    
    
    switch (_typeID) do{
        case 0:{
            execVM format ["missions\secure\%1.sqf",_mission];
        };
        case 1:{
            execVM format ["missions\sabotage\%1.sqf",_mission];
        };
    };
    
    task = format ["%1%2",_typeID,_missionID];
};