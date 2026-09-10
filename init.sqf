//slideshow\brief_intro.jpg,slideshow\icarus.jpg,slideshow\industry.jpg,slideshow\industry_detail.jpg,slideshow\evac_1.jpg,slideshow\evac_2.jpg,slideshow\cov_aa.jpg,slideshow\cov_base.jpg,slideshow\unsc_base.jpg
//BriefLoad,Icarus,Lethbridge Industry, Lethbridge Industry detail, Evacuation Site 1, Evacuation Site 2, Covenant AA, Covenant Base, UNSC Base

_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;

if (isServer) then {
    [
		west, //side assigned to the task
		"obj_secure_cd", //taskID    
		[ 
			"Secure the Colonial Docks.", //description of the task
			"Secure Docks", //task title       
			"attack" //task icon (deprecated)                           
		],
		[11608.243, 9675.295, 0], //task position / object                   
		"CREATED", //creation state (CREATED, ASSIGNED, ...)         
		-1, //priority (-1 to not set as assigned automatically)
		true, //send notification on task creation
		"attack", //task icon (this is the one that matters)
		true //visible in 3d                   
	] call BIS_fnc_taskCreate;

    [
		west,                 
		"obj_secure_cm_1",    
		[
			"Secure the Colonial Municipality and look for any key civilian personnel to secure.",  
			"Secure Colonial Municipality",                        
			"attack"                                     
		],
		[12102.92, 9094.353, 0],                       
		"CREATED",                 
		-1,                        
		true,                   
		"attack",                   
		true                       
	] call BIS_fnc_taskCreate;

    [
		west,                 
		"obj_secure_cm_2",    
		[
			"Secure the Colonial Municipality and look for any key civilian personnel to secure.",  
			"Secure Colonial Municipality",                        
			"attack"                                     
		],
		[12979.936, 9886.998, 0],                       
		"CREATED",                 
		-1,                        
		true,                   
		"attack",                   
		true                       
	] call BIS_fnc_taskCreate;

    [
		west,                 
		"obj_secure_cm_3",    
		[
			"Secure the Colonial Municipality and look for any key civilian personnel to secure.",  
			"Secure Colonial Municipality",                        
			"attack"                                     
		],
		[12366.954, 5495.112, 0],                       
		"CREATED",                 
		-1,                        
		true,                   
		"attack",                   
		true                       
	] call BIS_fnc_taskCreate;

    [
		west,                 
		"obj_secure_scientists",    
		[
			"Secure the science personnel in charge of running the power generator so they can perform the sensitive manipulations to insert the cooling rods and avoid a meltdown.",  
			"Secure Science Personnel",                        
			"help"                                     
		],
		[7592.034, 12268.602, 0],                       
		"CREATED",                 
		-1,                        
		true,                   
		"help",                   
		true                       
	] call BIS_fnc_taskCreate;
};

[   
    controls,   
    "Begin MISSION",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		mission_start = true;
		publicVariable "mission_start";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd; 

[   
    controls,   
    "Begin ACT 1",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_1 = true;
		publicVariable "act_1";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd; 

[   
    controls,   
    "End ACT 1",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_1_end = true;
		publicVariable "act_1_end";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd; 

[   
    controls,   
    "Begin ACT 2",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_2 = true;
		publicVariable "act_2";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd; 

[   
    controls,   
    "End ACT 2",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_2_end = true;
		publicVariable "act_2_end";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd;

[   
    controls,   
    "Begin ACT 3",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_3 = true;
		publicVariable "act_3";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd; 

[   
    controls,   
    "Meltdown Voiceline",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_3_meltdown_event = true;
		publicVariable "act_3_meltdown_event";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd;

[   
    controls,   
    "Nuke On Generator",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		science_action_nuke = true;
		publicVariable "science_action_nuke";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd;

[   
    controls,   
    "End ACT 3",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",   
    "_this == z5",   
    "_this == z5",   
    {},   
    {},   
    {   
        params ["_target", "_caller", "_actionId", "_arguments"];
		act_3_end = true;
		publicVariable "act_3_end";
    },   
    {},   
    [],   
    1,   
    1000,   
    false,   
    false,   
    true,   
    5   
] call BIS_fnc_holdActionAdd;

/*
    MyMission_fnc_earthquake_continuous

    Params:
        0: _duration              NUMBER   (default 20) total duration in seconds.
                                            Pass 0 or -1 for infinite (runs until manually stopped).
        1: _intensity              NUMBER   (default 2, 1-4)
        2: _sourceObj              OBJECT   (default objNull) - sound source for say3D
        3: _maxDistance            NUMBER   (default 100)
        4: _pitch                  NUMBER   (default 1)
        5: _isSpeech                NUMBER   (default 0) 0/1/2
        6: _offset                  NUMBER   (default 0)
        7: _simulateSpeedOfSound    BOOLEAN  (default false)

    To manually stop an infinite (or normal) run early, set a stop flag:
        (if _sourceObj is used)  _sourceObj setVariable ["MyMission_earthquake_stop", true];
        (if no _sourceObj)       missionNamespace setVariable ["MyMission_earthquake_stop", true];
*/

MyMission_fnc_earthquake_continuous = {
    params [
        ["_duration",  20, [0]],
        ["_intensity",  2, [0]],
        ["_sourceObj", objNull, [objNull]],
        ["_maxDistance", 100, [0]],
        ["_pitch", 1, [0]],
        ["_isSpeech", 0, [0]],
        ["_offset", 0, [0]],
        ["_simulateSpeedOfSound", false, [false]]
    ];

    _intensity = (_intensity max 1) min 4;

    private _shakeStr  = [0.3, 0.6, 1.0, 1.8] select (_intensity - 1);
    private _shakeDur  = [0.6, 0.6, 0.7, 0.8] select (_intensity - 1);
    private _shakeFreq = [8.0, 10.0, 13.0, 16.0] select (_intensity - 1);

    private _soundData = [
        ["Earthquake_01", 4.0],
        ["Earthquake_02", 4.5],
        ["Earthquake_03", 5.0],
        ["Earthquake_04", 5.5]
    ] select (_intensity - 1);

    private _sound     = _soundData select 0;
    private _soundLen  = _soundData select 1;

    private _soundArray = [_sound, _maxDistance, _pitch, _isSpeech, _offset, _simulateSpeedOfSound];

    private _infinite = _duration <= 0;
    private _endTime  = time + _duration; // only meaningful if not infinite

    // Whichever object we're tracking the stop flag on -- falls back to missionNamespace if no source
    private _stopHolder = if (isNull _sourceObj) then { missionNamespace } else { _sourceObj };
    _stopHolder setVariable ["MyMission_earthquake_stop", false];

    private _nextSoundTime = 0; // Play immediately on first tick

    while {
        (_infinite || { time < _endTime })
        && { !(_stopHolder getVariable ["MyMission_earthquake_stop", false]) }
        && { isNull _sourceObj || { !isNull _sourceObj } } // stays alive; if source was passed and got deleted, isNull check below exits
    } do {

        if (!isNull _sourceObj && { isNull _sourceObj }) exitWith {}; // safety no-op, real check is below

        if (!(isNull _sourceObj) && { isNull _sourceObj }) then {}; // unreachable, kept for clarity

        //addCamShake [_shakeStr, _shakeDur, _shakeFreq];

        if (time >= _nextSoundTime) then {
            if (!isNull _sourceObj) then {
                _sourceObj say3D _soundArray;
            } else {
                playSound _sound;
            };
            _nextSoundTime = time + _soundLen;
        };

        sleep 0.05;
    };
};

/*
    ScifiSupportPLUS_ShipLightDefs

    Global registry mapping a ship's classname -> its array of light definitions.
    Populate this once (e.g. in your mission init or a dedicated config file) using
    ScifiSupportPLUS_fnc_RegisterShipLights below.

    Each light definition array is: [offset, color, brightness, flareSize, flareMaxDist, blinking]
    offset is LOCAL model space: [right, forward, up]
*/
ScifiSupportPLUS_ShipLightDefs = createHashMap;

/*
    ScifiSupportPLUS_fnc_RegisterShipLights

    Registers (or overwrites) the light set for a given ship classname.

    Params:
        0: _classname   STRING   the vehicle classname this light set applies to
        1: _lightDefs    ARRAY    array of [offset, color, brightness, flareSize, flareMaxDist, blinking]

    Example:
        [
            "OPTRE_Frigate_UNSC",
            [
                [[-72.327,-281.29,9.388],   [0,0.89,1], 30, 25, 10000, false],
                [[-60.309,-250.754,-11.935],[0,0.89,1], 30, 25, 10000, false],
                [[60.346,-250.754,-11.935], [0,0.89,1], 30, 25, 10000, false],
                [[73.146,-281.29,9.388],    [0,0.89,1], 30, 25, 10000, false],
                [[9.659,277.234,-11.498],   [1,0,0],    1.3, 4,  10000, true],
                [[-9.674,277.234,-11.498],  [1,0,0],    1.3, 4,  10000, true],
                [[9.659,254.724,-2.309],    [1,0,0],    1.3, 4,  10000, true],
                [[-9.674,254.724,-2.309],   [1,0,0],    1.3, 4,  10000, true],
                [[-0.032,-50.098,65.682],   [1,0,0],    1.3, 4,  10000, true],
                [[-5.659,-232.94,11.066],   [1,0,0],    1.3, 4,  10000, true],
                [[5.703,-232.94,11.066],    [1,0,0],    1.3, 4,  10000, true]
            ]
        ] call ScifiSupportPLUS_fnc_RegisterShipLights;
*/
ScifiSupportPLUS_fnc_RegisterShipLights = {
    params ["_classname", "_lightDefs"];
    ScifiSupportPLUS_ShipLightDefs set [_classname, _lightDefs];
};

/*
    ScifiSupportPLUS_fnc_MoveAlongLine

    Moves an EXISTING local object (_localObj) in a straight line from _startTarget's
    position to _endTarget's position, at a fixed speed. Rotation is snapped once from
    _startTarget and held fixed for the whole trip.

    Lights are looked up automatically from ScifiSupportPLUS_ShipLightDefs based on
    typeOf _localObj. If no entry is registered for that classname, no lights spawn --
    the ship just moves.

    Params:
        0: _localObj     OBJECT   the already-existing local object to move
        1: _startTarget   OBJECT   defines the START position AND the rotation to copy
        2: _endTarget     OBJECT   defines the END position
        3: _speed         NUMBER   (optional, default 5) travel speed in m/s
        4: _axis          STRING   (optional, default "dir") which local axis of _localObj
                                    gets aligned to _startTarget's forward direction

    Returns: nothing meaningful (PFH handles are managed internally)
*/

/*
    ScifiSupportPLUS_fnc_MoveAlongLine

    Moves an EXISTING local object (_localObj) in a straight line from _startTarget's
    position to _endTarget's position, at a fixed speed. Rotation is snapped once from
    _startTarget and held fixed for the whole trip.

    If _localObj already has lights stored via ScifiSupportPLUS_fnc_SpawnShipLightsAndSound
    (i.e. "ScifiSupportPLUS_shipLights" variable is set and non-empty), those EXISTING
    lights are reused and repositioned each frame -- no duplicates are spawned. Otherwise,
    a fresh set is spawned from the registry, same as before.

    Params:
        0: _localObj     OBJECT   the already-existing local object to move
        1: _startTarget   OBJECT   defines the START position AND the rotation to copy
        2: _endTarget     OBJECT   defines the END position
        3: _speed         NUMBER   (optional, default 5) travel speed in m/s
        4: _axis          STRING   (optional, default "dir") which local axis of _localObj
                                    gets aligned to _startTarget's forward direction

    Returns: nothing meaningful (PFH handles are managed internally)
*/

ScifiSupportPLUS_fnc_MoveAlongLine = {
    params [
        "_localObj",
        "_startTarget",
        "_endTarget",
        ["_speed", 5],
        ["_axis", "dir"]
    ];

    if (isNull _localObj || isNull _startTarget || isNull _endTarget) exitWith {};

    private _targetDir = vectorDir _startTarget;
    private _targetUp  = vectorUp _startTarget;
    private _targetRight = _targetDir vectorCrossProduct _targetUp;

    private _newDir = switch (toLower _axis) do {
        case "dirback": { _targetDir vectorMultiply -1 };
        case "right":   { _targetRight };
        case "left":    { _targetRight vectorMultiply -1 };
        default         { _targetDir };
    };
    private _newUp = _targetUp;
    private _newRight = _newDir vectorCrossProduct _newUp;

    _localObj setVectorDirAndUp [_newDir, _newUp];

    private _startPos = getPosASL _startTarget;
    private _endPos   = getPosASL _endTarget;
    private _fullVec  = _endPos vectorDiff _startPos;
    private _totalDist = vectorMagnitude _fullVec;

    if (_totalDist <= 0) exitWith {};

    private _travelDir = _fullVec vectorMultiply (1 / _totalDist);

    _localObj setPosASL _startPos;

    // --- Reuse existing lights if this object already has some, otherwise spawn fresh ---
    private _existingLights = _localObj getVariable ["ScifiSupportPLUS_shipLights", []];
    private _lights = [];

    if (count _existingLights > 0) then {
        _lights = _existingLights; // reuse as-is, already [light, offset] pairs
    } else {
        private _classname = typeOf _localObj;
        private _lightDefs = ScifiSupportPLUS_ShipLightDefs getOrDefault [_classname, []];

        {
            _x params ["_offset", "_color", "_brightness", "_flareSize", "_flareMaxDist", "_blinking"];

            private _worldPos = _startPos vectorAdd (
                (_newRight vectorMultiply (_offset select 0))
                vectorAdd (_newDir vectorMultiply (_offset select 1))
                vectorAdd (_newUp vectorMultiply (_offset select 2))
            );

            private _light = "#lightpoint" createVehicleLocal _worldPos;
            _light setLightColor _color;
            _light setLightAmbient _color;
            _light setLightBrightness _brightness;
            _light setLightUseFlare true;
            _light setLightFlareSize _flareSize;
            _light setLightFlareMaxDistance _flareMaxDist;
            _light setLightDayLight true;

            _lights pushBack [_light, _offset];

            if (_blinking) then {
                [_light] spawn {
                    params ["_light"];
                    while {!isNull _light} do {
                        _light setLightBrightness 1;
                        sleep 0.8;
                        _light setLightBrightness 0;
                        sleep 0.8;
                    };
                };
            };
        } forEach _lightDefs;

        _localObj setVariable ["ScifiSupportPLUS_shipLights", _lights];
    };

    private _startTime = time;

    [
        {
            params ["_args", "_pfhID"];
            _args params ["_localObj", "_startPos", "_travelDir", "_totalDist", "_speed", "_startTime", "_newDir", "_newUp", "_newRight", "_lights"];

            if (isNull _localObj) exitWith {
                { deleteVehicle (_x select 0) } forEach _lights;
                [_pfhID] call CBA_fnc_removePerFrameHandler;
            };

            private _elapsed = time - _startTime;
            private _distCovered = _elapsed * _speed;
            private _finished = _distCovered >= _totalDist;

            private _newPos = _startPos vectorAdd (_travelDir vectorMultiply (_distCovered min _totalDist));
            _localObj setPosASL _newPos;

            {
                _x params ["_light", "_offset"];
                if (!isNull _light) then {
                    private _lightPos = _newPos vectorAdd (
                        (_newRight vectorMultiply (_offset select 0))
                        vectorAdd (_newDir vectorMultiply (_offset select 1))
                        vectorAdd (_newUp vectorMultiply (_offset select 2))
                    );
                    _light setPosASL _lightPos;
                };
            } forEach _lights;

            if (_finished) exitWith {
                [_pfhID] call CBA_fnc_removePerFrameHandler;
            };
        },
        0,
        [_localObj, _startPos, _travelDir, _totalDist, _speed, _startTime, _newDir, _newUp, _newRight, _lights]
    ] call CBA_fnc_addPerFrameHandler;
};

/*
    ScifiSupportPLUS_fnc_SpawnShipLightsAndSound

    Spawns a ship's registered light set (looked up by typeOf _localObj from
    ScifiSupportPLUS_ShipLightDefs) positioned once at the object's current
    position/rotation. Lights are placed once and do NOT track the object afterward.

    The spawned [light, offset] pairs are stored on _localObj via setVariable, so that
    ScifiSupportPLUS_fnc_MoveAlongLine (or anything else) can detect and REUSE them
    later instead of spawning duplicates.

    Also starts a continuous looping 3D sound anchored to the object, same style as
    MyMission_fnc_earthquake_continuous, until manually stopped.

    Params:
        0: _localObj                OBJECT   the object to spawn lights/sound on
        1: _sound                   STRING   (optional, default "") CfgSounds classname to loop
        2: _soundLen                NUMBER   (optional, default 4) approximate clip length in seconds
        3: _maxDistance             NUMBER   (optional, default 100) say3D max hearing distance
        4: _pitch                   NUMBER   (optional, default 1) say3D pitch
        5: _isSpeech                 NUMBER   (optional, default 0) say3D isSpeech (0/1/2)
        6: _offset                   NUMBER   (optional, default 0) say3D playback offset
        7: _simulateSpeedOfSound     BOOLEAN  (optional, default false) say3D speed-of-sound sim

    Returns:
        ARRAY   array of [light, offset] pairs (same format stored on the object)
*/

ScifiSupportPLUS_fnc_SpawnShipLightsAndSound = {
    params [
        "_localObj",
        ["_sound", "", [""]],
        ["_soundLen", 4, [0]],
        ["_maxDistance", 100, [0]],
        ["_pitch", 1, [0]],
        ["_isSpeech", 0, [0]],
        ["_offset", 0, [0]],
        ["_simulateSpeedOfSound", false, [false]]
    ];

    if (isNull _localObj) exitWith { [] };

    private _pos   = getPosASL _localObj;
    private _dir   = vectorDir _localObj;
    private _up    = vectorUp _localObj;
    private _right = _dir vectorCrossProduct _up;

    private _classname = typeOf _localObj;
    private _lightDefs = ScifiSupportPLUS_ShipLightDefs getOrDefault [_classname, []];

    private _lights = [];
    {
        _x params ["_lightOffset", "_color", "_brightness", "_flareSize", "_flareMaxDist", "_blinking"];

        private _worldPos = _pos vectorAdd (
            (_right vectorMultiply (_lightOffset select 0))
            vectorAdd (_dir vectorMultiply (_lightOffset select 1))
            vectorAdd (_up vectorMultiply (_lightOffset select 2))
        );

        private _light = "#lightpoint" createVehicleLocal _worldPos;
        _light setPosASL _worldPos;
        _light setLightColor _color;
        _light setLightAmbient _color;
        _light setLightBrightness _brightness;
        _light setLightUseFlare true;
        _light setLightFlareSize _flareSize;
        _light setLightFlareMaxDistance _flareMaxDist;
        _light setLightDayLight true;

        // Store as [light, offset] pairs so MoveAlongLine can reuse + reposition them later
        _lights pushBack [_light, _lightOffset];

        if (_blinking) then {
            [_light] spawn {
                params ["_light"];
                while {!isNull _light} do {
                    _light setLightBrightness 1;
                    sleep 0.8;
                    _light setLightBrightness 0;
                    sleep 0.8;
                };
            };
        };
    } forEach _lightDefs;

    // Stash on the object so other functions (MoveAlongLine) can find + reuse these lights
    _localObj setVariable ["ScifiSupportPLUS_shipLights", _lights];

    if (_sound != "") then {
        _localObj setVariable ["ScifiSupportPLUS_shipSound_stop", false];

        private _soundArray = [_sound, _maxDistance, _pitch, _isSpeech, _offset, _simulateSpeedOfSound];

        [_localObj, _soundArray, _soundLen] spawn {
            params ["_localObj", "_soundArray", "_soundLen"];

            while {
                !isNull _localObj
                && { !(_localObj getVariable ["ScifiSupportPLUS_shipSound_stop", false]) }
            } do {
                _localObj say3D _soundArray;
                sleep _soundLen;
            };
        };
    };

    _lights
};

[
    "31st_Frigate_UNSC",
    [
        [[-72.327,-281.29,9.388],   [0,0.89,1], 20, 25, 10000, false],
        [[-60.309,-250.754,-11.935],[0,0.89,1], 20, 25, 10000, false],
        [[60.346,-250.754,-11.935], [0,0.89,1], 20, 25, 10000, false],
        [[73.146,-281.29,9.388],    [0,0.89,1], 20, 25, 10000, false],
        [[9.659,277.234,-11.498],   [1,0,0],    1.3, 4,  10000, true],
        [[-9.674,277.234,-11.498],  [1,0,0],    1.3, 4,  10000, true],
        [[9.659,254.724,-2.309],    [1,0,0],    1.3, 4,  10000, true],
        [[-9.674,254.724,-2.309],   [1,0,0],    1.3, 4,  10000, true],
        [[-0.032,-50.098,65.682],   [1,0,0],    1.3, 4,  10000, true],
        [[-5.659,-232.94,11.066],   [1,0,0],    1.3, 4,  10000, true],
        [[5.703,-232.94,11.066],    [1,0,0],    1.3, 4,  10000, true]
    ]
] call ScifiSupportPLUS_fnc_RegisterShipLights;

[
    "WSD_Gladius",
    [
        [[-50.006,-184.9,-13.688],   [0,0.89,1], 30, 25, 10000, false],
        [[-55.258,-140.897,32.393],[1,0,0], 1.3, 4, 10000, true],
        [[-50.275,175.4,-24.325], [1,0,0], 1.3, 4, 10000, true],
        [[-50.015,218.215,-26.805],    [1,0,0], 1.3, 4, 10000, true]
    ]
] call ScifiSupportPLUS_fnc_RegisterShipLights;

frigate = "31st_Frigate_UNSC" createVehicleLocal (getPosATL icarus);
frigate setVectorDirAndUp [(vectorDir icarus), (vectorUp icarus)];
frigate setPosATL (getPosATL icarus);

[frigate] call ScifiSupportPLUS_fnc_SpawnShipLightsAndSound;

[-1, 4, frigate, 4000] call MyMission_fnc_earthquake_continuous;

missionNamespace setVariable ["manual_override", "on", true];