_target = _this;
_caller = missionNamespace getVariable["bis_fnc_moduleRemoteControl_unit", player];
_animState = animationState _caller;
_target setVariable ["Wbk_LoadProgress",true,true];
[_caller,["Acts_TerminalOpen", 0, 0.2, false]] remoteExec ["switchMove",0];
[_target, 4] remoteExec ["BIS_fnc_dataTerminalAnimate",_target];
uisleep 6.1;
if (!(alive _caller) or (animationState _caller != "Acts_TerminalOpen")) exitWith {[_target, 0] remoteExec ["BIS_fnc_dataTerminalAnimate",_target]; _target setVariable ["Wbk_LoadProgress",nil,true];};
[_caller,[_animState, 0, 0.2, false]] remoteExec ["switchMove",0];
_target setVariable ["WBK_DownloadAmount",0,true];
uiSleep 0.2;
_target remoteExec ["MyMission_fnc_transmit_progress",[0, -2] select isDedicated];
_veh = createSoundSource ["Topic_Selection", getPosATL _target, [], 0]; 
while {
	alive _target &&
	(_target getVariable "WBK_DownloadAmount") < 100 &&
	(({((_x distance _target) <= 10)} count allPlayers) > 0)
} do {
	_WBK_DownloadAmount = _target getVariable "WBK_DownloadAmount";
	_WBK_NewDownloadAmount = _WBK_DownloadAmount + ({((_x distance _target) <= 10)} count allPlayers);
	_target setVariable ["WBK_DownloadAmount",_WBK_NewDownloadAmount,true];
	uisleep 2;
};
[_target, 0] remoteExec ["BIS_fnc_dataTerminalAnimate",_target];
_WBK_DownloadAmount = _target getVariable "WBK_DownloadAmount";
_target setVariable ["WBK_DownloadAmount",nil,true];
deleteVehicle _veh;
if (_WBK_DownloadAmount < 100) exitWith {
	uisleep 0.1;
	_target setVariable ["Wbk_LoadProgress",nil,true];
};
_target setVariable ["WBK_DownloadFinished",true,true];