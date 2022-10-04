randomize();

#region VARIÁVEIS
//seleção
Selecionado = noone;
Selecionado_buffer = noone;
//switch_1 = false;

//room
global.alt_tela = round(room_height) div TAM_TILE; 
global.larg_tela = round(room_width) div TAM_TILE;

//extra
global.id_Controle_Mapa = id;
#endregion

#region ALTERAR TAMANHO DO MAPA

//código que altera tamanho do mapa, não necessário agora
//Nota: tamanho horizontal e vertical da sala deve ser multiplo do tamanho do Tile (pra não haver sobre de espaço)
//Nota: tamanho da janela deve ser multiplo do tamanho da câmera (Pra não distorcer a imagem)

#endregion



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

#region POSICIONAR ALIADOS //Test apenas com um
Aliado = instance_create_layer(48,48, "Unidades", obj_EntidadePai);
with(Aliado)
{
	cord_x = 1;
	cord_y = 1;
}
#endregion

//Criando cursor
instance_create_layer(0,0, "Cursor", obj_Cursor,
{
	cord_x : 0,
	cord_y : 0
});



apaga_Tile = function()
{
	for (var i = 0; i < global.larg_tela; i++)
	{
		for (var j = 0; j < global.alt_tela; j++)
		{
			with(Casa[i][j]) estado = "nenhum";
		}
	}
}