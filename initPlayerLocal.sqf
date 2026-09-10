if(isClass(configFile>>"CfgPatches">>"PA_arsenal")||isClass(configFile>>"CfgPatches">>"pafix")||isClass(configFile>>"CfgPatches">>"hpa_arsenal")||isClass(configFile>>"CfgPatches">>"ACEInteractArsenal")) then {
    msg = str (format ["Player %1 tried to connect with an unauthorized mod.", player]);
    [msg] remoteExec ["systemChat", 0];
    forceEnd;
    endMission "END1";
};

player setVariable ["Saved_Loadout",getUnitLoadout player];
player addEventHandler ["Respawn",{

		0 = [_this select 0] spawn {
		
			params [["_player",objNull,[objNull]]];
				waitUntil {sleep .2; alive _player};
				_player setUnitLoadout (_player getVariable ["Saved_Loadout",[]]);
				
		};
}];

player setUnitFreefallHeight 9000;

// ─── Music Queue ─────────────────────────────────────────────────────────────
musicQueue       = [];
musicQueueActive = false;

// Add a song to the end of the queue; start playing if nothing is running
Push_Song_To_Queue = {
    params ["_song"];
    musicQueue pushBack _song;
    if (!musicQueueActive) then {
        call Play_Next_In_Queue;
    };
};

// Remove a specific song from the queue by classname
Pop_Song_From_Queue = {
    params ["_song"];
    private _idx = musicQueue find _song;
    if (_idx >= 0) then { musicQueue deleteAt _idx; };
};

// Internal: play the first song in the queue
Play_Next_In_Queue = {
    if (count musicQueue > 0) then {
        musicQueueActive = true;
        playMusic (musicQueue select 0);
        musicQueue deleteAt 0;
    } else {
        musicQueueActive = false;
    };
};

// Skip whatever is currently playing and play `_song` immediately.
// Anything still left in the queue is preserved and continues after `_song`.
Skip_Song_In_Queue = {
    params ["_song"];

    // Insert the new song at the front of the queue
    musicQueue = [_song] + musicQueue;

    // Stop the current track. This triggers MusicStop with reason 1 (interrupted),
    // which your existing handler treats as "don't auto-advance" and sets
    // musicQueueActive = false. So we then manually call Play_Next_In_Queue
    // to immediately start our new song from the front of the queue.
    playMusic "";               // stops current music, fires MusicStop reason 1
    call Play_Next_In_Queue;    // immediately plays _song, leaving the rest queued
};

// ─── Music Event Handler ─────────────────────────────────────────────────────
// MusicStop args: [trackClassname, reason]
//   reason 0 = track ended naturally -> advance queue
//   reason 1 = track was interrupted  -> don't auto-advance
addMusicEventHandler ["MusicStop", {
    params ["_track", "_reason"];
    if (_reason == 0) then {
        call Play_Next_In_Queue;
    } else {
        // Interrupted externally (e.g. another playMusic call from a trigger)
        // musicQueueActive stays true; the next MusicStop will fire normally
        musicQueueActive = false;
    };
}];