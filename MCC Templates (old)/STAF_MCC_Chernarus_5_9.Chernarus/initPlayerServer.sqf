_trg_loc = [13562.5,4762.49,0];
_kill_size = 45;
_trg = createTrigger [ "EmptyDetector", _trg_loc ];
_trg setTriggerArea [ _kill_size, _kill_size, 0, false ];
_trg setTriggerActivation [ "ANY", "PRESENT", false ];
_trg setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg, [], _kill_size ];

_trg1_loc = [13515.8,4766.65,0];
_kill1_size = 3;
_trg1 = createTrigger [ "EmptyDetector", _trg1_loc ];
_trg1 setTriggerArea [ _kill1_size, _kill1_size, 0, false ];
_trg1 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg1 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg1, [], _kill1_size ];
