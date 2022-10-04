if(keyboard_check_pressed(vk_end)) room_restart();

#region CONTROLE E SELEÇÃO
if(Selecionado_buffer != noone)
{
	if(Selecionado) Selecionado.isSelec = false;
	Selecionado = Selecionado_buffer;
	Selecionado_buffer = noone;
}
if(Selecionado != noone) if(Selecionado.isSelec == false)
{
	Selecionado = noone;
}
#endregion
