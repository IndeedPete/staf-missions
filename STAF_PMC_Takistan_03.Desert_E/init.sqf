// TFR
tf_no_auto_long_range_radio = true;
tf_same_sw_frequencies_for_side = true;
tf_give_personal_radio_to_regular_soldier = true;
tf_same_lr_frequencies_for_side = true;
tF_give_microdagr_to_soldier = false;
tF_speakerDistance = 30;

// Disable Saving and Auto Saving
enableSaving [false, false];

// Mute Orders and Reports
enableSentences false;

//_________________________________________Scripts_________________________________________//

// Interior Light
[] spawn STAF_fnc_intLight;

// Weather
[] spawn {
	((60 * 60) - time) setOvercast 0;
};


// [fog,overcast,use ppEfx,allow rain,force wind,vary fog,use wind audio,EFX strength]
//MKY_arSandEFX = [0,"",true,false,true,true,true,(paramsArray select 0)];
// init the EFX scripts
[] spawn {
	waitUntil {!(isNil "IP_Sandstorm") && {IP_Sandstorm}};
	nul = [] execVM "MKY\MKY_Sand_Snow_Init.sqf";
};