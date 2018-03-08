/// @description destroy memory

var fx;

for (fx=0;fx<numkeys;fx+=1)
    {  with (buttons[fx])  {instance_destroy();} }

with (shift_key) {instance_destroy();};
with (space_key) {instance_destroy();};
with (state_key) {instance_destroy();};
with (back_key)  {instance_destroy();};
with (enter_key) {instance_destroy();};
with (hide_key) {instance_destroy();};
    
          

