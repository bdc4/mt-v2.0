/// @description create dialog and it's components

var dw,dh,cury,curx,butwidth,curb,fx;

dw=uiDialogWidth;
dh=sprite_height;

if uiDialogPosY !=-1 y=uiDialogPosY;
if uiDialogPosX !=-1 x=uiDialogPosX;


uiNumButtons=0;   //calculate Number of buttons.
for (fx=1;fx<=4;fx+=1)
{

   switch (fx)
    {
      case 1: curb=uiButtons1; break;
      case 2: curb=uiButtons2; break;
      case 3: curb=uiButtons3; break;
      case 4: curb=uiButtons4; break;
    }  //switch      

  with (curb) do
  { if (uiTextValue !="") {other.uiNumButtons+=1;}
    if other.uiFadeOut==true uiEnabled=false else uiEnabled=true; }  
}

//make sure we have at least one button
if uiNumButtons==0 {
                     uiButtons1.uiTextValue="OK";
                     uiNumButtons=1;                   
                   } 
  



cury=y+10;
butwidth=(dw div uiNumButtons)-(dw div 14);  //but width less 10%
butspace=dw div 14;


with uiTitle 
  {
     x=other.x+10;
     y=cury;  
     uiSetWidth=dw;
     lasttext="" ;  //force resize
     uiAlpha=other.uiAlpha;
     uiVisible=other.uiVisible;     
  }
  
cury+=uiTitle.uiCurHeight;

  
with uiSubTitle 
  {
     x=other.x+10;
     y=cury;  
     uiSetWidth=dw-20;
     lasttext="" ;  //force resize
     uiAlpha=other.uiAlpha;
     uiVisible=other.uiVisible;     
  }
  
cury += uiSubTitle.uiCurHeight+8;  
  

uiEditBox1.uiVisible=false;  
if (uiEditBox1.uiTextLabel =="") 
     {
       uiEditBox1.uiVisible=false;          
     }
else
     {
     with (uiEditBox1) 
         {x=other.x+ ( dw div 2);  //center edit1box
          y=cury;
          uiSetWidth=(dw div 2)-50;
          uiAlpha=other.uiAlpha;
          uiVisible=other.uiVisible;   
         } 
     cury += uiEditBox1.uiCurHeight+5;      
     }   

uiEditBox2.uiVisible=false;  
if (uiEditBox2.uiTextLabel =="") 
     {
       uiEditBox2.uiVisible=false;          
     }
else
     {
     with (uiEditBox2) 
         {x=other.x+ ( dw div 2);  //center edit1box
          y=cury;
          uiSetWidth=(dw div 2)-50;
          uiAlpha=other.uiAlpha;
          uiVisible=other.uiVisible;   
         } 
     cury += uiEditBox2.uiCurHeight+5;      
     }        
       
  
uiCheckBox.uiVisible=false;  
if (uiCheckBox.uiTextValue =="") 
     {
       uiCheckBox.uiVisible=false;          
     }
else
     {
     with (uiCheckBox) 
         {x=other.x+ (( dw-(string_width(string_hash_to_newline(uiTextValue))+150)) div 2);  //center checkbox!
          y=cury;
          uiSetWidth=string_width(string_hash_to_newline(uiTextValue))+100;
          uiAlpha=other.uiAlpha;
          uiVisible=other.uiVisible;     
         } 
     cury += uiCheckBox.uiCurHeight+5;     
     }   
       
cury+=20;
curx=x+( (dw-((uiNumButtons*(butwidth))+((uiNumButtons-1)*butspace))     ) div 2);

for (fx=1;fx<=uiNumButtons;fx+=1)
{

   switch (fx)
    {
      case 1: curb=uiButtons1; break;
      case 2: curb=uiButtons2; break;
      case 3: curb=uiButtons3; break;
      case 4: curb=uiButtons4; break;
    }  //switch      

  with (curb) do
  {
   if (uiTextValue =="") 
     {
       uiVisible=false;          
     }
     else
     {
       x=curx;  //center checkbox!
       y=cury;
       uiSetWidth=butwidth;
       uiAlpha=other.uiAlpha;
       uiVisible=other.uiVisible;         
     }
   }
  curx+=butwidth+butspace; 
} //for loop


uiSetHeight=(cury+uiButtonHeight+10)-y;
uiSetWidth=uiDialogWidth;
    

if uiDialogPosX=-1 {x=(room_width-uiDialogWidth) div 2;}     //auto-center;
if uiDialogPosY=-1 {y=(room_height-sprite_height) div 2;}    //auto-center;







