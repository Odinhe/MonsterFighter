/// @description Insert description here
// You can write your code in this editor

//initial shuffle
if(global.generateNO){
	global.newOrder=floor(random(6));
	global.generateNO=false;
}
//show_debug_message(global.newOrder);

if(!shuffled){
	ds_list_shuffle(global.cardList);
	for(var i=0;i<ds_list_size(global.cardList);i++){
		var inst_card=global.cardList[|i];
		inst_card.y=room_height/2-i*3;
		inst_card.depth=-i;
	}
	shuffled=true;
}

//deal the top 6 cards in the left pile
if(global.dealRound<4){
	endshuffled=false;
	shufflingSndPlayed=false;
	if(shuffled&&!played){
		var cardChoice=round(random_range(21-global.dealRound*6,23-global.dealRound*6));
		for(var i=ds_list_size(global.cardList)-1-global.dealRound*6;i>17-global.dealRound*6;i--){
			var inst_card=global.cardList[|i];
			if(i==23-global.dealRound*6){
				inst_card.targetX=room_width/2-100;
				inst_card.targetY=100;
				if(cardChoice==23-global.dealRound*6){
					inst_card.upChoiceX=room_width/2;
					inst_card.upChoiceY=room_height/2-50;
				}
			}
			else if(i==22-global.dealRound*6){
				inst_card.targetX=room_width/2;
				inst_card.targetY=100;
				if(cardChoice==22-global.dealRound*6){
					inst_card.upChoiceX=room_width/2;
					inst_card.upChoiceY=room_height/2-50;
				}
			}
			else if(i==21-global.dealRound*6){
				inst_card.targetX=room_width/2+100;
				inst_card.targetY=100;
				if(cardChoice==21-global.dealRound*6){
					inst_card.upChoiceX=room_width/2;
					inst_card.upChoiceY=room_height/2-50;
				}
			}
			else if(i==20-global.dealRound*6){
				inst_card.targetX=room_width/2-100;
				inst_card.targetY=room_height-100;
			}
			else if (i==19-global.dealRound*6){
				inst_card.targetX=room_width/2;
				inst_card.targetY=room_height-100;
			}
			else if (i==18-global.dealRound*6){
				inst_card.targetX=room_width/2+100;
				inst_card.targetY=room_height-100;
			}
		}
		played=true;
	}

	//a round over
	if(global.clicked&&floor(global.clickedCard.y)==room_height/2+50){
		for(var i=ds_list_size(global.cardList)-1-global.dealRound*6;i>17-global.dealRound*6;i--){
			var inst_card=global.cardList[|i];
			inst_card.discard=true;
		}
	}
}
else{
	for(var i=0;i<ds_list_size(global.cardList);i++){
		var inst_card=global.cardList[|i];
		inst_card.reset=true;
		if(!shufflingSndPlayed){
			audio_play_sound(snd_shufflingCard,0,false);
			shufflingSndPlayed=true;
		}
	}
	if(global.reset){
		if(!endshuffled){
			ds_list_shuffle(global.cardList);
			endshuffled=true;
		}
		for(var i=0;i<ds_list_size(global.cardList);i++){
			var inst_card=global.cardList[|i];
			inst_card.shuffling=true;
		}
		global.reset=false;
	}
}

