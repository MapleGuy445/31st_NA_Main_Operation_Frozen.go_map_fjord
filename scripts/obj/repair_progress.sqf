if (isDedicated) exitWith {};
WBK_IconAngle = 0;
_WBK_UploadTimer = [{
	_unit = (_this select 0) select 0;
	if ((positionCameraToWorld [0,0,0]) distance _unit > 50) exitWith {};
	private _oldTickTime 	= missionNamespace getVariable ["BIS_downloadObject_lastTickTime", time];
	private _newTickTime 	= time;
	private _deltaTime		= _newTickTime - _oldTickTime;
	missionNamespace setVariable ["BIS_downloadObject_lastTickTime", _newTickTime];
	_lastAngle = WBK_IconAngle;
	_newAngle  = _lastAngle  - (720.0 * _deltaTime);
	WBK_IconAngle = _newAngle;
	_iconColor = [0.8, 1.0, 0.8, 0.5];
	_iconAngle = _newAngle;
	_iconPosition 	= [getPosATL _unit # 0,getPosATL _unit # 1, (getPosATL _unit # 2) + 0.2];
	_text = "Repairing: " + str (_unit getVariable "WBK_DownloadAmount") + "/ 100";
	drawIcon3D ["\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",  [0.8, 1.0, 0.8, 0.5], _iconPosition, 1.1, 1.1, _iconAngle, _text, 0, 0.03, "PuristaLight"];
	{
		if ((_x distance _iconPosition) <= 10) then {
			drawIcon3D ["A3\Ui_f\data\Map\GroupIcons\badge_rotate_0_gs.paa",  [0.8, 1.0, 0.8, 0.5], _x modelToWorldVisual (_x selectionPosition "Spine3"), 1.1, 1.1, 0, "", 0, 0.03, "PuristaLight"];
			drawLine3D [_iconPosition, _x modelToWorldVisual (_x selectionPosition "Spine3"), [0.8, 1.0, 0.8, 0.3]];
		};
	} forEach allPlayers;
}, 0, [_this]] call CBA_fnc_addPerFrameHandler;
waitUntil {
	if (isNull _this) exitWith { true };
	isNil {_this getVariable "WBK_DownloadAmount"};
};
[_WBK_UploadTimer] call CBA_fnc_removePerFrameHandler;