//[70, 4] remoteExec ["MyMission_fnc_earthquake_continuous", 0];

params [
    ["_duration",  20, [0]],
    ["_intensity",  2, [0]]
];

_intensity = (_intensity max 1) min 4;

// Higher frequency = rapid jitter/vibration feel
// Lower strength + high freq = rumble, not pan
private _shakeStr  = [0.3, 0.6, 1.0, 1.8] select (_intensity - 1);
private _shakeDur  = [0.6, 0.6, 0.7, 0.8] select (_intensity - 1);
private _shakeFreq = [8.0, 10.0, 13.0, 16.0] select (_intensity - 1);

// Sound clip + its approximate duration in seconds
private _soundData = [
    ["Earthquake_01", 4.0],
    ["Earthquake_02", 4.5],
    ["Earthquake_03", 5.0],
    ["Earthquake_04", 5.5]
] select (_intensity - 1);

private _sound     = _soundData select 0;
private _soundLen  = _soundData select 1;

private _endTime      = time + _duration;
private _nextSoundTime = 0; // Play immediately on first tick

while { time < _endTime } do {

    // Shake applied every tick — short duration so it must be constantly renewed
    //addCamShake [_shakeStr, _shakeDur, _shakeFreq];

    // Only trigger a new sound once the previous one has finished
    if (time >= _nextSoundTime) then {
        playSound _sound;
        _nextSoundTime = time + _soundLen;
    };

    sleep 0.05; // Much tighter loop so shake feels continuous and jittery
};

//addCamShake [0, 0.1, 0];