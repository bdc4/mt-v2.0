/// @description Set up GUI controller
// You can write your code in this editor
#region Controller
if keyboard_check_pressed(ord("R")) game_restart();

if keyboard_check_pressed(vk_f4)
   {
   if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
   else
      {
      window_set_fullscreen(true);
      }
   }
#endregion


/*
#region Rightbox Easing
if (rb_easing[? "time"] < rb_easing[? "duration"]) {
	rightboxArea[0] = ease_out_back(rb_easing[? "time"],rb_easing[? "start"],rb_easing[? "dest"]-rb_easing[? "start"],rb_easing[? "duration"]);
	rb_easing[? "time"]++;
}
#endregion
*/