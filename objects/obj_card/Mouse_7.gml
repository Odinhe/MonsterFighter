/// @description Insert description here
// You can write your code in this editor
var index=ds_list_find_index(global.cardList,id);
if(timeCounter>room_speed*1.5&&!clicked&&!global.clicked&&!discard){
	if(index==20-global.dealRound*6||index==19-global.dealRound*6||index==18-global.dealRound*6){
		clicked=true;
	}
}
