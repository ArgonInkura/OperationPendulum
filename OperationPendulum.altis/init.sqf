configStartMoney = 250000;


if(isServer) then {
    money = configStartMoney;
    task = 0;
    lastTask = 0;
    
    publicVariable "money"; publicVariable "task"; publicVariable "lastTask";
};