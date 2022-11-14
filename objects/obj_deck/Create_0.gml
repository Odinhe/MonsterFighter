/// @description Insert description here
// You can write your code in this editor
randomize();
played=false;
shuffled=false;
endshuffled=false;
global.dealRound=0;
playerScore=0;
computerScore=0;
shufflingSndPlayed=false;

global.newOrder=0;
global.generateNO=false;

//Generate the initial card pile
global.cardList=ds_list_create();
for(var i=0;i<24;i++){
	var inst_card=instance_create_layer(100,room_height/2-i*3,"Instances",obj_card);
	inst_card.depth=-i;
	if(i>=0&&i<=7){
		inst_card.suite="heal";
	}
	if(i>=8&&i<=15){
		inst_card.suite="attack";
	}
	if(i>15){
		inst_card.suite="defense";
	}
	ds_list_add(global.cardList,inst_card);
}
