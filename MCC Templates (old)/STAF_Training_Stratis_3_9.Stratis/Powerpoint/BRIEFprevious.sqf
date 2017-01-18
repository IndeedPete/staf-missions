if (slideIndex == 1) then {slideIndex = slides};
slideIndex = (slideIndex -1);
_slide = slideArray select slideIndex;

[[bigScreen, [0, _slide]], "BRIEF_setObjectTextureGlobal", true, true] call BIS_fnc_mp;  