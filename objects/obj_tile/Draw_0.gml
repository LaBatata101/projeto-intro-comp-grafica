draw_self(); //serve para desenhar a si mesmo

#region ALCANCE E APARENCIA
if(estado != "nenhum") switch(estado)
{
	case "movimento":
	{
		draw_sprite(spr_selecao_movimento, 0, x,y);
		break
	}
	case "ataque":
	{
		draw_sprite(spr_selecao_ataque, 0, x,y);
		break
	}
	case "suporte":
	{
		draw_sprite(spr_selecao_suporte, 0, x,y);
		break
	}
	default:
	{
		estado = "nenhum"
		break
	}
}
#endregion
