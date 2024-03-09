/// @description 
function death(){
	if (global.checkpoint_id == noone) {
		room_restart();
	} else {
		room_goto(global.checkpoint_room);
	}
}