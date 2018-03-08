/// @description movement animation


with (EaseControl) do 
{
     if other.initvars    //first step
        {
                uiAniX= uiMoveX- x;
                uiAniY= uiMoveY- y;
                 if uiAniX!=0  {    other.EaseStart=0;
                                    other.EaseEnd=abs(uiAniX);                    
                                    uiAniY=0;  //don't support both movements
                               } 
                 else          {    other.EaseStart=0;
                                    other.EaseEnd=abs(uiAniY);                                                                       
                                    uiAniX=0; //don't support both movements
                               }   
        other.initvars=false;          
        } //if first step, we setup variables for movement;                       
                               
                               
   
   if (uiAniX != 0) 
      {  
       if uiAniX>0 x=uiMoveX-(uiAniX-other.EaseCurValue);
          else     x=uiMoveX+(abs(uiAniX)-other.EaseCurValue);
      }

   if (uiAniY != 0) 
      {  
       if uiAniY>0 y=uiMoveY-(uiAniY-other.EaseCurValue);
          else     y=uiMoveY+(abs(uiAniY)-other.EaseCurValue);
      }     
      

} //with control      

event_user(1); //ease function
      

