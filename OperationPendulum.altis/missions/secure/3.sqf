// Syrta
private["_enemyCount"];

_missionLoc = "Syrta";
_missionText = "Eliminieren Sie alle feindlichen Einheiten in Syrta!";

_markerLoc = [8623.6,18280.1];
_markerShape = "ELLIPSE";
_markerColor = "ColorRed";
_markerBrush = "DiagGrid";
_markerSize = [400,400];

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
_enemies2 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies2;
_enemies3 = [_markerLoc,1,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies3;
if(random 1 > 0.75) then {
    _enemies4 = [_markerLoc,2,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
    _hostiles =_hostiles + (units _enemies4);
};

_enemyCount = {alive _x;} count _hostiles;
[format["%2 Gegnerzahl: %1",_enemyCount,_missionText], player group] call oppsideChatGroupAll;

while {_enemyCount > 0 } do{
    player sideChat format["Gegner: %1",_enemyCount];
    _enemyCount =  {alive _x;} count _hostiles;
    sleep 1;
};

["Mission erfolgreich. Dein Team erhält $25'000!", player group] call oppsideChatGroupAll;
money = money + 25000;
publicVariable "money";
task = 0;
publicVariable "task";
lastTask = "13";
publicVariable "lastTask";

sleep 300;

deleteGroup _enemies1;
deleteGroup _enemies2;
deleteGroup _enemies3;
deleteGroup _enemies4;


{
    deleteVehicle _x
}foreach _hostiles;

deleteMarker "Marker";