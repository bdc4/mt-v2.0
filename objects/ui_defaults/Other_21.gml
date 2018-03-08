/// @description for resizing in code

if uiSetWidth != -1  {   uiOrigXscale=uiSetWidth/sprite_get_width(sprite_index);   
                         uiOrigWidth=uiSetWidth;
                         uiCurWidth=uiSetWidth;
                         uiSetWidth=-1;
                         image_xscale = uiOrigXscale;
                     }                     

if uiSetHeight != -1 {   uiOrigYscale=uiSetHeight/sprite_get_height(sprite_index);   
                         uiOrigHeight=uiSetHeight;
                         uiCurHeight=uiSetHeight;
                         uiSetHeight=-1;
                         image_yscale= uiOrigYscale;
                     }   

