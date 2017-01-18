///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4


///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////
class RscStructuredText
{
    deletable = 0;
    fade = 0;
    access = 0;
    type = 13;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    size = 0.1s;
    class Attributes {
      font = "PuristaMedium";
      color = "#307fc0";
      align = "center";
      valign = "middle";
      shadow = false;
      shadowColor = "#ff0000";
      size = "1";
    };
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 0;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};
class RscStructuredTextSmall
{
    deletable = 0;
    fade = 0;
    access = 0;
    type = 13;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    size = 0.04;
    class Attributes {
      font = "PuristaMedium";
      color = "#FFFFFF";
      align = "center";
      valign = "middle";
      shadow = false;
      shadowColor = "#ff0000";
      size = "1";
    };
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 0;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};
class RscStructuredTextLeft
{
    deletable = 0;
    fade = 0;
    access = 0;
    type = 13;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    size = 0.04;
    class Attributes {
      font = "PuristaMedium";
      color = "#FFFFFF";
      align = "left";
      valign = "middle";
      shadow = false;
      shadowColor = "#ff0000";
      size = "1";
    };
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 0;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};
class RscFrame
{
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};
class RscButtonMenu
{
 access = 0;
 type = CT_BUTTON;
 style = ST_LEFT;
 x = 0; y = 0; w = 0.3; h = 0.1;
 text = "";
 font = "PuristaMedium";
 sizeEx = 0.04;
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0.3,0.3,0.3,1};
 colorBackground[] = {0.6,0.6,0.6,1};
 colorBackgroundDisabled[] = {0.6,0.6,0.6,1};
 colorBackgroundActive[] = {0,0.2,1,1};
 offsetX = 0.004;
 offsetY = 0.004;
 offsetPressedX = 0.002;
 offsetPressedY = 0.002;
 colorFocused[] = {0,0,0,1};
 colorShadow[] = {0,0,0,1};
 shadow = 0;
 colorBorder[] = {0,0,0,1};
 borderSize = 0;
 soundEnter[] = {"",0.1,1};
 soundPush[] = {"",0.1,1};
 soundClick[] = {"",0.1,1};
 soundEscape[] = {"",0.1,1};
};
class dialog
{
 class controls
 {
   class OK:RscButtonmenu
   {
     idc=1;// fixed engine constant
     x=y=w=y=whatever;
     text="OK";
     default=true;
   };
   class Cancel
   {
     idc=2; // fixed engine constant
     x=y=somewhere else
     default=false;
   };
  };
};
class Box
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorBackground[] = { 0.2,0.9,0.5, 0.9};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};
