script_execute(script_controls());
#region \\Movimento
//Move
xaxis = (key_right - key_left);
yaxis = (key_down - key_up);

//Get Direction
var dir = point_direction(0, 0, xaxis, yaxis);

//Get lenght
if (xaxis == 0) and (yaxis == 0){
	len = 0;
} else{
	len = spd;	
}

//Get speed variables
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);
#endregion


//Colisão
#region Colisão horizontal
if place_meeting(x+hspd, y, obj_parede){
	while !place_meeting(x+hspd, y, obj_parede){
		x += sign(hspd);	
	}
	hspd = 0;
}

//Colisão Horizontal Parede Invisivel
if place_meeting(x+hspd, y, obj_wallinv){
	while !place_meeting(x+hspd, y, obj_wallinv){
		x += sign(hspd);	
	}
	hspd = 0;
}

//Colisão Horizontal Mesa
if place_meeting(x+hspd, y, obj_mesa){
	while !place_meeting(x+hspd, y, obj_mesa){
		x += sign(hspd);	
	}
	hspd = 0;
}
x+=hspd;

//Colisão vertical
if place_meeting(x, y+vspd, obj_parede){
		while !place_meeting(x, y+vspd, obj_parede){
			y += sign(vspd);	
		}
	vspd = 0;
}

//Colisão vertical Parede Invisivel
if place_meeting(x, y+vspd, obj_wallinv){
		while !place_meeting(x, y+vspd, obj_wallinv){
			y += sign(vspd);	
		}
	vspd = 0;
}

//Colisão vertical Mesa
if place_meeting(x, y+vspd, obj_mesa){
		while !place_meeting(x, y+vspd, obj_mesa){
			y += sign(vspd);	
		}
	vspd = 0;
}
y+= vspd;
#endregion

#region Control Sprite
image_speed = sign(len)*2;
if (len ==0) {
	image_index = 0;	
}

//Vertical Sprite
if (vspd >0){
	sprite_index = sprite_KiraWalks_Down;
}else if (vspd <0){
	sprite_index = sprite_KiraWalks_Up;
}

if (hspd > 0){
	sprite_index = sprite_KiraWalks_Right;
}else if (hspd <0){
	sprite_index = sprite_KiraWalks_Left;	
}	
#endregion