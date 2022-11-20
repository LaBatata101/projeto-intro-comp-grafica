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
