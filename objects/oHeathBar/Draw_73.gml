/// @description Insert description here
// You can write your code in this editor


draw_self()
var color = c_green
if(instance_exists(oFighter)){
	var tgt = instance_find(oFighter, player)
	if(tgt.hp > 0){
	if(player == 0){
			if(oGame.p2_round == 1){
				color = c_yellow	
			}
	}
	else if(player == 1){
		if(oGame.p1_round == 1){
			color = c_yellow
		}
	}
	draw_rectangle_color(x,y,x+((image_xscale - 1)  * max(0,(tgt.hp / 100)) ), y-(image_yscale +1), color ,color ,color ,color,false)
}
}