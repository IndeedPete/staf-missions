//_________________________________________ Marker _________________________________________//

	if (isServer) then {
		marker1 = createMarker ["MHQMarker1", position MHQ1];
		"MHQMarker1" setMarkerText "MHQ 1";
		"MHQMarker1" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ1} do {
				"MHQMarker1" setmarkerpos getpos MHQ1;
				sleep 0.5;
			};
		};
	};
	if (isServer) then {
		marker2 = createMarker ["MHQMarker2", position MHQ2];
		"MHQMarker2" setMarkerText "MHQ 2";
		"MHQMarker2" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ2} do {
				"MHQMarker2" setmarkerpos getpos MHQ2;
				sleep 0.5;
			};
		};
	};
	if (isServer) then {
		marker3 = createMarker ["MHQMarker3", position MHQ3];
		"MHQMarker3" setMarkerText "MHQ 3";
		"MHQMarker3" setMarkerType "b_hq";

		[] spawn {
			while {not isnull MHQ3} do {
				"MHQMarker3" setmarkerpos getpos MHQ3;
				sleep 0.5;
			};
		};
	};