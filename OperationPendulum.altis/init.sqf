call compile preprocessFileLineNumbers "functions\networkFunctionBG.sqf"; 
call compile preprocessFileLineNumbers "functions\networkFunctions.sqf"; 


configStartMoney = 250000000;


if(isServer) then {
    money = configStartMoney;
    
    // Initialisierung
    task = 0;
    lastTask = 0;
    padStatus =[0,0,0];
    
    publicVariable "money"; publicVariable "task"; publicVariable "lastTask",publicVariable "lastTask";
};