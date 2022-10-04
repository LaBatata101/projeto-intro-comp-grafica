#region MOVIMENTAÇÃO
var cima = keyboard_check(ord("W"));
var baixo = keyboard_check(ord("S"));
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));

//NOTA: seria interessante um sistema em que quanto mais tempo precionado, mais rápido o cursor fica (fácil)
//NOTA: seria interessante uma resistencia em sair da área selecionada de movimentação em vez de só desselecionar

if(!switch1)
{	
	switch2 = true;
	velh = (direita - esquerda) * veloc;
	velv = (baixo - cima) * veloc;
}
else
{	
	buffer_move = 3;
	
	#region OLHA ESTADO DO PROX. TILE
	if(switch2)
	{
		var _Tile = instance_place(x + sign(velh)*TAM_TILE, y + sign(velv)*TAM_TILE, obj_Tile);
		if(_Tile) if(_Tile.estado != "movimento")
		{
			if(id_Aliado) with(id_Aliado)
			{
				isSelec = false;
				isMovendo = false;
			}
			isAliado_Movendo = false;
		}
		switch2 = false;
	}
	#endregion
	
	#region HORIZONTAL
	var _velh = sign(velh);
	if (cord_x + _velh == -1) or (cord_x + _velh >= global.larg_tela) velh = 0;
	var xx = cord_x * TAM_TILE;
	repeat(abs(velh))
	{
		if (abs(xx - x) == 48)
		{
			cord_x += _velh;
			velh = 0;
			show_debug_message("Cursor (" + string(cord_x) + "," + string(cord_y) + ")");
			
			break;
		}
		
		x += _velh;
	}
	#endregion
	
	#region VERTICAL
	var _velv = sign(velv);
	if (cord_y + _velv == -1) or (cord_y + _velv >= global.alt_tela) velv = 0;
	var yy = cord_y * TAM_TILE;
	repeat(abs(velv))
	{
		if (abs(yy - y) == 48)
		{
			cord_y += _velv;
			velv = 0;
			show_debug_message("Cursor (" + string(cord_x) + "," + string(cord_y) + ")");
			
			break;
		}
		
		y += _velv;
	}
	#endregion
}
if(velh == 0) and (velv == 0) switch1 = false;
else if(buffer_move == 0) switch1 = true;
else buffer_move--;
#endregion

#region APARENCIA
var isEnti = position_meeting(x,y, obj_EntidadePai)
if(isEnti) and (!switch1) image_index = 0;
#endregion



#region COMPORTAMENTOS
if (keyboard_check_pressed(vk_enter)) and (!switch1)
{
	#region COMP. PADRÃO
	if(!isAliado_Movendo) and (!isAliado_Atacando)
	{
		var Objeto = instance_position(x,y, obj_EntidadePai);
		if(Objeto != noone)	//Se existir uma Unidade
		{
			show_debug_message("Unidade: (" + string(Objeto.cord_x) + "," + string(Objeto.cord_y) + ")");
		}
		else				//Se não tiver, pega o Tile
		{
			Objeto = instance_position(x,y, obj_Tile);
			show_debug_message("Tile: (" + string(Objeto.cord_x) + "," + string(Objeto.cord_y) + ")");
		}
	
		if(!Objeto.isSelec) global.id_Controle_Mapa.Selecionado_buffer = Objeto;
		else global.id_Controle_Mapa.Selecionado = noone;
		Objeto.isSelec = !Objeto.isSelec;
	}
	#endregion
	
	
	#region MOVENDO ALIADO
	if(isAliado_Movendo) and (!isAliado_Atacando)
	{
		if(id_Aliado.cord_x != cord_x) or (id_Aliado.cord_y != cord_y)
		{
			with(id_Aliado)
			{
				move_list = scr_moveList(cord_x, cord_y, other.cord_x, other.cord_y);
				isMovendo = true;
			}
		}
		else
		{
			id_Aliado.isSelec = false;
			id_Aliado.isMovendo = false;
		}
		isAliado_Movendo = false;
	}
	#endregion
	
	
	#region ATACANDO COM ALIADO
	//apenas se move pelos Tiles vermelhas
	//se selecionar um Tile, a Unidade ataca
	#endregion
}
#endregion
