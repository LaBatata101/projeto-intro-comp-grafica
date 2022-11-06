#region MOSTRAR ALCANCE
var acendendo = isSelec && switch1;
var apagando = !isSelec && !switch1;
if(acendendo)
{
	with(global.id_Controle_Mapa)
	{
		show_MoveArea(other.cord_x, other.cord_y, other.movimento, other.alcance[0], other.alcance[1]);
	}	
	if(isAliado)
	{
		var Cursor = instance_find(obj_Cursor, 0);
		Cursor.id_Aliado = id;
		Cursor.isAliado_Movendo = true;
	}
	
	switch1 = false;
}
else if(apagando)
{
	with(global.id_Controle_Mapa) reseta_Tiles();	
	switch1 = true;
}
#endregion

#region MOVIMENTO
if(isMovendo)
{
	{	//INICIALIZAÇÃO	}
		if(isSelec) isSelec = false;
		var i = contador1;
	}
	
	if(move_list[|i] != "FIM")
	{	
		{	//PEGA DIREÇÃO E SENTIDO	}
			var diferenca_x = move_list[|i][0] - move_list[|i-1][0];
			var diferenca_y = move_list[|i][1] - move_list[|i-1][1];
			
			if(diferenca_x != 0)
			{
				var direcao = 1;
				var sentido = diferenca_x;
			}
			else if(diferenca_y != 0)
			{
				var direcao = -1;
				var sentido = diferenca_y;
			}
		}
	
		#region MOVIMENTAÇÃO
		{	//VARIÁVEIS	}
			var xx = abs(cord_x * TAM_TILE);
			var yy = abs(cord_y * TAM_TILE);
		}
		repeat(veloc)
		{
			if(abs(xx - x) == TAM_TILE) or (abs(yy - y) == TAM_TILE)
			{
				if(direcao == 1) cord_x += sentido;
				else cord_y += sentido;
				contador1++;
				break;
			}
		
			if(direcao == 1) x += sentido;
			else y += sentido;
		}
		#endregion
	}
	else
	{
		var Cursor = instance_find(obj_Cursor, 0);
		Cursor.id_Aliado = noone;
		Cursor.isAliado_Movendo = false;
		contador1 = 1;
		isMovendo = false;
		ds_list_destroy(move_list);
	}
}
#endregion
