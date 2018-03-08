var fx,ch;

CurDispText=uiTextValue;
CurStartIndex=1; 
CurTypeIndex=1;
  
      if uiPath != -1 
       {path_start(uiPath,uiPathSpeed,2,uiPathAbsolute);
        if uiPathSpeed==0 {path_position=0.0005;}
        CurInMotion=true;}      
       
//clear all arrays
       
uiCArray=0;
uiCArrayXpos=0;
uiCArrayYpos=0;
uiCArrayRot=0;
uiCArrayZoom=0;
uiCArrayAlpha=0;       
uiCArrayColor=0;

for (fx=1;fx<=string_length(CurDispText);fx+=1)
  {
   uiCArray[fx]=string_char_at(CurDispText,fx);
   uiCArrayXpos[fx]=0;
   uiCArrayYpos[fx]=0;
   uiCArrayRot[fx]=0;
   uiCArrayZoom[fx]=uiXscale;
   uiCArrayAlpha[fx]=uiAlpha;                
   uiCArrayColor[fx]=uiTextColor;
   
  }
  
  
CurCanDraw=true;  //can show now...

if (uiWobble != 0) || (uiPulse != 0) || (uiFading != 0)
     {CurAnimated=true;} else {CurAnimated=false;}



       

