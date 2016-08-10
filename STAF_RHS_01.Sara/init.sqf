// TFR
tf_west_radio_code = "_bluefor";
tf_guer_radio_code = "_bluefor";
tf_no_auto_long_range_radio = true;
tf_same_sw_frequencies_for_side = true;
tf_give_personal_radio_to_regular_soldier = false;
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

/*/ Weather
[] spawn {
	((60 * 60) - serverTime) setOvercast 0.5;
};*/