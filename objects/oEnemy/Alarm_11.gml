/// @description Insert description here
// You can write your code in this editor




with (instance_create_layer(x, y - 16, "buttons", oSaying)) {
	var phrases = floor(random_range(0,8));
	if (phrases == 0) {
		text = "imagine dying in a video game";
	}
	else if (phrases == 1) {
		text = "true";
	}
	else if (phrases == 2) {
		text = "cool";
	}
	else if (phrases == 3) {
		text = "did i ask";
	}
	else if (phrases == 4) {
		text = "why u talkin";
	}
	else if (phrases == 5) {
		text = "shut up";
	}
	else if (phrases == 6) {
		text = "on jah";
	}
	else if (phrases == 7) {
		text = "howwww";
	}
	else if (phrases == 8) {
		text = "ok and";
	}
}