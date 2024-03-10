/// @function fadeout(targetroom);
/// @param _targetroom 
/// @param _targe_x
/// @param _targe_y
function fadeout(_targetroom, _target_x, _target_y){
	if (_target_x > 0 && _target_y > 0) {
		global.checkpoint_x = _target_x;
		global.checkpoint_y = _target_y;
		global.checkpoint_room = _targetroom;
	}
	
	if (!instance_exists(oFade)) {
		var _fade = instance_create_layer(0, 0, "Player", oFade);
		with (_fade) {
			fade_out = true;
			a = 0;
			target_room = _targetroom;
		}
	}
}