///CONSTANTES
#macro TAM_TILE 32


///FUNÇÕES

#region CRIA LISTA DE MOVIMENTO
/// @function scr_create_moveList
/// @arg {int} x_inicial
/// @arg {int} y_inicial
/// @arg {int} x_final
/// @arg {int} y_final
function scr_create_moveList(x1, y1, x2, y2)
{
	{	//INICIALIZAÇÃO	}
		var distancia_x = x2 - x1;
		var distancia_y = y2 - y1;
		var cord_x = x1;
		var cord_y = y1;
		
		move_list = ds_list_create();
		ds_list_clear(move_list);
	}
	
	#region CRIA LISTA DE MOVIMENTO
	ds_list_add(move_list, [cord_x, cord_y]);
	
	if(distancia_x != 0) or (distancia_y != 0)
	{
		do{
			{	//VARIÁVEIS	}
				var _dist_x = abs(distancia_x);
				var _dist_y = abs(distancia_y);
				//DEFINE DIREÇÃO | Positivo = Eixo X | Negativo = Eixo Y
				if(_dist_x == _dist_y) var move_dir = choose(-1, 1);
				else var move_dir = sign(_dist_x - _dist_y);
				//DEFINE SENTIDO | Positivo = ++     | Negativo = --
				if (move_dir == 1) var move_sent = sign(distancia_x);
				else if (move_dir == -1) var move_sent = sign(distancia_y);
			}
			
			#region ESCREVE NA LISTA
			if(move_dir == 1)
			{
				distancia_x -= move_sent;
				cord_x += move_sent;
			}
			else if(move_dir == -1)
			{
				distancia_y -= move_sent;
				cord_y += move_sent;
			}
			ds_list_add(move_list, [cord_x, cord_y]);
			#endregion
		} until(distancia_x == 0) and (distancia_y == 0);
	}
	ds_list_add(move_list, "FIM");
	#endregion
	
	//for(var i = 0; i < ds_list_size(move_list); i++) show_message("i: "+ string(i) + " = " + string(move_list[|i]));
	
	return move_list;
}
#endregion
