/// @description Insert description here
// You can write your code in this editor
if(global.dealed&&!global.clicked){
	var index=ds_list_find_index(global.cardList,id);
	if(timeCounter>room_speed*1.5&&!clicked){
		if(index==20-global.dealRound*6||index==19-global.dealRound*6||index==18-global.dealRound*6){
			up=true;
			down=false;
		}
	}
	else if(clicked){
		up=false;
		down=false;
	}
}
