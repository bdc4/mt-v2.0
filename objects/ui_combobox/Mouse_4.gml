if (uiMouseHandle==false) || (uiEnabled==false) || (uiVisible==false) exit;

event_inherited();



var fx,inst;
if lookupid != noone  { alarm[0]=1; exit; }  //toggle combo box on press.

draw_set_font(uiFont);

numitems=array_length_1d(items);

lineheight=string_height(string_hash_to_newline("XgpT"))*uiYscale + 5;


//set popup positions;
cx1=x+10;
cy1=y+sprite_height+1;
cx2=cx1+sprite_width;
cy2=cy1+(numitems*lineheight);

if (cy2 > room_height) || (uiDrawArrowUp)      //if too low then show up the items...
   {
    cy1=cy1-(cy2-cy1)-sprite_height-3;
    cy2=cy1+(numitems*lineheight);     
    uiDrawArrowUp=true;
   
   }
//check to see if we are overlapping any other componets, if so then disable the mouse handle

     var l,t;
      l=ds_list_create();
      while 1{
        t = collision_rectangle(cx1,cy1,cx2,cy2, ui_defaults, false, false);
        if t{ ds_list_add(l,t);
              instance_deactivate_object(t);
              t.uiMouseHandle=false;             //re-enable mouse handler;
            }
        else break;
             }
           
      for(t=0;t<ds_list_size(l);t+=1)
        { instance_activate_object(ds_list_find_value(l,t)); }
      ds_list_destroy(l);


lookupid = instance_create(cx1,cy1,ui_listbox);

lookupid.uiDrawHeader=false;
lookupid.uiDrawSquare=true;
lookupid.depth=-10000;
lookupid.uiBackColor=uiBackColor;
lookupid.uiDrawBackColor=uiDrawBackColor;
lookupid.uiTextColor=uiTextColor;
lookupid.uiHiliteColor=uiHiliteColor;
lookupid.uiAlign=uiAlign;
lookupid.uiFont=uiFont;
lookupid.noscroll=true;

//lookupid.uiDrawLines=false;
lookupid.uiScrollArrows=false;



for (fx=0;fx<numitems;fx+=1)
   { lookupid.items[fx]=self.items[fx];   
   }

lookupid.image_xscale=image_xscale;
lookupid.image_yscale=(cy2-cy1)/ (lookupid.sprite_height);  //set scale
lookupid.uiComboID=self.id;
lookupid.uiAlpha=0;
lookupid.uiFadeIn=true;

//need to set all other components to be inForm aware..overwrite, keypress...etc
with (ui_defaults) {inForm=true;}










