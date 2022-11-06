#region VARIÁVEIS PRINCIPAIS
///CONTROLE
isAliado = true;
//isUnico = false;
isSelec = false;
tipo = "EntidadePai";
switch1 = true;

///LOCALIZAÇÃO
cord_x = -1;
cord_y = -1;

///AÇÕES
isMovendo = false;
//isAtacando = false;

///MOVIMENTAÇÃO
contador1 = 1;	//Conta os itens da lista de movimento
veloc = 3;		//rapido 5 | normal 3 | lento 1
#endregion

#region VARIÁVEIS SECUNDÁRIAS
///STATUS BASE
movimento = 3;
alcance = [1, 1];
#endregion



//MÉTODOS

#region DECODIFICA LISTA DE MOVIMENTO
/*
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
//*/
#endregion
