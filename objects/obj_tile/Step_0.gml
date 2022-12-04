if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, self)) isSolido = !isSolido;

#region SPRITE
if(isSolido) sprite_index = spr_Tile_parede;
else sprite_index = spr_Tile;
#endregion


