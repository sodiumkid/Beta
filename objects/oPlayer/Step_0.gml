/// @description Insert description here
// You can write your code in this editor

if (y > room_height) {
	room = rDeath;
}

for (var i = 0; i < 2; i++) {
	if (device_mouse_check_button(i, mb_left)) { 
		if (place_meeting(device_mouse_x(i), device_mouse_y(i), oRight)) {
			key_right = true;
		}
		else key_right = false;
		if (place_meeting(device_mouse_x(i), device_mouse_y(i), oLeft)) {
			key_left = true;
		}
		else key_left = false;
		if (place_meeting(device_mouse_x(i), device_mouse_y(i), oUp)) {
			key_jump= true;
		}
		else key_jump = false;
		if (place_meeting(device_mouse_x(i), device_mouse_y(i), oPunch)) {
			key_punch= true;
		}
		else key_punch = false;
				
	}
}

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(ord("W"));
key_punch = keyboard_check(ord("P"));


if (key_left) {
	 hsp = -10;
}
if (key_right) {
	 hsp = 10;
}
if (!key_left && !key_right) {
	hsp = 0;
}

vsp++;

if (place_meeting(x,y+vsp,oWall)) {
	while(!place_meeting(x,y+vsp,oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	canJump =true;
}

if (key_jump && canJump) {
	audio_play_sound(sdJump, 11, false);
	vsp = -15;
	canJump = false;
}

if (key_punch) {
	//if (!place_meeting(x, y+ 10, oWall)) {
	with (oEnemy) {
		if (abs(oPlayer.facingDirection) != oPlayer.facingDirection) {
			if (place_meeting(x - 32, y, other)) {
			
				hsp = min(15, floor((101 - hp)/5));
				hp -= 5;
				vsp = -min(15, floor((101 - hp)/5));
				
				if (oPlayer.done == false) {
					instance_create_layer(other.x+ 25, other.y - 15, "Effect",oEffect);
					audio_play_sound(sdPunch, 10, false);
				}
				oPlayer.done = true;
			}
		}
		else {
			if (place_meeting(x + 32, y, other)) {
			
				hsp = -min(15, floor((101 - hp)/5));
				hp -= 5;
				vsp = -min(15, floor((101 - hp)/5));
				if (oPlayer.done == false) {
					instance_create_layer(other.x- 25, other.y - 15, "Effect",oEffect);
					audio_play_sound(sdPunch, 10, false);
				}
				oPlayer.done = true;
			}
		}
	}
	with (oEnemyT) {
		if (abs(oPlayer.facingDirection) != oPlayer.facingDirection) {
			if (place_meeting(x - 32, y, other)) {
			
				hsp = min(15, floor((101 - hp)/5));
				hp -= 5;
				vsp = -min(15, floor((101 - hp)/5));
				if (oPlayer.done == false) {
					instance_create_layer(other.x+ 25, other.y - 15, "Effect",oEffect);
					audio_play_sound(sdPunch, 10, false);
				}
				oPlayer.done = true;
			}
		}
		else {
			if (place_meeting(x + 32, y, other)) {
			
				hsp = -min(15, floor((101 - hp)/5));
				hp -= 5;
				vsp = -min(15, floor((101 - hp)/5));
				if (oPlayer.done == false) {
					instance_create_layer(other.x- 25, other.y - 15, "Effect",oEffect);
					audio_play_sound(sdPunch, 10, false);
				}
				show_debug_message(oPlayer.done)
				oPlayer.done = true;
			}
		}
	}
	//oPlayer.done = false;
	//}
	/*
	else {
		if (!(holdTimer == 0) && holding == false) {
			holdTimer--;
		}
		else {
			if (holding == false) {
				holdTimer = 10;
				holding = true;
				// Set punching sprite
				if (place_meeting(x + 32, y, oEnemy)) {
					oEnemy.hp -= 5;
				}
				else if (place_meeting(x - 32, y, oEnemy)) {
					oEnemy.hp -= 5;
				}
				
			}
			
		}
	}
	*/
}
oPlayer.done = false;
if (place_meeting(x + hsp, y, oEnemy)) {	
	hsp = 0;
}
if (place_meeting(x,y+vsp,oEnemy)) {
	while(!place_meeting(x,y+vsp,oEnemy)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	canJump =true;
}

if (hsp != 0) {
	sprite_index = sPlayerR;
	if (abs(hsp) == hsp) {
		facingDirection = - 3;
	}
	else {
		facingDirection = 3;
	}
}
else {
	sprite_index = sPlayer;
}
if (vsp != 0) {
	sprite_index = sPlayerJ;
} 
if (key_punch) {
	sprite_index = sPlayerPunch;
}


image_xscale = facingDirection;



x += hsp + addX;
y += vsp;
addX = 0;