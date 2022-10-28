up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

selected_menu_item_index += down_key - up_key;

if selected_menu_item_index >= menu_length {
	selected_menu_item_index = 0;
}

if selected_menu_item_index < 0 {
	selected_menu_item_index = menu_length - 1;
}

if accept_key {
	switch (selected_menu_item_index) {
		// Start Game
		case 0:
			room_goto_next();
			break;
		// Exit
		case 3:
			game_end();
			break;
	}	
}