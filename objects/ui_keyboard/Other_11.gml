/// @description set keys and board

//create buttons;
var fx,fy,fs,fl,fh,fc,ft,curx,cury,curchar,curid;

xfc= uiGUIWidth / 800;    //xfactor 
yfc= uiGUIHeight / 600;   //yfactor for scaling



boardy=(uiGUIHeight - (uiKeyboardHeight*yfc));
boardh=(uiKeyboardHeight*yfc);

butheight=boardh div 4 ;
butwidth=((uiGUIWidth-(uiRowStartX[1] *xfc)) div (string_length(uiRow[1])+1)) - (uiRowSpacingX[1]*xfc);

curid=self.id;

x=0;
xstart=0;
y=boardy;
ystart=boardy;
uiSetWidth=uiGUIWidth;
uiSetHeight=boardh;
depth=uiSetDepth+1;     
uiVisible=false;


fc=0;
for (fy=1;fy<=3;fy+=1)  //draw normal keys
  {
     ft=string_length(uiRow[fy]);  //# of keys        
     curx=uiRowStartX[fy]*xfc;
//     cury=(boardy + ((fy-1) * (boardh div 4) + (linespacing*yfc)) * yfc;     //set y  and line spacing   
     cury=(boardy + ((fy-1) * (boardh div 4) + (linespacing*yfc)));     //set y  and line spacing   
     uiRowStartY[fy]=cury;      
     for(fx=1;fx<=ft;fx+=1)
        {   if curState=0 {curchar=string_char_at(uiRow[fy],fx);}                                 
                  else if curState=1 {curchar=string_char_at(uiRowShift[fy],fx);}                                 
                  else if curState=2 {curchar=string_char_at(uiRowAlt[fy],fx);}                                 
            //if curchar='#' curchar='\#';
            with (buttons[fc])
               {
                 x=curx;
                 xstart=x;
                 y=cury;
                 ystart=y;
                 uiTextValue=curchar;
                 uiAlign=fa_center;
                 uiAlignV=fa_middle;
                 depth=other.uiSetDepth-fy;
                 uiSetWidth=other.butwidth;
                 uiSetHeight=other.butheight;
                 uiControlName="key";
                 canfocus=false;
                 uiEventObject=curid;
                 uiEnforceFocus=false;  //work on move finger...
                 uiFont=other.uiFont;
                 uiAnchor=curid;
                 uiBackColor=other.uiKeyBackColor;
                 uiBackColor2=other.uiKeyBackColor2;
                 uiTextColor=other.uiKeyTextColor;
                 uiDownColor=other.uiKeyDownColor;  
                 uiTouchKey=other.uiTouchKey;
                 uiBackScale=other.uiBackScale;
                 uiButtonSprite=other.uiKeySprite;
                 uiSpriteScale=other.uiKeySpriteScale;
               }               
            curx+=butwidth+(uiRowSpacingX[fy]*xfc);   
            fc+=1;         
        } //for each letter in the line string    
  }

  
//draw special keys
     cury=(boardy + (3 * (boardh div 4) + (linespacing*yfc)));     //set y  and line spacing   
     uiRowStartY[4]=cury;      

  butheight -= 12;     
  //back key
  curx=(805*xfc)-butwidth-(10*xfc);
  cury=uiRowStartY[1]+6;
  butwidth=butwidth;
  with (back_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=other.uiBackStr;          
      depth=other.uiSetDepth;      
      uiEventObject=curid;
      uiControlName="back";
      canfocus=false;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiSKeyBackColor;
      uiBackColor2=other.uiSKeyBackColor2;
      uiTextColor=other.uiSKeyTextColor;
      uiDownColor=other.uiSKeyDownColor;                                                 
     
      if other.uiBackStr="" 
         {uiButtonSprite= spr_ui;
          uiSpriteIndex=6; 
         } 
      uiHoverMode=0;   
      
    }  
       
       
  //shift key
  curx=3*xfc;
  cury=uiRowStartY[3]+6;
  butwidth=110 * xfc;
  with (shift_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=other.uiShiftStr;          
      depth=other.uiSetDepth;      
      uiControlName="shift";
      canfocus=false;
      uiEventObject=curid;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiSKeyBackColor;
      uiBackColor2=other.uiSKeyBackColor2;
      uiTextColor=other.uiSKeyTextColor;
      uiDownColor=other.uiSKeyDownColor;   
      if other.uiShiftStr="" 
         {uiButtonSprite= spr_ui;
          uiSpriteIndex=8; 
         }                                               
      uiHoverMode=0;

    }  
        
  //space key
  curx=150*xfc;
  cury=uiRowStartY[4]+2;
  butwidth=500 * xfc;
  with (space_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=" ";          
      depth=other.uiSetDepth;      
      uiEventObject=curid;
      uiControlName="key";
      canfocus=false;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiKeyBackColor;
      uiBackColor2=other.uiKeyBackColor2;
      uiTextColor=other.uiKeyTextColor;
      uiDownColor=other.uiKeyDownColor;                                                 
       
    }      

  //enter key
  curx=685*xfc;
  cury=uiRowStartY[2]+6;
  butwidth=110 * xfc;
  with (enter_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=other.uiEnterStr;          
      depth=other.uiSetDepth;      
      uiEventObject=curid;
      uiControlName="enter";
      canfocus=false;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiSKeyBackColor;
      uiBackColor2=other.uiSKeyBackColor2;
      uiTextColor=other.uiSKeyTextColor;
      uiDownColor=other.uiSKeyDownColor;        
      
      if other.uiEnterStr="" 
         {uiButtonSprite= spr_ui;
          uiSpriteIndex=7; 
         }                                               
      uiHoverMode=0;       
    }     
         
  //state key
  curx=3*xfc;
  cury=uiRowStartY[4]+6;
  butwidth=100 * xfc;
  with (state_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=other.uiStateStr;          
      depth=other.uiSetDepth;      
      uiEventObject=curid;
      uiControlName="state";
      canfocus=false;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiSKeyBackColor;
      uiBackColor2=other.uiSKeyBackColor2;
      uiTextColor=other.uiSKeyTextColor;
      uiDownColor=other.uiSKeyDownColor;
      uiHoverMode=0;       
    }       
     
  //hide key
  curx=720*xfc;
  cury=uiRowStartY[4]+6;
  butwidth=78 * xfc;
  with (hide_key) 
    {
      x=curx;xstart=x;
      y=cury;ystart=y;
      uiSetWidth=other.butwidth;
      uiSetHeight=other.butheight;
      uiTextValue=other.uiHideStr;          
      depth=other.uiSetDepth;      
      uiEventObject=curid;
      uiControlName="hide";
      canfocus=false;
      uiEnforceFocus=false;  //work on move finger...
      uiFont=other.uiFont;
      uiAnchor=curid;
      uiBackColor=other.uiSKeyBackColor;
      uiBackColor2=other.uiSKeyBackColor2;
      uiTextColor=other.uiSKeyTextColor;
      uiDownColor=other.uiKeyBackColor;    
      uiDrawBackColor=false;
      if other.uiHideStr="" 
         {uiButtonSprite= spr_ui;
          uiSpriteIndex=4; 
         } 
      uiHoverMode=0;         
    }       


y=room_height+10;     //move keyboard offscreen
     
     
     
     
     

