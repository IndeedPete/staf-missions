params [
	"_new",
	"_old"
];

if (_old != ObjNull) then {
	deleteVehicle _old;
};

[_new, false] remoteExec ["hideObjectGlobal", 2];