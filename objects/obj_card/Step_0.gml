/// @description Insert description here
// You can write your code in this editor
//Dealing the cards
if(!discard){
	if(targetX!=-1&&targetY!=-1){
		shuffling=false;
		var index=ds_list_find_index(global.cardList,id);
		if(index==23-global.dealRound*6&&!dealed){
			x=lerp(x,targetX,0.2);
			y=lerp(y,targetY,0.2);
			if(!dealingSndPlayed){
				audio_play_sound(snd_dealingCard,0,false);
				dealingSndPlayed=true;
			}
		}
		else if(index<23-global.dealRound*6&&!dealed){
			var priorCard=ds_list_find_value(global.cardList,index+1);
			if(ceil(priorCard.x)==priorCard.targetX&&floor(priorCard.y)==priorCard.targetY||ceil(priorCard.x)==priorCard.targetX&&ceil(priorCard.y)==priorCard.targetY){
				x=lerp(x,targetX,0.2);
				y=lerp(y,targetY,0.2);
				if(!dealingSndPlayed){
					audio_play_sound(snd_dealingCard,0,false);
					dealingSndPlayed=true;
				}
				if(index==18-global.dealRound*6&&ceil(x)==targetX&&ceil(y)==targetY){
					global.dealed=true;
				}
			}
		}
		if(ceil(x)==targetX&&floor(y)==targetY||ceil(x)==targetX&&ceil(y)==targetY){
			dealed=true;
		}
		if(upChoiceX!=-1&&upChoiceY!=-1&&global.dealed&&dealed&&pathStarted){
			x=lerp(x,upChoiceX,0.2);
			y=lerp(y,upChoiceY,0.2);
			if(!choosingSndPlayed){
				audio_play_sound(snd_dealingCard,0,false);
				choosingSndPlayed=true;
			}
			isChosen=true;
		}
		if(dealed&&global.dealed){
			timeCounter++;
			if(timeCounter<room_speed*1){
				global.generateNO=true;		
				if(index==20-global.dealRound*6||index==19-global.dealRound*6||index==18-global.dealRound*6){
					if(suite=="paper"){
						sprite_index=spr_paper;
					}
					else if(suite=="scissor"){
						sprite_index=spr_scissor;
					}
					else if(suite=="stone"){
						sprite_index=spr_rock;
					}
					else{
						sprite_index=spr_cardBack;
					}
				}
			}
			
		}
	}
	if(clicked){
		x=lerp(x,room_width/2,0.2);
		y=lerp(y,room_height/2+50,0.2);
		if(!clickingSndPlayed){
			audio_play_sound(snd_dealingCard,0,false);
			clickingSndPlayed=true;
		}
		global.clicked=true;
		global.clickedCard=id;
	}
	else if(up){
		y=lerp(y,room_height-110,0.2);
	}
	else if(down){
		y=lerp(y,room_height-100,0.2);
	}
	if(global.clickedCard!=undefined&&isChosen){
		if(suite=="paper"){
			sprite_index=spr_paper;
		}
		else if(suite=="scissor"){
			sprite_index=spr_scissor;
		}
		else if(suite=="stone"){
			sprite_index=spr_rock;
		}
		if(!global.scoreAdded){
		if(global.clickedCard.suite=="paper"){
			if(suite=="scissor"){
				obj_deck.computerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_lose,0,false);
				}
			}
			else if(suite=="stone"){
				obj_deck.playerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_win,0,false);
				}
			}
			else if(!resultSndPlayed){
				audio_play_sound(snd_draw,0,false);
			}
		}
		else if(global.clickedCard.suite=="scissor"){
			if(suite=="paper"){
				obj_deck.playerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_win,0,false);
				}
			}
			else if(suite=="stone"){
				obj_deck.computerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_lose,0,false);
				}
			}
			else if(!resultSndPlayed){
				audio_play_sound(snd_draw,0,false);
			}
		}
		else if(global.clickedCard.suite=="stone"){
			if(suite=="paper"){
				obj_deck.computerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_lose,0,false);
				}
			}
			else if(suite=="scissor"){
				obj_deck.playerScore++;
				if(!resultSndPlayed){
					audio_play_sound(snd_win,0,false);
				}
			}
			else if(!resultSndPlayed){
				audio_play_sound(snd_draw,0,false);
			}
		}
		global.scoreAdded=true;
		}
	}
}
else if(discard){
	var index=ds_list_find_index(global.cardList,id);
	if(index==23-global.dealRound*6){
		x=lerp(x,room_width-100,0.2);
		y=lerp(y,room_height/2-(23-index)*3,0.2);
		id.depth=index;
		if(!discardingSndPlayed){
			audio_play_sound(snd_dealingCard,0,false);
			discardingSndPlayed=true;
		}
		if(suite=="paper"){
			sprite_index=spr_paper;
		}
		else if(suite=="scissor"){
			sprite_index=spr_scissor;
		}
		else if(suite=="stone"){
			sprite_index=spr_rock;
		}
	}
	else if(index<23-global.dealRound*6){
		var priorCard=ds_list_find_value(global.cardList,index+1);
		if(ceil(priorCard.x)==room_width-100&&floor(priorCard.y)==room_height/2-(23-index-1)*3||ceil(priorCard.x)==room_width-100&&ceil(priorCard.y)==room_height/2-(23-index-1)*3){
			x=lerp(x,room_width-100,0.2);
			y=lerp(y,room_height/2-(23-index)*3,0.2);
			id.depth=index;
			if(!discardingSndPlayed){
				audio_play_sound(snd_dealingCard,0,false);
				discardingSndPlayed=true;
			}
			if(suite=="paper"){
				sprite_index=spr_paper;
			}
			else if(suite=="scissor"){
				sprite_index=spr_scissor;
			}
			else if(suite=="stone"){
				sprite_index=spr_rock;
			}
		}
	}
	if(index==18-global.dealRound*6&&ceil(x)==room_width-100&&floor(y)==room_height/2-(23-index)*3){
		global.dealRound++;
		global.scoreAdded=false;
		obj_deck.played=false;
		global.dealed=false;
		global.clicked=false;
		global.clickedCard=undefined;
	}
}
if(reset){
	var index=ds_list_find_index(global.cardList,id);
	sprite_index=spr_cardBack;
	targetX=-1;
	targetY=-1;
	upChoiceX=-1;
	upChoiceY=-1;
	dealed=false;
	global.dealed=false;
	isChosen=false;
	up=false;
	down=false;
	clicked=false;
	global.clicked=false;
	global.clickedCard=undefined;
	discard=false;
	dealingSndPlayed=false;
	choosingSndPlayed=false;
	clickingSndPlayed=false;
	discardingSndPlayed=false;
	resultSndPlayed=false;
	pathStarted=true;
	timeCounter=0;
	if(index==0){
		x=lerp(x,100,0.15);
	}
	else{
		var priorCard=ds_list_find_value(global.cardList,index-1);
		if(priorCard.x<=room_width-200){
			x=lerp(x,100,0.15);
		}
	}
	if(floor(x)==100){
		if(index==23){
			global.reset=true;
		}
		reset=false;
	}
}
if(shuffling){
	var index=ds_list_find_index(global.cardList,id);
	if(index==0){
		y=lerp(y,room_height/2-index*3,0.05);
	}
	else{
		var priorCard=ds_list_find_value(global.cardList,index-1);
		if(priorCard.x<=room_width-200){
			y=lerp(y,room_height/2-index*3,0.05);
		}
	}
	depth=-index;
	if(floor(y)==room_height/2-index*3||ceil(y)==room_height/2-index*3){
		if(index==23){
			global.newDealRound=true;
		}
		shuffling=false;
	}
}
if(global.newDealRound){
	obj_deck.played=false;
	obj_deck.endshuffled=false;
	global.dealRound=0;
	shuffling=false;
	global.scoreAdded=false;
	global.reset=false;
	global.newDealRound=false;
}
