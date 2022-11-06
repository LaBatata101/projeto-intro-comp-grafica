#region DESENHA A TRILHA
if(ds_exists(move_list, ds_type_list))
{
	for(var i = 0; i < ds_list_size(move_list); i++)
	{
		//draw_text(room_width/100*82, i*15 + 5, string(move_list[|i]));
		if(move_list[|i] != "FIM")
		{
			{	//OLHA PROXIMO E ANTERIOR	}
				var anterior = [0, 0];
				var proximo = [0, 0];
				if(i != 0)
				{
					anterior = [move_list[|i-1][0] - move_list[|i][0], move_list[|i-1][1] - move_list[|i][1]];
					//show_message("anterior: "+ string(move_list[|i-1][0]+1) +" - "+ string(move_list[|i][0]+1) +","+ string(move_list[|i-1][1]+1) +" - "+ string(move_list[|i][1]+1));
				}
				if(move_list[|i+1] != "FIM")
				{
					proximo = [(move_list[|i+1][0]+1) - (move_list[|i][0]+1), (move_list[|i+1][1]+1) - (move_list[|i][1]+1)];
					//show_message("proximo: "+ string(move_list[|i+1][0]+1) +" - "+ string(move_list[|i][0]+1) +","+ string( move_list[|i+1][1]+1) +" - "+ string(move_list[|i][1]+1));
				}
			}
			
			{	//VARIÁVEIS	}
				var cima = (anterior[1] == -1) or (proximo[1] == -1);
				var baixo = (anterior[1] == 1) or (proximo[1] == 1);
				var esquerda = (anterior[0] == -1) or (proximo[0] == -1);
				var direita = (anterior[0] == 1) or (proximo[0] == 1);
				var indice = (cima * 1) + (direita * 2) + (baixo * 4) + (esquerda * 8);
				//show_message("i: " + string(i) + " " + string(move_list[|i-1]) + string(move_list[|i]) + string(move_list[|i+1]) + "\n cima: "+ string(cima) + " | baixo: "+ string(baixo) + " | esquerda: "+ string(esquerda) + " | direita: "+ string(direita) + "\n anterior: " + string(anterior) + " | proximo: " + string(proximo));
				var xx = move_list[|i][0] * TAM_TILE;
				var yy = move_list[|i][1] * TAM_TILE;
			}
			draw_sprite(spr_trilha, indice, xx, yy);
		}//*/
	}
}
#endregion

draw_self();
