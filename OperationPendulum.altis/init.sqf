call compile preprocessFileLineNumbers "functions\networkFunctionBG.sqf"; 
call compile preprocessFileLineNumbers "functions\networkFunctions.sqf"; 


configStartMoney = 250000000;


// Show Status link
player addaction ["Show Status","functions\showStatus.sqf",1,0,true,false,"","player ==_target"];  

if(isServer) then {
    money = configStartMoney;
    
    // Initialisierung
    task = 0;
    lastTask = 0;
    padStatus =[0,0,0];
    spotStatus =[0,0];
    publicVariable "money"; publicVariable "task"; publicVariable "lastTask",publicVariable "lastTask";
      
};
 // Load IED script 
 [] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};
 
 // Load LoadOut saver
  [] execVM "functions\keepLoadOut.sqf";


//Constants
CGROUP_SMALL =1;
CGROUP_MEDIUM =2;
CGROUP_BIG = 3;

CGROUP_INFANTRY = 1;
CGROUP_AA = 2;
CGROUP_AT = 3;
CGROUP_LARMOR = 4;
CGROUP_ARMOR = 5;




