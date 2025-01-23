/// @description move

y = lerp(y, target_y, anim_spd);
if(!show)
{
    y = target_y; // snap
    show = true;    
}
