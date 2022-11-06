if(keyboard_check_pressed(vk_end)) game_restart();
if(keyboard_check_pressed(vk_control)) show_message(string(global.larg_tela)+","+string(global.alt_tela))

#region CONTROLE E SELEÇÃO
if(Selecionado_buffer != noone)
{
	if(Selecionado) Selecionado.isSelec = false;
	Selecionado = Selecionado_buffer;
	Selecionado_buffer = noone;
}
if(Selecionado != noone && Selecionado.isSelec == false) Selecionado = noone;
#endregion
