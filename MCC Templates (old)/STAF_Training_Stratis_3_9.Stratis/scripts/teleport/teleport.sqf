// To use: Add this script as an action on an item in it's init field. EG:
//
//this addAction ["Teleport - Talon","teleport.sqf",["FOB_Talon"]];
//this addAction ["Teleport - Base","teleport.sqf",["Base"]];
//this addAction ["Teleport - Airfield","teleport.sqf",["Airstrip"]];

// Where "Teleport - Base" is what the action will read and ["Base"] is the name of a pre-placed marker.

// Get the destination.
_dest = (_this select 3) select 0;

// Get a random direction
_dir = random 359;

// Move the person 15 meters away from the destination (in the direction of _dir)
player SetPos [(getMarkerPos _dest select 0)-10*sin(_dir),(getMarkerPos _dest select 1)-10*cos(_dir)];