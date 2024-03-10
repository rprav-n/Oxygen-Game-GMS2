/// @description 
function death(){
	instance_destroy();
	if (!audio_is_playing(sndDeath)) {
		audio_play_sound(sndDeath, 1, false);
	}
	
	screenshake(12, 60);
	instance_destroy();
	instance_create_layer(x, y, "Player", oExplosion);
	
	if (!file_exists("Save.sav")) {
		fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
	} else {
		loadgame();
		fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
	}
	
	
	
}