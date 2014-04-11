private ["_init"];
_loc = _this select 0;
_type = _this select 1; // Group Type	0= Infantry, 1= Anti-Air, 2=Anti-Armor, 3=Light armor, 4 = Heavy Armor
_size = _this select 2;	// Group Size : 0= Small; 1 = Medium; 2=Big
_skill = _this select 3;
_ups = _this select 4;



if(_ups)then{
    _init = "nul = [this,'Marker','showmarker','random'] execVM 'UPS\ups.sqf'";
}else{
    _init ="";
};

_enemies = createGroup east;

switch(_type)do{
    // Infantry
    case 1: {
        switch(_size)do{
		    case 1: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"]; 
		    };
		    case 2: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    };
		    case 3: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    }; 
		};
    };
    // Anti-Air
    case 2: {
        switch(_size)do{
		    case 1: {
                "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AA_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    };
		    case 2: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AA_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_AA_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    };
		    case 3: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AA_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_AA_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    }; 
		};
    };
    // Anti-Tank
   	case 3: {
        switch(_size)do{
		    case 1: {
                "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_LAT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    };
		    case 2: {
                "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_LAT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_LAT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    };
		    case 3: {
		        "O_Soldier_F" createUnit [ _loc, _enemies, _init, _skill, "SERGEANT"];
		        "O_Soldier_AT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_AT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_LAT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_LAT_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
                "O_Soldier_F" createUnit [ _loc, _enemies, "", _skill, "PRIVATE"];
		    }; 
		};
    };
    // Light-Armor
   	case 4: {
        switch(_size)do{
		    case 1: {
		        
		    };
		    case 2: {
		        
		    };
		    case 3: {
		        
		    }; 
		};
    };
    // Heavy-Armor
   	case 5: {
        switch(_size)do{
		    case 1: {
		        
		    };
		    case 2: {
		        
		    };
		    case 3: {
		        
		    }; 
		};
    };
};

_enemies