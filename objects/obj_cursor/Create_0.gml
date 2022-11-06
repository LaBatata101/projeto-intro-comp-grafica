#region VARIÁVEIS
tipo = "Cursor";

//COMPORTAMENTOS
id_Aliado = noone;
isAliado_Movendo = false;		// Comportamento diferenciado caso um aliado esteja se movendo
isAliado_Atacando = false;		// Comportamento diferenciado caso um aliado esteja atacando

//MOVIMENTAÇÃO
switch1 = false;	//Alterna entre esperar comando de movimento e movimentendo
switch2 = true;		//Garante que a lista de movimento seja alterada uma vez por passo
veloc = 4;			//Velocidade de movimento

delay_move = 4;		//Delay em frames para checar o movimento
velh = 0;			//Velocidade horizontal
velh_buffer = 0;	//Guarda velh anterior
velv = 0;			//Velocidade vertical
velv_buffer = 0;	//Guarda velv anterior

//CONTROLE DA UNIDADE
move_list = 0;
#endregion


//MÉTODOS

//OBS: ORGANIZAR O CÓDIGO PARA QUE NÃO PRECISA MAIS DESSES MÉTODOS
/*
#region CODIFICA LISTA DE MOVIMENTO
code_list = function(lista_normal, cord_x, cord_y, deleta_lista)
{
	{	//INICIALIZAÇÃO
		lista_codificada = ds_list_create();
		ds_list_clear(lista_codificada);
		var cord_xy = cord_x + cord_y/100;
		ds_list_add(lista_codificada, cord_xy);
	}
		
	#region CODIFICADOR
	for(var i = 1; i < ds_list_size(lista_normal); i++)
	{
		if(lista_normal[|i] == "FIM") ds_list_add(lista_codificada, "FIM");
		else
		{
			switch(lista_normal[|i])
			{
				case "CIMA":
					cord_xy -= .01;
				break;
				case "BAIXO":
					cord_xy += .01;
				break;
				case "ESQUERDA":
					cord_xy -= 1;
				break;
				case "DIREITA":
					cord_xy += 1;
				break;
				default:
					show_message("Nenhum item correspondente. codificando lista");
				break;
			}
			ds_list_add(lista_codificada, cord_xy);
		}
	}
	#endregion
	
	if(deleta_lista == true) ds_list_destroy(lista_normal);
	return lista_codificada;
}
#endregion

#region DECODIFICA LISTA DE MOVIMENTO
decode_list = function(lista_codificada, deleta_lista)
{
	{	//INICIALIZAÇÃO
		lista_normal = ds_list_create();
		ds_list_clear(lista_normal);
		ds_list_add(lista_normal, "INICIO");
	}
	
	#region CONVERTE LISTA
	for(var i = 1; i < ds_list_size(lista_codificada); i++)
	{
		if(lista_codificada[|i] == "FIM") ds_list_add(lista_normal, "FIM");
		else
		{
			var diferenca = lista_codificada[|i-1] - lista_codificada[|i];
			switch(diferenca)
			{
				case .01:
					ds_list_add(lista_normal, "CIMA");
				break;
				case -.01:
					ds_list_add(lista_normal, "BAIXO");
				break;
				case 1:
					ds_list_add(lista_normal, "ESQUERDA");
				break;
				case -1:
					ds_list_add(lista_normal, "DIREITA");
				break;
				default:
					show_message("Nenhum item correspondente. codificando lista");
				break;
			}
		}
	}
	#endregion
	
	if(deleta_lista == true) ds_list_destroy(lista_codificada);
	return lista_normal;
}
#endregion
