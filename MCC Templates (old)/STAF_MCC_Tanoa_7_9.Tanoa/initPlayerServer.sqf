_trg_loc = [8884.71,4012.44,0];
_kill_size = 25;
_trg = createTrigger [ "EmptyDetector", _trg_loc ];
_trg setTriggerArea [ _kill_size, _kill_size, 0, false ];
_trg setTriggerActivation [ "ANY", "PRESENT", false ];
_trg setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg, [], _kill_size ];

_trg1_loc = [8828.56,4036.47,0];
_kill1_size = 25;
_trg1 = createTrigger [ "EmptyDetector", _trg1_loc ];
_trg1 setTriggerArea [ _kill1_size, _kill1_size, 0, false ];
_trg1 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg1 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg1, [], _kill1_size ];

_trg2_loc = [8826.98,3954.9,0];
_kill2_size = 2;
_trg2 = createTrigger [ "EmptyDetector", _trg2_loc ];
_trg2 setTriggerArea [ _kill2_size, _kill2_size, 0, false ];
_trg2 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg2 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg2, [], _kill2_size ];

_trg3_loc = [8793.12,4011.61,0];
_kill4_size = 10;
_trg3 = createTrigger [ "EmptyDetector", _trg3_loc ];
_trg3 setTriggerArea [ _kill4_size, _kill4_size, 0, false ];
_trg3 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg3 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg3, [], _kill4_size ];

_trg4_loc = [8774.82,4037.03,0.0760002];
_kill4_size = 10;
_trg4 = createTrigger [ "EmptyDetector", _trg4_loc ];
_trg4 setTriggerArea [ _kill4_size, _kill4_size, 0, false ];
_trg4 setTriggerActivation [ "ANY", "PRESENT", false ];
_trg4 setTriggerStatements [ "this", "", "" ];
{ _x hideObjectGlobal true; } forEach nearestTerrainObjects [ _trg4, [], _kill4_size ];
