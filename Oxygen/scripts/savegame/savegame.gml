function savegame(){
	if (file_exists("Save.sav")) {
		file_delete("Save.sav");
	}
	
	ini_open("Save.sav");
	ini_write_real("Progress", "room", real(global.checkpoint_room));
	ini_write_real("Progress", "x", global.checkpoint_x);
	ini_write_real("Progress", "y", global.checkpoint_y);
	ini_write_real("Difficulty", "invin_hazards", global.invin_hazards);
	ini_write_real("Difficulty", "invin_enemies", global.invin_enemies);
	ini_write_real("Difficulty", "infinite_jumps", global.infinite_jumps);
	ini_close();
}