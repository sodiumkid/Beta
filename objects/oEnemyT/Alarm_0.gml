/// @description Insert description here
// You can write your code in this editor
sprite_index = sEnemyThrow;
with(instance_create_layer(x, y, "poop", oPoop)) {
	facingDirection = -other.facingDirection;
}

alarm[0] = room_speed*3;