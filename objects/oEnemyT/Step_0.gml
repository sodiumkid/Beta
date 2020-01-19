vsp ++;

if (y > room_height) {
	instance_destroy();
}

if (place_meeting(x, y+ vsp, oWall)) {
	vsp = 0;
	hsp = 0;
	// Check player collision
	if (oPlayer.x < x) {
		facingDirection = 2;
		
	}
	else if (oPlayer.x > x) {
		facingDirection = - 2;
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

else {
	sprite_index = sEnemyT;
}

if (hp == 0) {
	instance_destroy();
}

image_xscale = facingDirection;


y += vsp;
x += hsp;