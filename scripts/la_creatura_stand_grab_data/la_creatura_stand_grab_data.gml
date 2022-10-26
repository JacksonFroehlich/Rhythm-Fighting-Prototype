// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function la_creatura_stand_grab_data(){
		var last_frame = 22
		image_index = (anim_frame-1) % last_frame

	switch(anim_frame){
	case 1:{
		mask_index = Sprite1
		sprite_index = la_creatura_grab
		image_speed = 0
	} break;
	case 2:{

	} break;
	case 3:{

	} break;
	case 4:{

	} break;
	case 5:{
		
	} break;
	case 6:{

	} break;
	case 7:{
		
	} break;
	case 8:{
		
	} break;
	case 9:{

	} break;
	case 10:{
		
	} break;
	case 11:{

	} break;
	case 12:{

	} break;
	case 13:{

	} break;
	case 14:{
		var hb = instance_create_layer(x,y, "instances", oHitbox)
		hb.player = player_id
		hb.damage = 2
		hb.x_force = 2 * dir
		hb.y_force = 3
		hb.x_offset = 10 * dir
		hb.y_offset = -15
		hb.x = x + hb.x_offset
		hb.y = y + hb.y_offset
		hb.image_xscale = 30 * dir
		hb.image_yscale = 15
		hb.state = _states.hitstun
		hb.blockable = false
		hb.hitstun = 18
		hb.blockstun = 22
		hb.attack_type = _attack_type.mid
	} break;
	case 15:{
		var hb = instance_create_layer(x,y, "instances", oHitbox)
		hb.player = player_id
		hb.damage = 2
		hb.x_force = 2 * dir
		hb.y_force = 3
		hb.x_offset = 10 * dir
		hb.y_offset = -15
		hb.target = self
		hb.x = x + hb.x_offset
		hb.y = y + hb.y_offset
		hb.image_xscale = 30 * dir
		hb.image_yscale = 15
		hb.state = _states.hitstun
		hb.hitstun = 18
		hb.blockstun = 22
		hb.attack_type = _attack_type.mid
		hb.blockable = false
	} break;
	case 16:{

	} break;
	case 17:{

	} break;
	case 18:{

	} break;
	case 19:{

	} break;
	case 20:{
		sprite_index = la_creatura_idle
	} break;
	case 21:{
		
	} break;
	case 22:{
		
	} break;
	case 23:{
		
	} break;
	case 24:{
		
	} break;
	case 25:{
		
	} break;
	case 26:{
		
	} break;
	case 27:{
		
	} break;
	case 28:{
		
	} break;
	case 29:{
		
	} break;
	case 30:{
		
	} break;
	default:{
		
		player_state = _states.idle
		attack = 0
	}
	}
}