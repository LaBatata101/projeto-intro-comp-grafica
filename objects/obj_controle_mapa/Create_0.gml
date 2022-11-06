randomize();

#region VARIÁVEIS
//SELEÇÃO
Selecionado = noone;
Selecionado_buffer = noone;

//ROOM
global.alt_tela = round(room_height) div TAM_TILE; 
global.larg_tela = round(room_width) div TAM_TILE;

//Extra
global.id_Controle_Mapa = id;
#endregion


//CONSTRUINDO FASE

#region GERAR GRID
for(var i = 0; i < global.larg_tela; i++)
{
	for(var j = 0; j < global.alt_tela; j++)
	{
		Casa[i][j] = instance_create_layer(i * TAM_TILE, j * TAM_TILE, "Grid", obj_Tile,
		{
			cord_x : i,
			cord_y : j
		});
	}
}
#endregion

#region POSICIONAR ALIADOS
//Teste apenas com um
Aliado = instance_create_layer(TAM_TILE,TAM_TILE, "Unidades", obj_EntidadePai);
with(Aliado)
{
	cord_x = 1;
	cord_y = 1;
}
#endregion

#region CRIANDO CURSOR
instance_create_layer(0,0, "Cursor", obj_Cursor,
{
	cord_x : 0,
	cord_y : 0
});
#endregion


// MÉTODOS

#region MOTSRA AREA MOVIMENTO
show_MoveArea = function(cord_x, cord_y, movimento, alcance_min, alcance_max)
{
	{	//VARIÁVEIS
		var _x1 = cord_x - movimento;
		var _x2 = cord_x + movimento;
		var _y1 = cord_y - movimento;
		var _y2 = cord_y + movimento;
	}
	
	for(var i = _x1; i <= _x2; i++)			// caminha pelas linhas
	{
		for(var j = _y1; j <= _y2; j++)		// caminha pelas colunas
		{
			{	//VARIÁVEIS
				var inTelaX	= (i >= 0 && i < global.larg_tela);
				var inTelaY	= (j >= 0 && j < global.alt_tela);
				var distancia = abs(cord_x - i) + abs(cord_y - j);
			}
			
			if(inTelaX && inTelaY) and (distancia <= movimento)
			{
				if (Casa[i][j].estado != "movimento") Casa[i][j].estado = "movimento";
				
				if (alcance_max > 0) show_AtqArea(i, j, alcance_min, alcance_max);
			}
		}
	}
}
#endregion

#region MOSTRA AREA ATAQUE
show_AtqArea = function(cord_x, cord_y, alcance_min, alcance_max)
{
	{	//VARIÁVEIS
		var _x1 = cord_x - alcance_max;
		var _x2 = cord_x + alcance_max;
		var _y1 = cord_y - alcance_max;
		var _y2 = cord_y + alcance_max;
	}
	
	for(var i = _x1; i <= _x2; i++)			// caminha pelas linhas
	{
		for(var j = _y1; j <= _y2; j++)		// caminha pelas colunas
		{
			{//VARIÁVEIS
				var inTelaXX = (i >= 0 && i < global.larg_tela);
				var inTelaYY = (j >= 0 && j < global.alt_tela);
				var alcance = abs(cord_x - i) + abs(cord_y - j);
			}
					
			if(inTelaXX && inTelaYY) and (alcance_max >= alcance && alcance >= alcance_min) and (Casa[i][j].estado == "nenhum") Casa[i][j].estado = "ataque";
		}
	}
}
#endregion

#region RESETA OS TILES
reseta_Tiles = function()
{
	for(var i = 0; i < global.larg_tela; i++) for(var j = 0; j < global.alt_tela; j++)
	{
		if(Casa[i][j].estado != "nenhum") or (Casa[i][j].distancia != -1) //or (...)
		{
			with(Casa[i][j])
			{
				estado = "nenhum";
				distancia = -1;
				//...
			}
		}
	}
}
#endregion
