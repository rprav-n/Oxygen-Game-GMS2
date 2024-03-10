function loadgame(){
	if (file_exists("Save.sav")) {
		ini_open("Save.sav");
		global.checkpoint_room = ini_read_real("Progress", "room", rLevel1);
		global.checkpoint_x = ini_read_real("Progress", "x", 0);
		global.checkpoint_y = ini_read_real("Progress", "y", 0);
		global.invin_hazards = ini_read_real("Difficulty", "invin_hazards ", false);
		global.invin_enemies = ini_read_real("Difficulty", "invin_enemies ", false);
		global.infinite_jumps = ini_read_real("Difficulty", "infinite_jumps ", false);
		ini_close();
	}
}