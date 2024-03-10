/// @description 
function death(){
	screenshake(12, 60);
	instance_destroy();
	instance_create_layer(x, y, "Player", oExplosion);
	fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
}