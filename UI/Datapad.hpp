// ============================================================
//  INTEL DATAPAD (STATIC, SMALL FONT, NO BUTTONS)
// ============================================================
#define IDC_DATAPAD_TITLE    200
#define IDC_DATAPAD_CLASSIFY 201
#define IDC_DATAPAD_BODY     202
#define IDC_DATAPAD_SECTION  204
#define IDC_DATAPAD_FOOTER   205
#define IDC_DATAPAD_DIVIDER1 207
#define IDC_DATAPAD_DIVIDER2 208
#define IDC_DATAPAD_DATE     209

// Panel bounds
#define PAD_X  0.08
#define PAD_Y  0.04
#define PAD_W  0.84
#define PAD_H  0.92

// Fixed band heights
#define CLASSIFY_H   0.030
#define HEADER_H     0.078
#define DIVIDER_H    0.005
#define SECTION_H    0.028
#define FOOTER_H     0.040
#define GAP          0.005

// Top-down derived Y positions
#define CLASSIFY_TOP_Y   PAD_Y
#define HEADER_Y         PAD_Y + CLASSIFY_H
#define DIVIDER_TOP_Y    HEADER_Y + HEADER_H
#define SECTION_Y        DIVIDER_TOP_Y + DIVIDER_H + GAP
#define BODY_Y           SECTION_Y + SECTION_H + GAP

// Bottom-up derived Y positions
#define CLASSIFY_BOT_Y   PAD_Y + PAD_H - CLASSIFY_H
#define FOOTER_Y         CLASSIFY_BOT_Y - FOOTER_H
#define DIVIDER_BOT_Y    FOOTER_Y - DIVIDER_H

// Static Body bounds (No scrolling)
#define BODY_X    PAD_X + 0.010
#define BODY_W    PAD_W - 0.020
#define BODY_H    DIVIDER_BOT_Y - BODY_Y - GAP

class MyDatapad {
    idd = 9002;
    movingEnable = false;
    enableSimulation = false;
    onLoad   = "(_this select 0) call MY_fnc_datapadLoad";
    onUnload = "";

    class ControlsBackground {
        class Background : RscText {
            idc = -1;
            x = PAD_X;  y = PAD_Y;
            w = PAD_W;  h = PAD_H;
            colorBackground[] = {0.06, 0.08, 0.06, 0.97};
        };

        class ClassifyTop : RscText {
            idc = IDC_DATAPAD_CLASSIFY;
            text = "TOP SECRET // NOFORN // EYES ONLY";
            x = PAD_X;  y = CLASSIFY_TOP_Y;
            w = PAD_W;  h = CLASSIFY_H;
            colorBackground[] = {0.55, 0.40, 0.00, 1.0};
            colorText[]       = {0.05, 0.05, 0.05, 1};
            sizeEx            = 0.018;
        };

        class HeaderBar : RscText {
            idc = -1;
            text = "";
            x = PAD_X;  y = HEADER_Y;
            w = PAD_W;  h = HEADER_H;
            colorBackground[] = {0.10, 0.14, 0.10, 1.0};
        };

        class ReportTitle : RscText {
            idc = IDC_DATAPAD_TITLE;
            text = "LOADING...";
            x = PAD_X + 0.012;  y = HEADER_Y + 0.008;
            w = PAD_W - 0.024;  h = 0.042;
            colorBackground[] = {0, 0, 0, 0};
            colorText[]       = {0.75, 0.90, 0.75, 1};
            sizeEx            = 0.030;
        };

        class ReportDate : RscText {
            idc = IDC_DATAPAD_DATE;
            text = "";
            x = PAD_X + 0.012;  y = HEADER_Y + 0.052;
            w = PAD_W - 0.024;  h = 0.024;
            colorBackground[] = {0, 0, 0, 0};
            colorText[]       = {0.50, 0.65, 0.50, 1};
            sizeEx            = 0.022;
        };

        class DividerTop : RscLine {
            idc = IDC_DATAPAD_DIVIDER1;
            x = PAD_X;  y = DIVIDER_TOP_Y;
            w = PAD_W;  h = DIVIDER_H;
            colorBackground[] = {0.40, 0.55, 0.20, 0.8};
        };

        class SectionLabel : RscText {
            idc = IDC_DATAPAD_SECTION;
            text = "";
            x = PAD_X + 0.012;  y = SECTION_Y;
            w = PAD_W - 0.024;  h = SECTION_H;
            colorBackground[] = {0, 0, 0, 0};
            colorText[]       = {0.55, 0.75, 0.35, 1};
            sizeEx            = 0.020;
        };

        class DividerBot : RscLine {
            idc = IDC_DATAPAD_DIVIDER2;
            x = PAD_X;  y = DIVIDER_BOT_Y;
            w = PAD_W;  h = DIVIDER_H;
            colorBackground[] = {0.40, 0.55, 0.20, 0.8};
        };

        class FooterBar : RscText {
            idc = IDC_DATAPAD_FOOTER;
            text = "";
            x = PAD_X;  y = FOOTER_Y;
            w = PAD_W;  h = FOOTER_H;
            colorBackground[] = {0.10, 0.14, 0.10, 1.0};
        };

        class ClassifyBot : RscText {
            idc = -1;
            text = "TOP SECRET // NOFORN // EYES ONLY";
            x = PAD_X;  y = CLASSIFY_BOT_Y;
            w = PAD_W;  h = CLASSIFY_H;
            colorBackground[] = {0.55, 0.40, 0.00, 1.0};
            colorText[]       = {0.05, 0.05, 0.05, 1};
            sizeEx            = 0.022;
        };
    };

    class Controls {
        // Flattened text body with reduced base font size
        class BodyText : RscStructuredText {
            idc = IDC_DATAPAD_BODY;
            text = "";
            x = BODY_X; y = BODY_Y;
            w = BODY_W; h = BODY_H;
            colorBackground[] = {0, 0, 0, 0};
            colorText[]       = {0.80, 0.90, 0.70, 1};
            sizeEx            = 0.010; 
            class Attributes {
                size = "0.65"; 
                align = "left";
            };
        };
    };
};