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
		var _Tile = instance_position(i*TAM_TILE,j*TAM_TILE, obj_Tile);
		if(_Tile == noone) Casa[i][j] = instance_create_layer(i * TAM_TILE, j * TAM_TILE, "Grid", obj_Tile);
		else Casa[i][j] = _Tile;
		with(Casa[i][j])
		{
			cord_x = i;
			cord_y = j
		}
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
	
	algoritmo_MC(cord_x, cord_y, movimento);
	
	for(var i = _x1; i <= _x2; i++)			// caminha pelas linhas
	{
		for(var j = _y1; j <= _y2; j++)		// caminha pelas colunas
		{
			{	//VARIÁVEIS
				var inTelaX	= (0 <= i && i < global.larg_tela);
				var inTelaY	= (0 <= j && j < global.alt_tela);
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

#region Algoritmo de melhor caminho
algoritmo_MC = function(cord_x, cord_y, movimento)
{
	Casa[cord_x][cord_y].distancia = 0;
	for(var p = 1; p <= movimento; p++) //CONTADOR DE PASSOS
	{
		for(var i = cord_x - p; i <= cord_x + p; i++) //PERCORRE X
		{
			for(var j = cord_y - p; j <= cord_y + p; j++) //PERCORRE Y
			{
				if(!Casa[i][j].isSolido)
				{
					if(0 <= i) var _cima = Casa[i-1][j].distancia != -1;
					if(i < global.larg_tela) var _baixo = Casa[i+1][j].distancia != -1;
					if(0 <= j) var _esquerda = Casa[i][j-1].distancia != -1;
					if(j < global.alt_tela) var _direita = Casa[i][j+1].distancia != -1;
					if(_cima || _baixo || _esquerda || _direita) Casa[i][j].distancia = p;
				}
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
