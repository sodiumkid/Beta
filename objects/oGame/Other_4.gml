/// @description Insert description here
// You can write your code in this editor
if (room = rPlay) {
	oPlayer.hp = 500;
	oPlayer.x = room_width/2;
	oPlayer.y = room_height/2;
	level = 4;
	audio_stop_all();
	audio_play_sound(sdMusic, 10, true);
	with (oEnemy) {
		instance_destroy();
	}
	with (oEnemyT) {
		instance_destroy();
	}
	with (oPoop) {
		instance_destroy();
	}
	alarm[11] = room_speed*30;
}