// Executed on all machines.
oppSideChatAll = {
    private ["_text"];

    _text = _this select 0;

    player sideChat _text;
};


oppsideChatGroup = {
    private ["_text", "_group"];

    _text = _this select 0;
    _group = _this select 1;

    if(group player == _group){
        player sideChat _text;
    }
};