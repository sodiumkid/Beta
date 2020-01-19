vsp ++;

if (y > room_height) {
	instance_destroy();
}
if (place_meeting(x, y+ vsp, oWall)) {
	vsp = 0;
	// Check player collision
	if (oPlayer.x < x) {
		if (place_meeting(x - 4, y, oPlayer)) {
			oPlayer.vsp -= 1;
			oPlayer.addX = -20;
			oPlayer.hp--;
			hsp = 0;
		}
		else {
			hsp = -4;
		}

	}
	else if (oPlayer.x > x) {
		if (place_meeting(x + 4, y, oPlayer)) {
			oPlayer.vsp -= 1;
			oPlayer.addX = 20;
			oPlayer.hp--;
			hsp = 0;
		}
		else {
			hsp = 4;
		}
	}
	// Check Enemy Collision
	with (oEnemy) {
		if (other.hsp = -4) {
			if (place_meeting(other.x - 4, other.y, self)) {
				other.hsp = 0;
			}
		}
		else if (other.hsp = 4) {
			if (place_meeting(other.x + 4, other.y, self)) {
				other.hsp = 0;
			}
		}
	}
} 

if (place_meeting(x,y+vsp,oPlayer)) {
	while(!place_meeting(x,y+vsp,oPlayer)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

if (hsp != 0) {
	sprite_index = sEnemyR;
	if (abs(hsp) == hsp) {
		facingDirection = - 2;
	}
	else {
		facingDirection = 2;
	}
}
else {
	sprite_index = sEnemy;
}

if (hp == 0) {
	instance_destroy();
}

image_xscale = facingDirection;


y += vsp;
x += hsp;