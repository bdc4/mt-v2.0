/*
Copyright (c) 2016 NailBuster Software Inc. (david@nailbuster.com). All rights reserved.



This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


*/


if uiViewFixed {
    x = __view_get( e__VW.XView, view_current )+xstart;
    y = __view_get( e__VW.YView, view_current )+ystart;
   }

if (uiAniMove) && (uiMoving) //if currently moving
     {
     with (ui_ani_control)  //remove any animation objects on this widget
         {  if (EaseControl==other.id) && (EaseKind==0) {instance_destroy();} } 
     uiMoving=false;
     }     

if (uiAniMove) 
               {  EaseKind=0;  //set animation to movement;
                  uiEaseType=uiEaseMoveType;
                  uiEaseDur=uiEaseMoveDur;
                  event_user(12);
                  uiAniMove=false; 
                  uiMoving=true;
               }  
               
                
               
if (uiAnimated) && (inAnimation=false)
                 {
                 if uiWobble!=0   //wobble is active, create animation
                    {
                        EaseKind=3;
                        uiEaseType=uiEaseWobbleType;
                        uiEaseDur=uiEaseWobbleDur;               
                        event_user(12);                                        
                    }  
                 if uiPulse!=0   //pulse is active, create animation
                    {
                        EaseKind=2;
                        uiEaseType=uiEasePulseType;
                        uiEaseDur=uiEasePulseDur;               
                        event_user(12);                                        
                    }  
                 if uiFading!=0   //fading is active, create animation
                    {
                        EaseKind=4;
                        uiEaseType=uiEaseFadeType;
                        uiEaseDur=uiEaseFadeDur;               
                        event_user(12);                                        
                    }                 
                 if uiGlowing!=0   //fading is active, create animation
                    {
                        EaseKind=6;
                        uiEaseType=uiEaseFadeType;
                        uiEaseDur=uiEaseFadeDur;               
                        event_user(12);                                        
                    }                                     
                 if uiSparkle!=0 //sparkle active, create animation      
                    {
                        EaseKind=5;
                        event_user(12);                                        
                    }                 
                    
                                   
                 inAnimation=true;
                }               
   
if (uiAnimated==false) && (inAnimation=true) //stop animations
     {
     with (ui_ani_control)  //remove any animation objects on this widget
         {  if EaseControl==other.id {instance_destroy();} } 
     inAnimation=false;
     }              
               
if uiFadeIn 
     {                                                    //fadein
     uiVisible=true;
     if uiAlpha <=1
            {  uiAlpha=uiAlpha+(0.1 * uiFadeSpeed);
               if uiAlpha >0.98 then {     uiAlpha=1;
                                           uiFadeIn=false;
                                     } 
            } 
     }          

if (uiFadeOut && uiFadeIn==false)
   {  if uiAlpha >=0
            {  uiAlpha=uiAlpha - (0.1 * uiFadeSpeed);
               if uiAlpha <0.02 then {      uiAlpha=0;
                                            uiFadeOut=false;
                                            uiVisible=false;
                                            if killonfade instance_destroy();
                                     } 
               
            } 
   }         
   

    
backalpha=draw_get_alpha();  //restore alpha after draw (drawend)
       
if (uiEnabled==false) || (uiMouseHandle==false) {draw_set_alpha(0.5);} 
     else draw_set_alpha(uiAlpha);  
            


      
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
      
                    
if uiZoomOut
   if uiZoomFactor != 0.1
          {  uiZoomFactor= uiZoomFactor * uiZoomSpeed;   
             if uiZoomFactor <= 0.1  {
                                      uiZoomOut=false;               
                                      uiZoomFactor=0.1;
                                     }        
          }    
  
          
if uiPopUp
    {
     uiVisible=true;                   
     EaseKind=7;  //popup zoom
     uiEaseType=30;//37;
     uiEaseDur=30;               
     event_user(12);                                        
     uiPopUp=false;
    }  
if uiPopDown
    {
     EaseKind=8;  //popdown zoom
     uiEaseType=29;
     uiEaseDur=30;               
     event_user(12);                                        
     uiPopDown=false;
    }  
    
                      
if uiZoomIn
   if uiZoomFactor <= 1
          {  uiZoomFactor= uiZoomFactor * (1/uiZoomSpeed);   
             if uiZoomFactor >= 1    {                       //reset to zoom 1
                                      uiZoomIn=false;               
                                      uiZoomFactor=1;
                                      image_xscale = uiOrigXscale * (uiZoomFactor);
                                      image_yscale = uiOrigYscale * (uiZoomFactor);
                                     }        
          }        
      

if (uiAnchor != noone)  //has a parent
   {  
    if uiAnchorPos  //grab relative position of parent
     { 
      x = xstart + ( (uiAnchor).x - (uiAnchor).xstart );
      y = ystart + ( (uiAnchor).y - (uiAnchor).ystart );   
     } 
      uiAlpha=uiAnchor.uiAlpha;   //set alpha for fadein/out effect   
      uiZoomFactor=uiAnchor.uiZoomFactor;  //sets same zoomout/in
      uiAniPulse=uiAnchor.uiAniPulse;
      uiAniFading=uiAniFading;
     if uiAnchorProps     //sets childrens enabled/visible by default.
        { uiEnabled=uiAnchor.uiEnabled && uiEnabledChild;  
          uiVisible=uiAnchor.uiVisible && uiVisibleChild;
        }  
     if (depth>=uiAnchor.depth) {depth=uiAnchor.depth-1;}  //children always ahead of parents.
   }
   
  
          
if uiZoomFactor != 1
   {
      image_xscale = uiOrigXscale * (uiZoomFactor);
      image_yscale = uiOrigYscale * (uiZoomFactor);
   }   
                
if (uiHoverMode>0) && (uiEnabled)  && (uiCanHover)
  {  
      if position_meeting(mouse_x,mouse_y,self.id)            
       { if isHovering=false {  //first hover
                                isHovering=true;
       
                                if uiHoverMode==1   //hove color mode        
                                   { uiAniFading=1-uiHoverInfo;
                                     uiImageBlend=uiHoverColor;
                                   } else
                                 if uiHoverMode==2  
                                   { EaseKind=9;  //hover zoom in
                                     uiEaseType=37;
                                     uiEaseDur=10;               
                                     event_user(12);                                        
                                   } else
                                 if uiHoverMode==3   //glow affect
                                   {
                                    uiAniDrawGlow=true;
                                   }                                      
                             }
                                   
        } else if isHovering //if we moved off a hovering control;
                {isHovering=false;  //mouseover 
                 curHoverZoom=0;    //reset hoverzoom if applicable    
                 uiAniFading=0;
                 uiImageBlend=c_white;   
                 uiAniDrawGlow=false;
                 if uiHoverMode==2
                    { EaseKind=10;  //hover zoom out
                      uiEaseType=34;
                      uiEaseDur=10;               
                      event_user(12);
                    }                                                           
                }
                
                
                               
  }//if hovermode   
                                      
   
if uiDestroy>=0 {alarm[11]=uiDestroy;   //auto kill        
                 uiDestroy=-1;
                }  
   
if uiDrawSelf then { image_uiXscale=1;
                     image_uiYscale=1; 
                     draw_self();   //allow gms sprites and code as well....     
                   }  

                      
if (uiZoomFactor==0.1) || (uiVisible==false) draw_set_alpha(backalpha);        
   

/* */
/*  */
