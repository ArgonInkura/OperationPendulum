_caller = _this select 1;
if(task != 0) then {
    hint "Du hast bereits eine Mission!";
}else{
    
    ["Dein Squad wurde in Bereitschaft versetzt!"] call oppSideChatAllAll;
    //sleep floor random 150;
    ["Deinem Squad wurde eine Mission zugeteilt!"] call oppSideChatAllAll;
    
    execVM "missions\secure\1.sqf";
    
};