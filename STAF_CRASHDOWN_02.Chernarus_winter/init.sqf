//_________________________________________Mission Settings_________________________________________//

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
nul = [] execVM "scripts\IntLight.sqf";

[] spawn {
	((30 * 60) - time) setOvercast 0.5;
};