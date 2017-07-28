// TFR
tf_west_radio_code = "_bluefor";
tf_no_auto_long_range_radio = true;
tf_same_sw_frequencies_for_side = true;
tf_give_personal_radio_to_regular_soldier = true;
tf_same_lr_frequencies_for_side = true;
tF_give_microdagr_to_soldier = false;
tF_speakerDistance = 30;

tfar_west_radio_code = "_bluefor";
tfar_no_auto_long_range_radio = true;
tfar_same_sw_frequencies_for_side = true;
tfar_give_personal_radio_to_regular_soldier = true;
tfar_same_lr_frequencies_for_side = true;
tfar_give_microdagr_to_soldier = false;
tfar_speakerDistance = 30;

// Disable Saving and Auto Saving
enableSaving [false, false];

// Mute Orders and Reports
enableSentences false;

//_________________________________________Scripts_________________________________________//

// Interior Light
[] spawn STAF_fnc_intLight;

// IEDs
[] execVM "EPD\Ied_Init.sqf";

// Le Sandstorm
MKY_arSandEFX = [0, "", true, false, true, true, true, 1];
nul = [] execVM "\STAF_FRAMEWORK\scr\MKY\MKY_Sand_Snow_Init.sqf";