#region MOSTRAR ALCANCE
var acendendo = isSelec && switch1;
var apagando = !isSelec && !switch1;
if (acendendo)
{
	with(global.id_Controle_Mapa)
	{
		{//VARIÁVEIS
			var x1 = other.cord_x - other.movimento;
			var x2 = other.cord_x + other.movimento;
			var y1 = other.cord_y - other.movimento;
			var y2 = other.cord_y + other.movimento;
			var range_min = other.alcance[0];
			var range_max = other.alcance[1];
		}
		
		for(var i = x1; i <= x2; i++)			// caminha pelas linhas
		{
			for(var j = y1; j <= y2; j++)		// caminha pelas colunas
			{
				{//VARIÁVEIS
					var xx1 = i - range_max;
					var xx2 = i + range_max;
					var yy1 = j - range_max;
					var yy2 = j + range_max;
					var inTelaX	= (i >= 0 && i < global.larg_tela);
					var inTelaY	= (j >= 0 && j < global.alt_tela);
					var distancia = abs(other.cord_x - i) + abs(other.cord_y - j);
				}
				
				if(inTelaX && inTelaY) and (distancia <= other.movimento)
				{
					if (Casa[i][j].estado != "movimento") Casa[i][j].estado = "movimento";
					
					if(range_max != 0)
					{
						#region ALCANCE ATAQUE //Tranformar em função para reusar quando for atacar
						for(var p = xx1; p <= xx2; p++)			// caminha pelas linhas
						{
							for(var q = yy1; q <= yy2; q++)		// caminha pelas colunas
							{
								{//VARIÁVEIS
									var inTelaXX = (p >= 0 && p < global.larg_tela);
									var inTelaYY = (q >= 0 && q < global.alt_tela);
									var alcance = abs(i - p) + abs(j - q);
								}
							
								if(inTelaXX && inTelaYY) and (range_min <= alcance && alcance <= range_max)
								{
									if(Casa[p][q].estado == "nenhum") Casa[p][q].estado = "ataque";
								}
							}
						}
						#endregion
					}
				}
			}
		}
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
	with(global.id_Controle_Mapa) apaga_Tile();
	var Cursor = instance_find(obj_Cursor, 0);
	Cursor.id_Aliado = noone;
	Cursor.isAliado_Movendo = false;
	
	switch1 = true;
}
#endregion


#region MOVIMENTO

//NOTA: eu tô com a impressão que ele às vezes tá enganchando enquanto anda

if(isMovendo)
{
	if(switch_debug)
	{
		switch_debug = false;
		for(var k = 0; k < ds_list_size(move_list); k++) show_message("Só pra garantir: " + move_list[|k]);
	}
	
	isSelec = false;
	if(move_list[|contador1] == "INICIO") contador1 = 1;
	var i = contador1;
	
	{	//PEGA DIREÇÃO
		var direcao = 0;
		if(move_list[|i] == "ESQUERDA") or (move_list[|i] == "DIREITA") direcao = 1;
		else if(move_list[|i] == "CIMA") or (move_list[|i] == "BAIXO") direcao = -1;
	}
	{	//PEGA SENTIDO
		var sentido = 0;
		if(move_list[|i] == "DIREITA") or (move_list[|i] == "BAIXO") sentido = 1;
		else if(move_list[|i] == "ESQUERDA") or (move_list[|i] == "CIMA") sentido = -1;
	}
		
	#region MOVIMENTAÇÃO
	{	//VARIÁVEIS
		if(direcao == 1)
		{
			var xx = abs(cord_x * TAM_TILE - x);
			var velocidade = lerp(0, 48 - xx, mod_vel);
		}
		else
		{
			var yy = abs(cord_y * TAM_TILE - y);
			var velocidade = lerp(0, 48 - yy, mod_vel);
		}
	}
	//show_message(string(cord_x * TAM_TILE) + " - " + string(x) + " = " + string(xx) + " -> 48   |   " + string(velocidade));
		
	velocidade = clamp(velocidade, 2, 12);
	repeat(floor(velocidade))
	{
		if(abs(cord_x * TAM_TILE - x) == 48) or (abs(cord_y * TAM_TILE - y) == 48)
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

	if(move_list[|contador1] == "FIM")
	{
		switch_debug = true;
		contador1 = 0;
		isMovendo = false;
		ds_list_destroy(move_list);
	}
}
#endregion
