#region MOVIMENTAÇÃO
var cima = keyboard_check(ord("W"));
var baixo = keyboard_check(ord("S"));
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));

if(!switch1)
{
	if !(id_Aliado && id_Aliado.isMovendo)
	{
		velh = (direita - esquerda) * veloc;
		velv = (baixo - cima) * veloc;
	}
	#region SE O MOVIMENTO FOR CONTINUO, DESLIGA O DELAY
	if(velh_buffer != 0 || velv_buffer != 0) and (velh_buffer == sign(velh)) and (velv_buffer == sign(velv)) delay_move = 0;
	else 
	{
		velh_buffer = 0;
		velv_buffer = 0;
	}
	#endregion
	switch2 = true;
}
else if(switch1) and (!id_Aliado || (id_Aliado && !id_Aliado.isMovendo))
{
	#region GERENCIADOR DA LISTA DE MOVIMENTO
	if(isAliado_Movendo) and (switch2)
	{
		#region CASO NÃO HAJA, CRIA UMA
		if(!ds_exists(move_list, ds_type_list))
		{
			move_list = ds_list_create();
			ds_list_clear(move_list);
			ds_list_add(move_list, [cord_x, cord_y]);
		}
		#endregion
		
		#region GERENCIA A LSITA DE MOVIMENTO
		if(ds_list_find_index(move_list, "FIM") != -1) ds_list_delete(move_list, ds_list_size(move_list) -1);

		{	//VARIÁVEIS	}
			var prox_x = cord_x + sign(velh);
			var prox_y = cord_y + sign(velv);
			var prox_Tile = instance_place(prox_x*TAM_TILE, prox_y*TAM_TILE, obj_Tile);
		}
		if(prox_Tile != noone && prox_Tile.estado == "movimento")
		{
			{	//VARIÁVEIS	}
				var i = ds_list_size(move_list)-1;
				var diferenca = [move_list[|i][0] - prox_x, move_list[|i][1] - prox_y];
				
				var linear = abs(diferenca[0]) == 1 || abs(diferenca[1]) == 1;
				var unico = true;
				for(var j = 0; j < i; j++) if(move_list[|j][0] == prox_x) and (move_list[|j][1] == prox_y) unico = false;
				var noIntervalo = id_Aliado.movimento >= ds_list_size(move_list);
			}
			if(linear && unico && noIntervalo) ds_list_add(move_list, [prox_x, prox_y]);
			else
			{
				ds_list_destroy(move_list);
				move_list = scr_create_moveList(id_Aliado.cord_x, id_Aliado.cord_y, prox_x, prox_y);
			}
		}
		
		if(ds_list_find_index(move_list, "FIM") == -1) ds_list_add(move_list, "FIM");
		#endregion
		
		switch2 = false;
	}
	#endregion
	
	#region HORIZONTAL
	{	//VARIÁVEIS
	var _velh = sign(velh);
	velh_buffer = _velh;
	if (cord_x + _velh == -1) or (cord_x + _velh >= global.larg_tela) velh = 0;
	var xx = cord_x * TAM_TILE;
	}
	repeat(abs(velh))
	{
		if (abs(xx - x) == TAM_TILE)
		{
			cord_x += _velh;
			velh = 0;
			//show_debug_message("Cursor (" + string(cord_x) + "," + string(cord_y) + ")");
			break;
		}
		
		x += _velh;
	}
	#endregion
	
	#region VERTICAL
	{	//VARIÁVEIS
	var _velv = sign(velv);
	velv_buffer = _velv;
	if (cord_y + _velv == -1) or (cord_y + _velv >= global.alt_tela) velv = 0; //Limitador
	var yy = cord_y * TAM_TILE;
	}
	repeat(abs(velv))
	{
		if (abs(yy - y) == TAM_TILE)
		{
			cord_y += _velv;
			velv = 0;
			//show_debug_message("Cursor (" + string(cord_x) + "," + string(cord_y) + ")");
			break;
		}
		
		y += _velv;
	}
	#endregion
	delay_move = 4;
}
if(velh == 0) and (velv == 0) switch1 = false;
else if(delay_move == 0) switch1 = true;
else delay_move--;
#endregion

#region APARENCIA
if(image_index >= image_number -1) image_index = 0;

var isEnti = position_meeting(x,y, obj_EntidadePai)
if(isEnti) and (!switch1) image_index = image_number -1;
#endregion



#region COMPORTAMENTOS
if(keyboard_check_pressed(vk_enter)) and (!switch1)
{
	#region COMP. PADRÃO
	if(!isAliado_Movendo) and (!isAliado_Atacando)
	{
		var Objeto = instance_position(x,y, obj_EntidadePai);
		if(Objeto != noone)	//Se existir uma Unidade
		{
			//show_debug_message("Unidade: (" + string(Objeto.cord_x) + "," + string(Objeto.cord_y) + ")");
		}
		else				//Se não tiver, pega o Tile
		{
			Objeto = instance_position(x,y, obj_Tile);
			//show_debug_message("Tile: (" + string(Objeto.cord_x) + "," + string(Objeto.cord_y) + ")");
		}
	
		if(!Objeto.isSelec) global.id_Controle_Mapa.Selecionado_buffer = Objeto;
		//else global.id_Controle_Mapa.Selecionado = noone;
		Objeto.isSelec = !Objeto.isSelec;
	}
	#endregion
	
	
	#region MOVENDO ALIADO
	if(isAliado_Movendo) //and (!isAliado_Atacando)
	{
		var _Tile = instance_place(x,y, obj_Tile);
		if(id_Aliado.cord_x != cord_x || id_Aliado.cord_y != cord_y) and (_Tile.estado == "movimento")
		{
			with(id_Aliado)
			{
				move_list = other.move_list;
				//move_list = scr_create_moveList(cord_x, cord_y, other.cord_x, other.cord_y);
				isMovendo = true;
			}
		}
		else
		{
			id_Aliado.isSelec = false;
			id_Aliado.isMovendo = false;
			id_Aliado = noone;
			if(ds_exists(move_list, ds_type_list)) ds_list_destroy(move_list);
		}
		isAliado_Movendo = false;
	}
	#endregion
	
	
	#region ATACANDO COM ALIADO
	//apenas se move pelos Tiles vermelhs onde há inimigos
	//se selecionar um Tile, faz a Unidade atacar o inimigo correspondente
	#endregion
}
#endregion
