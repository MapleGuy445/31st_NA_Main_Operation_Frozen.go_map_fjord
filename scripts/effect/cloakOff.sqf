params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};

if (!(_unit getVariable ["EQPLUS_isCloaked", false])) exitWith {}; // already decloaked / never cloaked

_unit setVariable ["EQPLUS_isCloaked", false, true]; // decloak unit

// Restore combat behaviour. cloakOn forces hold-fire (combat mode BLUE +
// AUTOTARGET disabled) while cloaked; whatever the reason for decloaking,
// the unit should be free to fight normally from this point on.
if (!isPlayer _unit) then {
    _unit enableAI "AUTOTARGET";
    _unit enableAI "RADIOPROTOCOL";
    _unit setCombatMode "RED";
};
// create cloak transition particles
[_unit] remoteExec ["EQPLUS_fnc_cloakTransition", 0, false];

// play cloak out sound
if (EQPLUS_playSounds) then {
	private _source = "#particleSource" createVehicle [0,0,0]; // create seperate sound source
	_source attachTo [_unit, [0,0,1]];

	if ((typeOf _unit in EQPLUS_SpecOpsEliteunits_array)
	|| (({
		_unit isKindOf _x
	} count EQPLUS_SpecOpsEliteunits_array) > 0) ) then {
		[_source, ['ActiveCamo_in', 150, (random [0.75, 1, 1.25]), 0, 0, false]] remoteExecCall ["say3D", 0];
	} else {
		if ((typeOf _unit in EQPLUS_UNSCUnits_array)
		|| (({
			_unit isKindOf _x
		} count EQPLUS_UNSCUnits_array) > 0) ) then {
			[_source, [selectRandom [
				"ActiveCamo_UNSC_2",
				"ActiveCamo_UNSC_3",
				"ActiveCamo_UNSC_4"
			], 150, (random [0.75, 1, 1.25]), 0, 0, false]] remoteExecCall ["say3D", 0];
		} else {
			[_source, [selectRandom [
				"EQPLUS_Cloak_1",
				"EQPLUS_Cloak_2",
				"EQPLUS_Cloak_3",
				"EQPLUS_Cloak_4",
				"EQPLUS_Cloak_5",
				"EQPLUS_Cloak_6"
			], 150, (random [0.75, 1, 1.25]), 0, 0, false]] remoteExecCall ["say3D", 0];
		};
	};
	_source spawn {sleep 10; deleteVehicle _this;}; // wait and delete source
};

[[_unit], {
	_unit = _this#0;

	if (isDedicated) exitWith {};
	if (isServer and !hasInterface) exitWith {};
	if (_unit == player) exitWith {};

	_unit hideObject false;

}] remoteExec ["spawn", 0]; // make the unit visible

[_unit, { {_x hideObjectGlobal false} forEach attachedObjects _this; }] remoteExec ["call", 2]; // make the unit's attached objects visible
[_unit, false] remoteExec ["setCaptive", 0];
