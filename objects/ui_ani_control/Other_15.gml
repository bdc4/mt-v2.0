/// @description sparkle


with (EaseControl) do 
{
     if other.initvars    //first step
        {
        other.EaseStart=0;
        other.EaseEnd=100;                                                                                        
        other.initvars=false;          
        other.KillEase=false; //don't destroy;
        other.EaseType=1;
        } //if first step, we setup variables for movement;      
        
    if (other.EaseCurValue mod uiSparkle == 0) && (uiEnabled)
       {
       effect_create_above(ef_spark, x + random(sprite_width), y + random(sprite_height), choose(0,1,2),merge_color(c_white, c_yellow, (irandom(10)/10)));
       
       }
            
}        
               
event_user(1); //ease function


