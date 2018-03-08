/// @description called to save states of children

//uses variable whatchanged to determine what array to save.

var fx,curid;

if whatchanged==0 exit; //failsafe;

array_ids=0;   //clear array_ids

fx=0;
with ui_defaults do  //assign array of ids
  {      
     if uiAnchor == other.id {  other.array_ids[fx]=id;
                                if other.whatchanged==1 
                                      {  other.array_Enabled[fx]=uiEnabled;
                                         uiEnabled=other.uiEnabled;
                                      }   
                                 else if other.whatchanged==2 
                                                { other.array_Visible[fx]=uiVisible;
                                                  uiVisible=other.uiVisible;
                                                }   
                                 fx +=1;
                             }      
  }
  

  


