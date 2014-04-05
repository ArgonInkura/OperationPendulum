// Executed on all machines.
oppSideChatAll = {
    private ["_text"];

    _text = _this select 0;

    player sideChat _text;
};