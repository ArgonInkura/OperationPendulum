// Coast North-West
private["_enemyCount","_objectives"];

_missionText = "Sprengen Sie alle Fahrzeuge!";

_markerLoc = [8925,23433];
_markerShape = "ELLIPSE";
_markerColor = "ColorRed";
_markerBrush = "DiagGrid";
_markerSize = [175,175];

// Create Marker
_marker = createMarker ["Marker",_markerLoc];
"Marker" setMarkerShape _markerShape;
"Marker" setMarkerSize _markerSize;
"Marker" setMarkerColor _markerColor;
"Marker" setMarkerBrush _markerBrush;


_hostiles = [];
_objectives = [];
// Spawn enemies
_enemies1 = [_markerLoc,1,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = units _enemies1 + _hostiles;
_enemies2 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies2;
_enemies3 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies3;

_car1 = "O_APC_Tracked_02_cannon_F" createVehicle [(_markerLoc select 0) + round random 75, (_markerLoc select 1) + round random 75]; _objectives = _objectives + [_car1];
_car1 lock true;
_car2 ="O_APC_Tracked_02_cannon_F" createVehicle [(_markerLoc select 0) - round random 75, (_markerLoc select 1) - round random 75]; _objectives = _objectives + [_car2];
_car2 lock true;

// Gegnerzahl bestimmen
_enemyCount = {alive _x;} count _hostiles;
player sideChat format["%2 Gegnerzahl: %1",_enemyCount,_missionText];

_objectivesRemaining = {damage _x < 1 ;} count _objectives;

//Warte bis objectives erfüllt
while {_objectivesRemaining > 0 } do{
    player sideChat format["Gegner: %1 , Objectives : %2",_enemyCount,_objectivesRemaining];
    _enemyCount =  {alive _x;} count _hostiles;
    _objectivesRemaining = {damage _x < 1 ;} count _objectives;
    sleep 1;
};

player sideChat "Mission erfolgreich. Dein Team erhält $25'000!";
money = money + 25000;
publicVariable "money";
task = 0;
publicVariable "task";
lastTask = "12";
publicVariable "lastTask";

sleep 300;

// Delete Groups
deleteGroup _enemies1;
deleteGroup _enemies2;

// Despawn Objects
deleteVehicle _car1; 
deleteVehicle _car2;
{
    deleteVehicle _x
}foreach _hostiles;

deleteMarker "Marker";


