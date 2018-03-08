/// @description call when we need to resize

if uiBubbleSprite != noone
  {
    xratio=sprite_width/sprite_get_width(uiBubbleSprite);
    yratio=sprite_height/sprite_get_height(uiBubbleSprite);
    uiTextPosX=(sprite_get_bbox_left(uiBubbleSprite)*xratio);
    uiTextPosY=(sprite_get_bbox_top(uiBubbleSprite)*yratio);
    uiTextWidth=(sprite_get_bbox_right(uiBubbleSprite)*xratio)-uiTextPosX;
    uiTextHeight=(sprite_get_bbox_bottom(uiBubbleSprite)*yratio)-uiTextPosY;
    uiTextPosX +=drawX;
    uiTextPosY +=drawY;
    
  } 
else
  {
  uiTextPosX=drawX+10;  //added to x .  Text will be centered
  uiTextPosY=drawY+10;
  uiTextWidth=sprite_width-20;  //80% of bubble width
  uiTextHeight=sprite_height-20;    
  }  

