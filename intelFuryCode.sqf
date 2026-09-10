// ============================================================
//  INTEL REPORT — Edit content here
// ============================================================
private _title   = "ORDNANCE MANIFEST — CLASSIFIED";
private _ref     = "ORIGIN: WEAPONS DIV  |  DTG: CURRENT  |  ROUTING: COMMAND/EYES ONLY";
private _section = "ASSET: FURY TACTICAL NUCLEAR DEVICE";
private _body = (
    "<t size='1.1' color='#e8a838'>// ASSET SUMMARY //</t><br/><br/>" +
    "DESIGNATION: FURY Tactical Nuclear Device<br/>" +
    "YIELD: 5kT<br/>" +
    "STATUS: Secured / Awaiting Deployment<br/><br/>" +
    "<t size='0.95' color='#aaaaaa'>This device requires manual override and valid cryptographic input to initiate the detonation sequence.</t><br/><br/>" +
    "<t size='1.2' color='#ff3333'>ACTIVATION / DETONATION CODE: </t>" + 
    "<t size='1.2' color='#e8a838'>ZETA-448</t>"
);

uiNamespace setVariable ["DATAPAD_title",   _title];
uiNamespace setVariable ["DATAPAD_ref",     _ref];
uiNamespace setVariable ["DATAPAD_section", _section];
uiNamespace setVariable ["DATAPAD_body",    _body];

// ============================================================
//  MAP INTEL SUMMARY — Added on first interaction
// ============================================================
if !(missionNamespace getVariable ["INTEL_furyNuke_read", false]) then {
    missionNamespace setVariable ["INTEL_furyNuke_read", true, true];

    { player createDiaryRecord [
        "Diary",
        [
            "INTEL: Fury Nuke Detonation Code",
            "Recovered ordnance manifest detailing a FURY Tactical Nuclear Device.<br/><br/>" +
            "The activation and detonation authorization code is: <t size='1.2' color='#e8a838'>ZETA-448</t>"
        ]
    ]; } remoteExec ["call", 0];

    hint parseText "<t size='1.1' color='#e8a838'>INTEL ACQUIRED</t><br/>Fury Nuke Code added to Field Journal.";
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