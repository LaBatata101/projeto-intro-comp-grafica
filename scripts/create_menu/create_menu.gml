/// @function draw_menu(menu_options, x_pos, y_pos, menu_items_gap, selected_color, text_color, current_item_selected_index)
/// @param {array} menu_options						An array of strings with the items of the menu that will be drawn.
/// @param {real}  x_pos							The x position where the menu will be drawn.
/// @param {real}  y_pos							The y position where the menu will be drawn.
/// @param {real}  menu_items_gap					The amount of space between the menu items.
/// @param {hexadecimal} selected_color				The color of the selected menu item.
/// @param {hexadecimal} text_color					The color of the text of the menu.
/// @param {int64} current_item_selected_index		The index of the selected menu item.
/// @param {Font} font								The font to be used for the menu item's text.
/// @description									Function to drawn a menu, must be used inside the Draw event.
function draw_menu(menu_options, x_pos, y_pos, menu_items_gap,
				   selected_color, text_color, current_item_selected_index,
				   font, is_keyboard_used, is_mouse_used) {
	draw_set_font(font);
	for (var i = 0; i < array_length(menu_options); i++) {
		if (current_item_selected_index == i) {
			color = selected_color;	
		} else {
			var color = text_color;
		}
		
		var str_width = string_width(menu_options[i]);
		var str_height = string_height(menu_options[i]);
		
		var x1 =  x_pos - str_width / 2; // left side of the string
		var y1 = y_pos + menu_items_gap * i; // top side of the string
		
		var is_mouse_hovering = point_in_rectangle(mouse_x, mouse_y, x1, y1, x1 + str_width, y1 + str_height);

		if (is_mouse_hovering) {
			color = selected_color;
		}
		
		// draw string centered
		draw_text_color(x1, y1, menu_options[i], color, color, color, color, 1);	
	}
}