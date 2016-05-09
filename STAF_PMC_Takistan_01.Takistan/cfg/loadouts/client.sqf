comment "Exported from Arsenal by IndeedPete";

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "U_NikosAgedBody";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_elasticBandage";};
_this addItemToUniform "ACE_morphine";
for "_i" from 1 to 8 do {_this addItemToUniform "ACE_packingBandage";};
_this addItemToUniform "ACE_tourniquet";
_this addVest "V_TacVest_blk";
for "_i" from 1 to 30 do {_this addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_this addItemToVest "ACE_tourniquet";};
for "_i" from 1 to 3 do {_this addItemToVest "ACE_personalAidKit";};
for "_i" from 1 to 30 do {_this addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 2 do {_this addItemToVest "ACE_morphine";};
for "_i" from 1 to 2 do {_this addItemToVest "ACE_epinephrine";};
_this addHeadgear "H_Hat_blue";
_this addGoggles "G_Squares_Tinted";

comment "Add weapons";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
/*
comment "Set identity";
_this setFace "WhiteHead_03";
_this setSpeaker "ACE_NoVoice";
*/