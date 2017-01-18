_trg_loc = [19082.7,18593.1,0];
_kill_size = 15;
_trg = createTrigger [ "EmptyDetector", _trg_loc ];
_trg setTriggerArea [ _kill_size, _kill_size, 0, false ];
_trg setTriggerActivation [ "ANY", "PRESENT", false ];
_trg setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg, [], _kill_size ];

_trg1_loc = [19077.8,18629.7,0];
_kill1_size = 2;
_trg1 = createTrigger [ "EmptyDetector", _trg1_loc ];
_trg1 setTriggerArea [ _kill1_size, _kill1_size, 0, false ];
_trg1 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg1 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg1, [], _kill1_size ];

_trg2_loc = [19015.7,18612,0];
_kill2_size = 15;
_trg2 = createTrigger [ "EmptyDetector", _trg2_loc ];
_trg2 setTriggerArea [ _kill2_size, _kill2_size, 0, false ];
_trg2 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg2 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg2, [], _kill2_size ];

_trg3_loc = [18888.1,18629.9,0];
_kill3_size = 20;
_trg3 = createTrigger [ "EmptyDetector", _trg3_loc ];
_trg3 setTriggerArea [ _kill3_size, _kill3_size, 0, false ];
_trg3 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg3 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg3, [], _kill3_size ];
