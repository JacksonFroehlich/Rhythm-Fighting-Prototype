/// @description Insert description here
// You can write your code in this editor

if(p1 == 0 && p2 == 0 && instance_exists(oFighter)){
	p1 = instance_find(oFighter,0)
	p2 = instance_find(oFighter,1)
}
if(p1.hp <= 0){
	if(p2_round == 1){
		//do the win stuff here	
	}
	else{
		p1.hp = 100
		p2_round = 1
	}
}
if(p2.hp <= 0){
	if(p1_round == 1){
		//do the win stuff here	
	}
	else{
		p2.hp = 100
		p1_round = 1
	}
}

