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



//	MÉTODOS
#region MOTSRA AREA DE MOVIMENTO
show_MoveArea = function(cord_x, cord_y, movimento, alcance_min, alcance_max)
{
	set_MoveArea(cord_x, cord_y, movimento);
	
	{	//VARIÁVEIS	}
		var _x1 = cord_x - movimento;
		var _x2 = cord_x + movimento;
		var _y1 = cord_y - movimento;
		var _y2 = cord_y + movimento;
	}
	for(var i = clamp(_x1, 0, global.larg_tela-1); i <= clamp(_x2, 0, global.larg_tela-1); i++)		// Percorre as linhas
	{
		for(var j = clamp(_y1, 0, global.alt_tela-1); j <= clamp(_y2, 0, global.alt_tela-1); j++)	// Percorre as colunas
		{			
			if(Casa[i][j].distancia != -1)
			{
				/*if(Casa[i][j].estado != "movimento")*/Casa[i][j].estado = "movimento";
				if(alcance_max > 0) show_AttackRange(i, j, alcance_min, alcance_max);
			}
		}
	}
}
#endregion

#region DEFINI AREA DE MOVIMENTO
set_MoveArea = function(cord_x, cord_y, movimento)
{
	Casa[cord_x][cord_y].distancia = 0;
	for(var p = 1; p <= movimento; p++) // Contador de passos
	{
		for(var i = clamp(cord_x - p, 0, global.larg_tela-1); i <= clamp(cord_x + p, 0, global.larg_tela-1); i++) // Percorre X
		{
			for(var j = clamp(cord_y - p, 0, global.alt_tela-1); j <= clamp(cord_y + p, 0, global.alt_tela-1); j++) // Percorre Y
			{
				if(!Casa[i][j].isSolido) and (Casa[i][j].distancia == -1)
				{
					{	//VARIÁVEIS	}
						var _esquerda = false, _direita = false, _cima = false, _baixo = false;
						if(0 < i) _esquerda = Casa[i-1][j].distancia == p-1;
						if(i-1 < global.larg_tela) _direita = Casa[i+1][j].distancia == p-1;
						if(0 < j) _cima = Casa[i][j-1].distancia == p-1;
						if(j-1 < global.alt_tela) _baixo = Casa[i][j+1].distancia == p-1;
					}
					if(_esquerda || _direita || _cima || _baixo) Casa[i][j].distancia = p;
				}
			}
		}
	}
}
#endregion

#region MOSTRA AREA DE ATAQUE
show_AttackRange = function(cord_x, cord_y, alcance_min, alcance_max)
{
	{	//VARIÁVEIS	}
		var _x1 = cord_x - alcance_max;
		var _x2 = cord_x + alcance_max;
		var _y1 = cord_y - alcance_max;
		var _y2 = cord_y + alcance_max;
	}
	
	for(var i = clamp(_x1, 0, global.larg_tela-1); i <= clamp(_x2, 0, global.larg_tela-1); i++)		// Percorre as linhas
	{
		for(var j = clamp(_y1, 0, global.alt_tela-1); j <= clamp(_y2, 0, global.alt_tela-1); j++)	// Percorre as colunas
		{
			{	//VARIÁVEIS	}
				var alcance = abs(cord_x - i) + abs(cord_y - j);
				var inAlcance = alcance_min <= alcance && alcance <= alcance_max
			}
			if(inAlcance) and (Casa[i][j].estado == "nenhum") Casa[i][j].estado = "ataque";
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
