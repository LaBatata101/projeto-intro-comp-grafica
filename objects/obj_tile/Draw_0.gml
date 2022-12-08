draw_self();

#region ALCANCE E APARENCIA
if(estado != "nenhum") switch(estado)
{
	#region MOVIMENTO
	case "movimento":
	{
		//olha os Tiles ao redor e escolhe o sprite || AUTOTILE
		if(cord_y != 0) var cima = instance_place(x,y - TAM_TILE, obj_Tile).estado == estado;
		else var cima = 0;
		if(cord_x < global.larg_tela-1) var direita = instance_place(x + TAM_TILE,y, obj_Tile).estado == estado;
		else var direita = 0;
		if(cord_y < global.alt_tela-1) var baixo = instance_place(x,y + TAM_TILE, obj_Tile).estado == estado;
		else var baixo = 0;
		if(cord_x != 0) var esquerda = instance_place(x - TAM_TILE,y, obj_Tile).estado == estado;
		else var esquerda = 0;
		
		var i = cima + direita*2 + baixo*4 + esquerda*8;
		draw_sprite(spr_selecao_movimento, i, x,y);
		break;
	}
	#endregion
	
	#region ATAQUE
	case "ataque":
	{
		//olha os Tiles ao redor e escolhe o sprite || AUTOTILE
		if(cord_y != 0) var cima = instance_place(x,y - TAM_TILE, obj_Tile).estado == estado;
		else var cima = 0;
		if(cord_x < global.larg_tela-1) var direita = instance_place(x + TAM_TILE,y, obj_Tile).estado == estado;
		else var direita = 0;
		if(cord_y < global.alt_tela-1) var baixo = instance_place(x,y + TAM_TILE, obj_Tile).estado == estado;
		else var baixo = 0;
		if(cord_x != 0) var esquerda = instance_place(x - TAM_TILE,y, obj_Tile).estado == estado;
		else var esquerda = 0;
		
		var i = cima + direita*2 + baixo*4 + esquerda*8;
		draw_sprite(spr_selecao_ataque, i, x,y);
		break;
	}
	#endregion
	
	#region SUPORTE (*)
	/*
	case "suporte":
	{
		//olha os Tiles ao redor e escolhe o sprite || AUTOTILE
		if(cord_y != 0) var cima = instance_place(x,y - TAM_TILE, obj_Tile).estado == estado;
		else var cima = 0;
		if(cord_x < global.larg_tela-1) var direita = instance_place(x + TAM_TILE,y, obj_Tile).estado == estado;
		else var direita = 0;
		if(cord_y < global.alt_tela-1) var baixo = instance_place(x,y + TAM_TILE, obj_Tile).estado == estado;
		else var baixo = 0;
		if(cord_x != 0) var esquerda = instance_place(x - TAM_TILE,y, obj_Tile).estado == estado;
		else var esquerda = 0;
		
		var i = 0 //cima + direita*2 + baixo*4 + esquerda*8;
		draw_sprite(spr_selecao_suporte, i, x,y);
		break;
	}
	//*/
	#endregion
	default:
	{
		estado = "nenhum"
		break;
	}
}
#endregion

//draw_text(x+10,y+10, string(distancia))
