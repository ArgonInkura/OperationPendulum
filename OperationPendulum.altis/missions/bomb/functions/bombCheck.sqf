private ["_bombs"];
_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_bombs = [_object];

player playAction "Medic";

player sideChat "Untersuche Auto...";
sleep 20;

if(_object in _bombs)then {
    player sideChat "Dieses Auto ist auffällig verdrahtet und weist deutliche Zeichen für eine Bombe auf!";
    _object removeAction _id;
    _object addAction ["Entschärfen","missions\bomb\functions\defuse.sqf",_object];
}else{
    player sideChat "Nichts verdächtiges gefunden!";
    _object removeAction _id;
};