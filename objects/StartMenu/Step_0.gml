up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
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
			room_goto(rm_batalha_teste);
			break;
		case 2:
			room_goto(rm_menu_settings);
			break;
		// Exit
		case 3:
			game_end();
			break;
	}	
}