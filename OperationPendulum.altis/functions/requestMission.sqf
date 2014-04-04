_caller = _this select 1;
if(task != 0) then {
    hint "Du hast bereits eine Mission!";
}else{
    hint format["Test! %1 ",_caller];
    _caller sideChat "Dein Squad wurde in Bereitschaft versetzt!";
    sleep floor random 150;
    _caller sideChat "Dein Squad hat eine Mission erhalten!";
    
};