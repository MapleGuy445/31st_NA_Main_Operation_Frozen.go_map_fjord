params [
    ["_unit", objNull, [objNull]],
    ["_engageDistance", 30, [0]],
    ["_disableEventDecloak", false, [false]]
];

// Ensure unit is local
if (!local _unit) exitWith {};

// Validate unit and check if it's a UAV
if (isNull _unit || unitIsUAV _unit) exitWith {};

//3DEN and Server check
if (is3DEN || (isServer and !(hasInterface))) exitWith {};

//alive check
if (!alive _unit) exitWith {};

if (!(_unit isKindOf "CAManBase")) exitWith {};

if (_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {}; // if the unit is already cloaked exit

_unit setVariable ["EQPLUS_isCloaked", true, true]; // set cloak variable to true

// Hold fire / stay silent while cloaked & approaching.
if (!isPlayer _unit) then {
    _unit setVariable ["EQPLUS_prevAutoTarget", (_unit checkAIFeature "AUTOTARGET"), true];
    _unit disableAI "AUTOTARGET";
    _unit disableAI "RADIOPROTOCOL";
    _unit setCombatMode "BLUE";
};

[[_unit], {
	_unit = _this#0;

	if (isDedicated) exitWith {};
	if (isServer and !hasInterface) exitWith {};
	if (_unit == player) exitWith {};

	_unit hideObject true;

}] remoteExec ["spawn", 0]; // make the unit invisible


[_unit, { {_x hideObjectGlobal true} forEach attachedObjects _this; }] remoteExec ["call", 2];  // make the unit's attached object invisible

// prevent AI from targeting invisible unit, doesnt work on 'normal units' as they themselves wouldnt do anything then
[_unit, true] remoteExec ["setCaptive", 0];



_MeleeExceptionUnits = [
	"O_soldier_Melee",
	"B_soldier_Melee",
	"B_soldier_Melee_fists",
	"B_soldier_Melee_RUSH_fists",
	"B_soldier_Melee_Hybrid",
	"B_soldier_Melee_RUSH",
	"IMS_Elite_Melee_1",
	"IMS_Elite_Melee_2",
	"O_soldier_Melee_fists",
	"O_soldier_Melee_RUSH_fists",
	"O_soldier_Melee_Hybrid",
	"O_soldier_Melee_RUSH"
];

_EliteExceptionUnits = [
	"OPTRE_Jackal_SpecOps2_F",
	"OPTRE_Jackal_SpecOps3_F",
	"OPTRE_Jackal_SpecOps_F",
	"OPTRE_FC_Elite_SpecOps",
	"OPTRE_FC_Elite_SpecOps2",
	"OPTRE_FC_Elite_SpecOps4",
	"OPTRE_FC_Elite_SpecOps3",
	"OPTRE_FC_Elite_SpecOps_IND",
	"OPTRE_FC_Elite_SpecOps2_IND",
	"OPTRE_FC_Elite_SpecOps3_IND"
];

EQPLUS_SpecOpsEliteunits_array = [];
EQPLUS_SpecOpsEliteunits_array append _EliteExceptionUnits;
EQPLUS_SpecOpsEliteunits_array append _MeleeExceptionUnits;

_unit setCaptive true;

// prevent AI from targeting invisible unit, doesnt work on 'normal units' as they themselves wouldnt do anything then
if ((typeOf _unit in EQPLUS_SpecOpsEliteunits_array) || (({ _unit isKindOf _x } count EQPLUS_SpecOpsEliteunits_array) > 0) ) then {
	if !((typeOf _unit in _MeleeExceptionUnits) || (({ _unit isKindOf _x } count _MeleeExceptionUnits) > 0) ) then {
		_unit setCaptive true;
	};
} else {
	if !((typeOf _unit in _MeleeExceptionUnits) || (({ _unit isKindOf _x } count _MeleeExceptionUnits) > 0) ) then {
		_unit setCaptive true;
	} else {
		_unit setCaptive false;
	};
};


// play cloak in sound
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
				"ActiveCamo_UNSC_1",
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

	_source spawn {sleep 19; deleteVehicle _this;}; // wait and delete source
};

// create cloak transition particles
[_unit] remoteExec ["EQPLUS_fnc_cloakTransition", 0, false];

// create cloak particles
[_unit] remoteExec ["EQPLUS_fnc_cloakParticles", 0, false];


//EH for decloaking when hit, shooting, or dead
if (EQPLUS_DecloakOnRunning) then {

	[_unit] spawn {
		params ["_unit"];

		waitUntil {( ((EQPLUS_DecloakOnRunning) and (speed _unit > 17)) or !(_unit getVariable ["EQPLUS_isCloaked", false]) )};

		if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};

		[_unit] call MyMission_fnc_cloakOff;
	};
};

// Proximity-engage watcher: while cloaked & holding fire, periodically check
// the distance to the nearest hostile. Once one is within _engageDistance
// metres, decloak and let it fight - it will not go back to holding
// fire/cloak even if that enemy retreats afterwards.
if (_engageDistance > 0) then {

	[_unit, _engageDistance] spawn {
		params ["_unit", "_engageDistance"];

		private _checkInterval = 1; // seconds between distance checks
		private _triggered = false;

		while {!_triggered && !isNull _unit && alive _unit && (_unit getVariable ["EQPLUS_isCloaked", false])} do {
			private _nearbyUnits = (_unit nearEntities ["CAManBase", _engageDistance + 5]) - [_unit];
			private _nearestHostileDist = -1;

			{
				if (alive _x && {!captive _x} && {side _x != side _unit} && {[side _unit, side _x] call BIS_fnc_sideIsEnemy}) then {
					private _d = _unit distance _x;
					if (_nearestHostileDist < 0 || {_d < _nearestHostileDist}) then {
						_nearestHostileDist = _d;
					};
				};
			} forEach _nearbyUnits;

			if (_nearestHostileDist >= 0 && _nearestHostileDist <= _engageDistance) then {
				_triggered = true;

				if (!isPlayer _unit) then {
					_unit enableAI "AUTOTARGET";
					_unit enableAI "RADIOPROTOCOL";
					_unit setCombatMode "RED";
				};

				[_unit] call MyMission_fnc_cloakOff;
			};

			if (!_triggered) then {
				sleep _checkInterval;
			};
		};
	};
};


if (!_disableEventDecloak) then {
	[[_unit], {
		params ['_unit'];

		_unit addEventHandler ["Fired", {
			_params = (_this);
			_unit = ((_params) select 0);

			if (typeName _unit == "ARRAY") exitWith { };

			if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};
			[_unit] call MyMission_fnc_cloakOff;
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		}];

		if !(isPlayer _unit) then {
			_unit addEventHandler ["FiredNear", {
				params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

				if (typeName _unit == "ARRAY") exitWith { };

				if (_firer != _unit) then {

					if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};
					[_unit] call MyMission_fnc_cloakOff;
					_unit removeEventHandler [_thisEvent, _thisEventHandler];
				};
			}];
		};

		_unit addEventHandler ["HitPart",{
			(_this select 0) params ["_target","_shooter","_bullet","_position","_velocity","_selection","_ammo","_direction","_radius","_surface","_direct"];

			if (typeName _unit == "ARRAY") exitWith { };
			if !(_target getVariable ["EQPLUS_isCloaked", false]) exitWith {};

			if ( ((str (side _shooter) == "CIV") and (((currentWeapon _shooter) == ""))) or (captive _shooter)) exitWith {};
			if ( ( !([(side _shooter), (side _target)] call BIS_fnc_sideIsEnemy) and (str (side _target) != "CIV")) or (captive _target)) exitWith {};

			[_target] call MyMission_fnc_cloakOff;
			_target removeEventHandler [_thisEvent, _thisEventHandler];
		}
		];

		_unit addEventHandler ["Suppressed", {
			params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

			if (isPlayer _unit) exitWith { _unit removeEventHandler [_thisEvent, _thisEventHandler] }; //exclude players
			if ( ((str (side _shooter) == "CIV") and (((currentWeapon _shooter) == ""))) or (captive _shooter)) exitWith {};
			if ( ( !([(side _shooter), (side _unit)] call BIS_fnc_sideIsEnemy) and (str (side _unit) != "CIV")) or (captive _unit)) exitWith {};

			if (_distance > 50) exitWith {};
			if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};
			[_unit] call MyMission_fnc_cloakOff;
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		}];

		_unit addEventHandler ["AnimChanged", {
			params ["_unit", "_anim"];

			if (typeName _unit == "ARRAY") exitWith { };

			if !(EQPLUS_IMS_SpecialAnims findIf { _anim isEqualTo _x } >= 0) exitWith {};

			if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};

			[_unit] call MyMission_fnc_cloakOff;
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		}];

		_unit addEventHandler ["AnimStateChanged", {
			params ["_unit", "_anim"];

			if (typeName _unit == "ARRAY") exitWith { };

			if !(EQPLUS_IMS_SpecialAnims findIf { _anim isEqualTo _x } >= 0) exitWith {};

			if !(_unit getVariable ["EQPLUS_isCloaked", false]) exitWith {};

			[_unit] call MyMission_fnc_cloakOff;
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		}];

		_unit addEventHandler ["Killed",{
			_Corpse = ((_this) select 0);
			if (typeName _Corpse == "ARRAY") exitWith { };
			_Corpse setVariable ["EQPLUS_isCloaked", false, true];
			_Corpse removeEventHandler [_thisEvent, _thisEventHandler]
		}];

	}] remoteExec ["spawn", [0,-2] select isDedicated, false];
}