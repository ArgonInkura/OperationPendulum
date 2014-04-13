// Pyrgos
private["_enemyCount"];

_missionLoc = "Pyrgos";
_missionText = "Eliminieren Sie alle feindlichen Einheiten in Pyrgos!";

_markerLoc = [16899.1,12708.2];
_markerShape = "ELLIPSE";
_markerColor = "ColorRed";
_markerBrush = "DiagGrid";
_markerSize = [500,500];

// Create Marker
_marker = createMarker ["Marker",_markerLoc];
"Marker" setMarkerShape _markerShape;
"Marker" setMarkerSize _markerSize;
"Marker" setMarkerColor _markerColor;
"Marker" setMarkerBrush _markerBrush;


_hostiles = [];
_enemies4 = createGroup east;
// Spawn enemies
_enemies1 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = units _enemies1 + _hostiles;
_enemies2 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies2;
_enemies3 = [_markerLoc,1,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies3;
_enemies5 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies5;
_enemies6 = [_markerLoc,2,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies6;
_enemies7 = [_markerLoc,3,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies7;

if(random 1 > 0.75) then {
    _enemies4 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
    _hostiles =_hostiles + (units _enemies4);
};

_enemyCount = {alive _x;} count _hostiles;
player sideChat format["%2 Gegnerzahl: %1",_enemyCount,_missionText];

while {_enemyCount > 0 } do{
    player sideChat format["Gegner: %1",_enemyCount];
    _enemyCount =  {alive _x;} count _hostiles;
    sleep 1;
};

player sideChat "Mission erfolgreich. Dein Team erhält $25'000!";
money = money + 25000;
publicVariable "money";
task = 0;
publicVariable "task";
lastTask = "16";
publicVariable "lastTask";

sleep 300;

deleteGroup _enemies1;
deleteGroup _enemies2;
deleteGroup _enemies3;
deleteGroup _enemies4;
deleteGroup _enemies5;
deleteGroup _enemies6;
deleteGroup _enemies7;

{
    deleteVehicle _x
}foreach _hostiles;

deleteMarker "Marker";