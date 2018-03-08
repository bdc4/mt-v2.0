/// @description called to restore states of children

//uses variable whatchanged to determine what array to restore;

var fx,curInst;

if whatchanged==0 exit; //failsafe;


fx=0;

for (fx=0;fx<array_length_1d(array_ids);fx+=1)
   {
     if instance_exists(array_ids[fx])   //see if instance id is still around
        with (array_ids[fx])  
          {
            if other.whatchanged==1 uiEnabled=other.array_Enabled[fx];
            else if other.whatchanged==2 uiVisible=other.array_Visible[fx];          
          }
   }

array_ids=0;   //clear array_ids
if whatchanged==1 array_Enabled=0;  //reset array
if whatchanged==2 array_Visible=0;  //reset array  



