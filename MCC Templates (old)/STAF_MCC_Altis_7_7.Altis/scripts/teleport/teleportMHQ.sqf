//this addAction ["Teleport -destinationName","teleportMHQ.sqf",[objectName]];

// Get the destination.
_dest = (_this select 3) select 0;

// Get a random direction
_dir = random 359;

// Move the person a few meters away from the destination (in the direction of _dir)
player SetPos [(getPos _dest select 0)-5*sin(_dir),(getPos _dest select 1)-5*cos(_dir)];
