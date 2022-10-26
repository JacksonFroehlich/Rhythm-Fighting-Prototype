// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function la_creatura_crouch_light_data(){

		var last_frame = 11
		image_index = (anim_frame-1) % last_frame

	switch(anim_frame){
	case 1:{
		mask_index = Sprite1
		sprite_index = la_creatura_crouch_light
		image_speed = 0
	} break;
	case 2:{

	} break;
	case 3:{

	} break;
	case 4:{
		


	} break;
	case 5:{
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
		hb.attack_type = _attack_type.low

	} break;
	case 6:{
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
		hb.hitstun = 18
		hb.blockstun = 22
		hb.attack_type = _attack_type.low
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
		sprite_index = la_creatura_crouch_idle
	} break;
	case 12:{

	} break;
	case 13:{

	} break;
	case 14:{

	} break;
	case 15:{

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

	} break;
	default:{
		
		player_state = _states.idle
		attack = 0
	}
	}

}