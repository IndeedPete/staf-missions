// Set some fog.
[0.1, 0.01, 0] remoteExecCall ["BIS_fnc_setFog", 0, true];

// PPEffects
["ColdTone"] remoteExecCall ["IP_fnc_setPPEffect", 0, true]; // Possible Effects: "BrightSnow", "EastWind", "FilmNoir", "SurferClear", "SurferBlue" - add more in cfg\ppEffects.hpp.
