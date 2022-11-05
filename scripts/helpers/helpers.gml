// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function is_mouse_moving(){
	var moving = point_distance(global.current_mouse_x, global.current_mouse_y, mouse_x, mouse_y);
	global.current_mouse_x = mouse_x;
	global.current_mouse_y = mouse_y;
	
	return moving;
}