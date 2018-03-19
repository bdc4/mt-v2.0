uiDialogWidth = 450;
uiButtonHeight = 200;
uiDialogPosY = room_height/4;
class = ".ignore";
uiDialogSprite = ctb_load_subimage( spr_textbox_slice9_subimages, uiDialogWidth, 200 );
uiTitle.uiTextValue = argument0;
uiTitle.uiTextColor = c_yellow;
uiTitle.uiFont = f_normal;
uiSubTitle.uiTextValue = argument1;
uiFont = f_normal;
uiButtons1.uiTextValue = "Yes";
uiButtons1.uiTextColor = c_lime;
uiButtons1.uiFont = f_normal;
uiButtons2.uiTextValue = "No";
uiButtons2.uiTextColor = c_red;
uiButtons2.uiFont = f_normal;
uiShowDialog = true;
uiEventObject = argument2;
uiControlName = argument3;


