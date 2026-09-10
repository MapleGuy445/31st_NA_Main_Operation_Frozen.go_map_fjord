// ============================================================
//  INTEL REPORT — Edit content here
// ============================================================
private _title   = "FIELD REPORT — CAPTURED PERSONNEL";
private _ref     = "ORIGIN: URF INTERCEPT  |  DTG: CURRENT  |  ROUTING: COMMAND/EYES ONLY";
private _section = "ASSET: DETAINED SCIENTIST — LOCATION CONFIRMED";
private _body = (
    "<t size='1.1' color='#e8a838'>// SITUATION SUMMARY //</t><br/><br/>" +
    "URF elements seized a UNSC-affiliated scientist during a raid on this settlement.<br/><br/>" +
    "<t size='0.95' color='#aaaaaa'>Intercepted comms indicate the detainee was moved north of this location and is being held under guard at a URF-controlled radar installation.</t><br/><br/>" +
    "<t size='1.1' color='#ff3333'>STATUS: </t>" +
    "<t size='1.1' color='#e8a838'>ALIVE — HELD AT RADAR STATION</t>"
);

uiNamespace setVariable ["DATAPAD_title",   _title];
uiNamespace setVariable ["DATAPAD_ref",     _ref];
uiNamespace setVariable ["DATAPAD_section", _section];
uiNamespace setVariable ["DATAPAD_body",    _body];

// ============================================================
//  MAP INTEL SUMMARY — Added on first interaction
// ============================================================
if !(missionNamespace getVariable ["INTEL_scientist_read", false]) then {
    missionNamespace setVariable ["INTEL_scientist_read", true, true];

    // Trigger var for task creation - caught by mission script
    missionNamespace setVariable ["scientist_intel", true, true];

    { player createDiaryRecord [
        "Diary",
        [
            "INTEL: Detained Scientist — Location",
            "Intercepted URF comms confirm a captured scientist is being held at a URF-controlled radar station north of this settlement.<br/><br/>" +
            "<t size='1.1' color='#e8a838'>Recommend investigating the radar installation to the north.</t>"
        ]
    ]; } remoteExec ["call", 0];

    hint parseText "<t size='1.1' color='#e8a838'>INTEL ACQUIRED</t><br/>Scientist's location added to Field Journal.";
};

// ============================================================
//  Called by the dialog's onLoad event
// ============================================================
MY_fnc_datapadLoad = {
    disableSerialization;
    params ["_display"];

    (_display displayCtrl 200) ctrlSetText (uiNamespace getVariable ["DATAPAD_title", ""]);
    (_display displayCtrl 209) ctrlSetText (uiNamespace getVariable ["DATAPAD_ref", ""]);
    (_display displayCtrl 204) ctrlSetText (uiNamespace getVariable ["DATAPAD_section", ""]);
    (_display displayCtrl 202) ctrlSetStructuredText parseText (uiNamespace getVariable ["DATAPAD_body", ""]);
};

createDialog "MyDatapad";