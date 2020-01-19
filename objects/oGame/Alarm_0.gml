/// @description Insert description here
// You can write your code in this editor


for (var i = 0; i < level; i++) {
	with (instance_create_layer(floor(random_range(0,room_width)), -30, "Enemy", oEnemy)) {
		image_xscale = 2;
		image_yscale = 2;
	}
}
for (var i = 0; i < level-4; i++) {
	with (instance_create_layer(floor(random_range(0,room_width)), -30, "Enemy", oEnemyT)) {
		image_xscale = 2;
		image_yscale = 2;
	}
}

level++;
alarm[1] = room_speed*10;