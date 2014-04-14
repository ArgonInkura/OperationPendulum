// Kore
private["_enemyCount"];

_missionLoc = "Syrta";
_missionText = "Eliminieren Sie alle feindlichen Einheiten in Kore!";
currentTaskText = _missionText;
publicVariable "currentTaskText";

_markerLoc = [7236,16363];
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
_enemies5 = createGroup east;
_enemies6 = createGroup east;
// Spawn enemies
_enemies1 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = units _enemies1 + _hostiles;
_enemies2 = [_markerLoc,1,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies2;
_enemies3 = [_markerLoc,1,2,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf"; _hostiles = _hostiles + units _enemies3;
_enemies4 = [_markerLoc,1,3,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
_hostiles =_hostiles + (units _enemies4);
if(random 1 > 0.75) then {
    _enemies5 = [_markerLoc,2,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
    _hostiles =_hostiles + (units _enemies5);
    _enemies6 = [_markerLoc,2,1,0.2,true] call compile preprocessFileLineNumbers "functions\spawnGroup.sqf";
    _hostiles =_hostiles + (units _enemies6);
};

_enemyCount = {alive _x;} count _hostiles;
_text = format["%2 Gegnerzahl: %1",_enemyCount,_missionText];
[_text, group player] call oppsideChatGroupAll;

while {_enemyCount > 0 } do{
    player sideChat format["Gegner: %1",_enemyCount];
    _enemyCount =  {alive _x;} count _hostiles;
    sleep 1;
};

["Mission erfolgreich. Dein Team erhält $25'000!", group player] call oppsideChatGroupAll;
money = money + 25000;
publicVariable "money";
task = 0;
publicVariable "task";
lastTask = "12";
publicVariable "lastTask";
currentTaskText = "In Bereitschaft";
publicVariable "currentTaskText";

sleep 300;

deleteGroup _enemies1;
deleteGroup _enemies2;
deleteGroup _enemies3;
deleteGroup _enemies4;
deleteGroup _enemies5;
deleteGroup _enemies6;

{
    deleteVehicle _x
}foreach _hostiles;

deleteMarker "Marker";