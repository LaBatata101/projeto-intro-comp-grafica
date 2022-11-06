draw_self(); //serve para desenhar a si mesmo

#region ALCANCE E APARENCIA
if(estado != "nenhum") switch(estado)
{
	case "movimento":
	{
		//DEIXAR O TILE TRANSPARENTE
		
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
	case "ataque":
	{
		draw_sprite(spr_selecao_ataque, 0, x,y);
		break;
	}
	case "suporte":
	{
		draw_sprite(spr_selecao_suporte, 0, x,y);
		break;
	}
	default:
	{
		estado = "nenhum"
		break;
	}
}
#endregion

//draw_text(x,y, string(cord_x)+","+string(cord_y))
