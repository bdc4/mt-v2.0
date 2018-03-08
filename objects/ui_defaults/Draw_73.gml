if uiAniDrawGlow
{
                CurFading += uiFadingSpeed;
                if CurFading > max(0.6,uiGlowing) { CurFading=max(0.6,uiGlowing); uiFadingSpeed *= -1;}
                else if CurFading < 0.1 { CurFading=0.1; uiFadingSpeed *= -1;}          
                draw_set_alpha(CurFading);
                draw_set_blend_mode(bm_add);
                draw_ellipse_color(x, y, x+sprite_width, y+sprite_height, c_white, c_black, false);
                draw_set_blend_mode(bm_normal); 
                draw_set_alpha(uiAlpha);
}       

       

