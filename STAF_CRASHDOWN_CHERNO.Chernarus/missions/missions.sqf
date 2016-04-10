{
	call(compile(preprocessFileLineNumbers(format ["missions\%1.sqf", _x])));
} forEach [
	"M00", // Zones
	"M01", // IED Clearing
	"M02", // Airfield
	"M03", // Attack Syrta
	"M04" // Neutralise Attack Helicopter
];