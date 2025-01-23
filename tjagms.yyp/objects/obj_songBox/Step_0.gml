/// @description move

y = lerp(y, target_y, anim_spd);
if(abs(target_y - y) < 600 && !show)
{
    y = target_y; // snap
}


if(!show && target_y == y)
{
    
    show = true;    
    
}