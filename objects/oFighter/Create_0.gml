/// @description Insert description here
// You can write your code in this editor
anims = [la_creatura_idle, la_creatura_forward_walk, la_creatura_back_walk, "la_creatura_jump", la_creatura_hitstun, la_creatura_stagger, "la_creatura_grab", la_creatura_crouch_idle, la_creatura_stand_light]
mask_index = Sprite1
enum _states {
	blocking,
	hitstun,
	attack,
	idle,
	knockdown,
	invincible,
	stagger,
	grab, 
	loading
}
enum _attack_type {
	high,
	low,
	mid
}
//to do tomorrow
//make a map structure to make knowing when hitboxes are out easier / maybe ignoring the system entirely
//think about + work on tomorrow.
player_state = _states.idle
crouch = false
jump_height = -13
grounded = false
anim_frame = 0
attack = 0
rival = 0
dir = 0
hp = 100
y_vel = 0
x_vel = 0
grav = 1
stun = 0
if(player_id == 0){
	image_blend = c_blue	
	x = 80
	y = 140
	dir = 1
}
else{
	rival = instance_find(oFighter, 0)
	image_blend = c_fuchsia
	x = 240
	y = 140
	dir = -1
}
light_buffer = 0
medium_buffer = 0
heavy_buffer = 0
beat_buffer = 0
buffer = 4