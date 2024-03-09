function roomcode(){
	if (!instance_exists(oPlayer)) {
		instance_create_layer(global.checkpoint_x, global.checkpoint_y, "Player", oPlayer);
	}
}