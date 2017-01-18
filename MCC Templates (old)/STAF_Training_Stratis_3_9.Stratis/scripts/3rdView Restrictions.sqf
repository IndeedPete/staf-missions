///3rdView Restrictions Ver2.0///

if !(isDedicated) then { //preventing start on server

    waitUntil {!(isNull(findDisplay 46))}; //making sure player is spawned

    if (difficultyOption "thirdPersonView" == 1) then
    {
        while {true} do {
            waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};

            if  (((vehicle player) == player) && (speed ( player)) >= 2) then {
                player switchCamera "INTERNAL";
            };
            sleep 0.1;

            if (((vehicle player)isKindOf "LandVehicle") && (speed (vehicle player)) >= 2) then {
                (vehicle player) switchCamera "Internal";
            };
            sleep 0.1;

            if ((vehicle player) isKindOf "Air" && (getPosATL (vehicle player) select 2) > 40)then {
                (vehicle player) switchCamera "Internal";
            };
            sleep 0.1;

            if (((vehicle player)isKindOf "Ship") && (speed (vehicle player)) >= 2) then {
                (vehicle player) switchCamera "Internal";
            };
            sleep 0.1;
        };
    };
};
