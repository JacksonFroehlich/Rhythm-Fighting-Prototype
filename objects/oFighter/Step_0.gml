/// @description Insert description here
// You can write your code in this editor

y_vel += grav
mask_index = Sprite1
if(rival == 0){ rival = instance_find(oFighter, 1)}
if(x > rival.x){
	dir = -1
}
else{
	dir = 1
}
image_xscale = dir
//show_debug_message(string(player_id) + "  " + string(y_vel))
var _input = rollback_get_input();
hDir = _input.right - _input.left
vDir = _input.up - _input.down
if(_input.down && grounded){
	crouch = true	
}
else{
	crouch = false
}
if(light_buffer > 0){
	light_buffer--;	
}
if(medium_buffer > 0){
	medium_buffer--;	
}
if(heavy_buffer > 0){
	heavy_buffer--;	
}
if(beat_buffer > 0){
	beat_buffer--;	
}
if(_input.light_pressed){
	light_buffer = buffer	
}
if(_input.medium_pressed){
	medium_buffer = buffer	
}
if(_input.heavy_pressed){
	heavy_buffer = buffer	
}
if(_input.beat_pressed){
	beat_buffer = buffer	
}
if(player_state!=_states.hitstun && player_state != _states.blocking){ 
if(medium_buffer >0 && heavy_buffer > 0 && player_state != _states.grab){

	anim_frame = 1
	if(hDir == -1*dir){
		attack = 7
	}
	else{
		attack = 8	
	}
	player_state = _states.grab
	if(player_id == 0){
		show_debug_message("enter the grab zone")
	}
}
if(light_buffer > 0 && attack < 1 && grounded && !crouch){
	anim_frame = 1;
	attack = 1
	player_state = _states.attack
}
else if(light_buffer > 0  && attack < 1 && grounded && crouch){
	anim_frame = 1
	attack = 1.5
	player_state = _states.attack
}
else if(light_buffer > 0  && attack < 1 && !grounded){
	anim_frame = 1
	attack = 1.75
	player_state = _states.attack
}
else if(medium_buffer > 0  && attack < 2 && grounded && !crouch){
	anim_frame = 1
	attack = 2
	player_state = _states.attack
}
else if(medium_buffer > 0 && attack < 2 && grounded && crouch){
	anim_frame = 1
	attack = 2.5
	player_state = _states.attack
}
else if(medium_buffer > 0 && attack < 2 && !grounded){
	anim_frame = 1
	attack = 2.75
	player_state = _states.attack
}
else if(heavy_buffer > 0 && attack < 3 && grounded && !crouch){
	anim_frame = 1
	attack = 3
	player_state = _states.attack
}
else if(heavy_buffer > 0 && attack < 3 && grounded && crouch){
	anim_frame = 1
	attack = 3.5
	player_state = _states.attack
}
else if(heavy_buffer > 0 && attack < 3 && !grounded){
	anim_frame = 1
	attack = 3.75
	player_state = _states.attack
}
}
if(player_state != _states.idle && grounded ){
if(abs(x_vel) > 0){
			x_vel -= sign(x_vel)	
		}
		if(abs(x_vel) <=1){
			x_vel = 0
		}	
}
switch(player_state){
	case _states.idle:{
		attack = 0
		if(crouch){
			sprite_index = anims[7]
			anim_frame = (anim_frame + 1) % sprite_get_number(anims[0])
			image_index = anim_frame
		}
		else if(hDir == 0){
			sprite_index = anims[0]
			anim_frame = (anim_frame + 1) % sprite_get_number(anims[0])
			image_index = anim_frame
		}
		else if(hDir == dir){
			sprite_index = anims[1]
			anim_frame = (anim_frame + 1) % sprite_get_number(anims[0])
			image_index = anim_frame
		}
		else{
			sprite_index = anims[2]
			anim_frame = (anim_frame + 1) % sprite_get_number(anims[0])
			image_index = anim_frame
		}
		if(grounded && !crouch){
			x_vel = 4*hDir
		}
		else if(grounded && crouch){
			x_vel = 0

		}
	} break;
	case _states.loading:{
		
	} break;
	case _states.attack: {
		
		if(attack == 1){
			la_creatura_stand_light_data()
		}
		else if(attack == 1.5){
			la_creatura_crouch_light_data()	
		}
		else if(attack = 1.75){
			la_creatura_jump_light_data()	
		}
		else if(attack == 2){
			la_creatura_stand_medium_data()	
		}
		else if(attack == 2.5){
			la_creatura_crouch_medium_data()	
		}
		else if(attack = 2.75){
			la_creatura_jump_medium_data()	
		}
		else if(attack == 3){
			la_creatura_stand_heavy_data()	
		}
		else if(attack == 3.5){
			la_creatura_crouch_heavy_data()	
		}
		else if(attack == 3.75){
			la_creatura_jump_heavy_data()	
		}
		else{
			attack = 0
			player_state = _states.idle	
		}
		anim_frame++;
		
		
	} break;
	case _states.grab:{
		var active_frame = 14
		if(rival.player_state == _states.grab && anim_frame < active_frame && rival.anim_frame < active_frame && abs(x - rival.x) < 100) {
			rival.player_state = _states.hitstun
			player_state = _states.hitstun
			sprite_image = la_creatura_stagger
			rival.sprite_image = la_creatura_stagger
			rival.stun = 30
			stun = 30
			rival.attack = 0
			rival.anim_frame = 0
			anim_anim_frame = 0
			attack = 0
			
			show_debug_message("we traded grabs")
		}
		if(player_id > 0){
			//show_debug_message("grab time" + string(anim_frame))
		}
		la_creatura_stand_grab_data()
		anim_frame++
	} break;
	case _states.blocking: {
		sprite_image = la_creatura_blocking
		if(stun <=0){
			stun = 0
			player_state = _states.idle	
		}
		stun--;
	} break;
	case _states.hitstun: {
		image_index = (anim_frame-1) % sprite_get_info(la_creatura_stagger).num_subimages
		sprite_image = la_creatura_stagger
		sprite_index = sprite_image
		if(stun <=0){
			stun = 0
			player_state = _states.idle	
		}
		anim_frame++
		stun--;
	}
	default: {
		
	} ;
		
}

if(grounded && vDir > 0 && player_state == _states.idle){
	//show_debug_message("jump")
	grounded = false
	y_vel = jump_height
}



if(place_meeting(x,y + y_vel, oWall) || place_meeting(x,y+sign(y_vel), oWall)){
	while(!place_meeting(x,y, oWall)){
	y+=1	
	}
	y-=1
	y_vel = 0
	grounded = true
}
else{
	y+=y_vel
	grounded = false	
}

if(place_meeting(x+x_vel,y, oWall)){
	while(!place_meeting(x+sign(x_vel),y,oWall)){
		x+=sign(x_vel)	
	}
}
else{
	x+=x_vel	
}

if(place_meeting(x,y,oHitbox)){	
	with(instance_place(x,y,oHitbox)){
		//show_debug_message("flourish " + string(player) + " " + string(other.player_id))
		if(player != other.player_id){
		var block = true
		if(attack_type == _attack_type.low){
			if(other.crouch != true){
				block = false	
			}
		}
		else if(attack_type == _attack_type.high){
			if(other.crouch == true){
				block = false	
			}
		}
		if((other.hDir * -1 == other.dir && other.hDir != 0 && other.player_state == _states.idle && block) || other.player_state == _states.blocking && block){
			other.player_state = _states.blocking	
			other.stun = blockstun
			if(other.crouch){
				other.sprite_index = la_creatura_crouch_blocking
			}
			else{
				other.sprite_index = la_creatura_blocking
			}
		}
		else{
			other.sprite_index = la_creatura_stagger
			other.player_state = state
			other.stun = hitstun
			other.hp -= damage
			other.x_vel = x_force
			other.y_vel = y_force
			}
		}
	}
}
