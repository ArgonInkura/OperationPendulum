// Kavala


_missionLoc = "Zaros";
_missionText = "Finden und entschärfen sie alle Auto-Bomben in Kavala!";
currentTaskText = _missionText;
publicVariable "currentTaskText";

_markerLoc = [9110.83,11969.6];
_markerShape = "ELLIPSE";
_markerColor = "ColorRed";
_markerBrush = "DiagGrid";
_markerSize = [600,600];

// Create Marker
_marker = createMarker ["Marker",_markerLoc];
"Marker" setMarkerShape _markerShape;
"Marker" setMarkerSize _markerSize;
"Marker" setMarkerColor _markerColor;
"Marker" setMarkerBrush _markerBrush;

_carLocs = [[3626,13114],[3497,13071],[3521,13203],[3696,13187],[3737,13039],[3696,12937],[3619,12928],[3577,12777],[3577,12777],[3429,12618],[3501,12750],[3551,12848],[3462,12900],[3507,12999],[3407,13090],[3385,13122],[3527,13273],[3612,13348]];
bombBombs = [];
_vehicles



// Spawn one bomb
_i = floor random count _carLocs;
 _v = "C_Offroad_01_f" createVehicle (_carLocs select _i);
_v lock true;
_v addAction ["Untersuche","missions\bomb\functions\bombCheck.sqf"];
_vehicles = _vehicles + [_v];
bombBombs = bombBombs + [_v];
_carLocs = _carLocs - [_carLocs select _i];
publicVariable "bombBombs";


// Spawn random cars with a chance to have a bomb
{
    _rand = random 1;
    if(_rand >0.5)then{
        _v = "C_Offroad_01_f" createVehicle _x;
        _v lock true;
        _v addAction ["Untersuche","missions\bomb\functions\bombCheck.sqf"];
        
        _bombRand = random 1;
        if(_bombRand >0.8)then{
			bombBombs = bombBombs + [_v];
            publicVariable "bombBombs";
    	};
    };
}foreach _carLocs;

/*
_hostiles = [];
// Spawn enemies
_enemies1 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = units _enemies1 + _hostiles;
_enemies2 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies2;
_enemies3 = [_markerLoc,1,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies3;
_enemies4 = createGroup east;
                               *
if(random 1 > 0.75) then {
    _enemies4 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
    _hostiles =_hostiles + (units _enemies4);
};
     */


_totalBombs = count bombBombs;
player sideChat format["Bombs:%1",_totalBombs];
[_missionText, group player] call oppsideChatGroupAll;
bombDefusedBombs = 0;
while {bombDefusedBombs < _totalBombs } do{
    sleep 1;
};

["Mission erfolgreich. Dein Team erhält $25'000!", (group player)] call oppsideChatGroupAll;
money = money + 25000;
publicVariable "money";
task = 0;
publicVariable "task";
lastTask = "01";
publicVariable "lastTask";
currentTaskText = "In Bereitschaft";
publicVariable "currentTaskText";

sleep 300;

/*
deleteGroup _enemies1;
deleteGroup _enemies2;
deleteGroup _enemies3;
deleteGroup _enemies4;
                        

{
    deleteVehicle _x
}foreach _hostiles;
*/

{
    deleteVehicle _x
}foreach _vehicles;

deleteMarker "Marker";


