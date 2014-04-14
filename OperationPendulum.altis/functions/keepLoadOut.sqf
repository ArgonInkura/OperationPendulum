_players = playableUnits;

Mis_respawn = {
_dplayer = _this select 0;

/////weapons and junk\\\\\
MYweapons = weapons _dplayer;
MYprimw = primaryWeapon _dplayer;
MYprimaryammo = primaryWeaponMagazine _dplayer;
Myweaponacc = primaryWeaponItems _dplayer;

///2ndary\\\\
MYsecond = secondaryWeapon _dplayer;
MYsecondacc = secondaryWeaponItems _dplayer;
MYsecondammo = secondaryWeaponMagazine _dplayer;

////handgun
Myhgun = handgunWeapon _dplayer; 
Myhgunacc = handgunItems _dplayer; 
Myhgunammo = handgunMagazine _dplayer; 

///// mags and ammo \\\
//MYmagazines = magazines _dplayer;
MYitemsplayer = itemsWithMagazines _dplayer;
ALLMYmagazines = MYprimaryammo + Myhgunammo + MYsecondammo;


/// uniform and extra \\\
MYuniform = uniform _dplayer; 
MYbackpack = backpack _dplayer; 
MYvest = vest _dplayer;
MYhead   = headgear _dplayer; 
MYeyes  = goggles _dplayer; 
MYacc   = assignedItems _dplayer;
MyAEI = MYitemsplayer - ALLMYmagazines; 

_rspn = _dplayer addMPEventHandler ["MPRespawn", {
_player = _this select 0; 
removeAllWeapons _player;
{_player removeMagazine _x} forEach ALLMYmagazines;
removeAllItemsWithMagazines _player; 
removeUniform _player; 
removeVest _player;
removeBackpack _player;
removeGoggles _player; 
removeAllAssignedItems _player;
removeHeadgear _player;
//{_player removeItemFromBackpack _x;} forEach itemCargo MYbackpack;

_p = _player;
_p addBackpack MYbackpack;
_p addUniform MYuniform;
_p addVest MYvest;
_p addHeadgear MYhead;
_p addGoggles MYeyes;

{_p addItem _x; _p assignItem _x;} forEach MYacc;

{if (_p canAddItemToUniform _x ) then {(uniformContainer _p) addItemCargo [_x, 1]}} forEach MyAEI;

_hmag = Myhgunammo select 0;
if (_p canAddItemToVest _hmag) then {(vestContainer _p) addMagazineCargo [_hmag, 6]};
_a = 0;
while {_a <= 5}  do {
_mag = MYprimaryammo select 0;
if (_p canAddItemToUniform _mag ) then {(uniformContainer _p) addMagazineCargo [_mag, 1]; _a = _a + 1};
if (_p canAddItemToVest _mag) then {(vestContainer _p) addMagazineCargo [_mag, 1];_a = _a + 1};
if (_p canAddItemToBackpack _mag) then {(backpackContainer _p) addMagazineCargo [_mag, 1];_a = _a + 1};//};
};
   
{_p addWeapon _x} forEach MYweapons;
_primw = primaryWeapon _p;
{_p addPrimaryWeaponItem _x} forEach Myweaponacc;
{_p addSecondaryWeaponItem _x} forEach MYsecondacc;
{_p addHandgunItem _x} forEach Myhgunacc;
}];
};
{_x addEventHandler ["killed", {
[_this select 0] spawn Mis_respawn}];} forEach _players;



