// [EVO] Dan's vehicle respawn script
// Its very basic, but that should hopefully improve performance
// Takes into account changes that have been made to the scripting library
// Will run only on the server, as it only needs to run in one place, but obviously can be used in both singleplayer and multiplayer

_vehicle = _this select 0; //get vehicle's details
_respawntime = _this select 1; //get the init set respawn time
_facingofvehicle = getDir _vehicle; //get original facing
_positionofvehicle = getPosATL _vehicle; //get original position
_vehicletype = typeOf _vehicle; //get the vehicle type
_n = 1;

if(isServer) then{
	while{_n == 1} do{
		if((!alive _vehicle) || (!canMove _vehicle)) then { 
			sleep 240; 
			deleteVehicle _vehicle; 
			sleep _respawntime; 
			_vehicle = _vehicletype createVehicle _positionofvehicle; 
			_vehicle setPosATL _positionofvehicle; 
			_vehicle setDir _facingofvehicle; 
			[[[_vehicle,_respawntime],"functions\vehicle_respawn.sqf"],"BIS_fnc_execVM",false,false] spawn BIS_fnc_MP; //replacement for the old setVehicleInit, this does the same and causes the new vehicle to have the respawn script when created
			_n = 0; 
		};
		sleep 60; 
	};
};