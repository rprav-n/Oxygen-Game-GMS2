/// @description screenshake(magnitude, frames)
function screenshake(_magnitude, _frames){
	if (instance_exists(oCamera)) {
		with (oCamera) {
			if (_magnitude > shake_remain) {
				shake_magnitude = _magnitude;
				shake_remain = _magnitude;
				shake_length = _frames;
			}
		}
	}
}