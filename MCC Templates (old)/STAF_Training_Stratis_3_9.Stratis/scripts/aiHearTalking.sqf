//Written by beta and Krause for ACRE, converted to TFAR by JonBons
//AI can hear you talk on TFAR
//version 2

private ["_nearAI", "_revealAmount", "_sideUnit", "_nearAISingle", "_sideAI", "_sideUnits", "_inContact", "_enemyInContact", "_talkTime", "_dist"];

_talkTime = 0;

b_hasRadioCheck =
{
    private ["_nearAISingle", "_result"];

    _nearAISingle = _this select 0;

    _result = false;

    // find SW radios
    {
        if (_x call TFAR_fnc_isRadio) exitWith {_result = true};
    } count (assignedItems _nearAISingle);

    if (!_result) then {
        _result = count (_nearAISingle call TFAR_fnc_lrRadiosList) > 0;
    };

    _result
};

sleep 5;  //wait for init

waitUntil
{
    if (player getVariable ["tf_isSpeaking", false]) then
    {
        _talkTime = _talkTime + 0.25;

        if (_talkTime >= 1.0) then
        {
            _dist = TF_speak_volume_meters;
            _nearAI = nearestObjects [player, ["Man"], _dist];
            _nearAI = _nearAI - [playableUnits];

            {
                if ((alive _x) && (_x knowsAbout player < 1.0) && !(_x knowsAbout player >= 4.0)) then
                {
                    _nearAISingle = _x;
                    _sideAI = side _nearAISingle;
                    _sideUnits = [];
                    _inContact = false;

                    //AI hears talking
                    _revealAmount = 1.0;

                    //Command and control checks
                    if ([_nearAISingle] call b_hasRadioCheck) then {

                        _revealAmount = _revealAmount + 1.0;
                        //AI has a radio
                        {
                            if ((side _x == _sideAI) && !(isplayer _x)) then {
                                _sideUnits = _sideUnits + [_x];
                            };
                        } foreach allunits;

                    {
                      _sideUnit = _x;

                      {
                        if ((_sideUnit knowsAbout _x > 2) && ([_nearAISingle] call b_hasRadioCheck)) exitWith {
                            _inContact = true;
                            _revealAmount = _revealAmount + 1.0;
                            //AI has radio link to other troops in contact
                        };

                      } foreach playableunits;

                    } foreach _sideUnits;


                    };

                    if (!isNull ((leader (group _nearAISingle)) findNearestEnemy (getPos leader (group _nearAISingle)))) then {

                        _enemyInContact = (leader (group _nearAISingle)) findNearestEnemy (getPos leader (group _nearAISingle));

                        if (_enemyInContact distance _nearAISingle < 2000) then {
                            _revealAmount = _revealAmount + 1.0;
                            //AI is already in contact with enemy
                        };
                    };

                    //hint format["%1 hears you, for %2", _x, _revealAmount];
                    [0, {(_this select 0) reveal (_this select 1);}, [_nearAISingle, [player, _revealAmount]]] call CBA_fnc_globalExecute;
                };
            } forEach _nearAI;
        };
    }
    else
    {
        if (_talkTime > 0) then { _talkTime = 0; };
    };

    sleep 0.25;

    false
};