///CONSTANTES

#macro TAM_TILE 48


///FUNÇÕES

#region CRIA LISTA DE MOVIMENTO
/// @function scr_moveList
/// @arg {int} x_inicial
/// @arg {int} y_inicial
/// @arg {int} x_final
/// @arg {int} y_final
function scr_moveList(x1, y1, x2, y2)
{
	{	//INICIALIZAÇÃO
		var distancia_x = x2 - x1;	//Distancia no eixo x
		var distancia_y = y2 - y1;	//Distancia no eixo y
	
		move_list = ds_list_create();
		ds_list_clear(move_list);
	}
	
	ds_list_add(move_list, "INICIO");
	do
	{
		var _dist_x = abs(distancia_x)
		var _dist_y = abs(distancia_y)
		{	//DEFINE DIREÇÃO | Positivo = Eixo X | Negativo = Eixo Y
			var move_dir = 0;
			if (_dist_x == _dist_y) move_dir = choose(-1, 1);
			else move_dir = sign(_dist_x - _dist_y);
		}
		
		{	//DEFINE SENTIDO | Positivo = ++     | Negativo = --
			var move_sent = 0;
			if (move_dir == 1) move_sent = 1 * sign(distancia_x);
			else if (move_dir == -1) move_sent = 1 * sign(distancia_y);
		}
		
		#region ESCREVE NA LISTA
		if(move_dir == 1)
		{
			distancia_x -= move_sent;
			if(move_sent == 1) ds_list_add(move_list, "DIREITA");
			else ds_list_add(move_list, "ESQUERDA");
		}
		else if(move_dir == -1)
		{
			distancia_y -= move_sent;
			if (move_sent == -1) ds_list_add(move_list, "CIMA");
			else ds_list_add(move_list, "BAIXO");
		}
		#endregion
	} until(distancia_x == 0) and (distancia_y == 0);
	ds_list_add(move_list, "FIM");

	return move_list;
}
#endregion
