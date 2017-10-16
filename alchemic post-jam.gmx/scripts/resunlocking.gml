#define resunlocking
///unlocking researches
if(research[0] = "finished" && research[1] = "finished" && research[2] = "finished")
{
if(research[3] == "locked")
{
research[3] = "unlocked"
}
if(research[4] == "locked")
{
research[4] = "unlocked"
}
}

if(research[3] = "finished" && research[4] = "finished")
{
if(research[5] == "locked")
{
research[5] = "unlocked"
}
if(research[6] == "locked")
{
research[6] = "unlocked"
}
}

if(research[5] = "finished" && research[6] = "finished")
{
if(research[7] == "locked")
{
research[7] = "unlocked"
}
}

if(research[7] = "finished")
{
if(research[8] == "locked")
{
research[8] = "unlocked"
}
}

for(i=0;i<9;i++)
{
if(research[i] = "finished")
{
global.elementresearch[75+i] = 0
}
}

#define resdescription
///research description
if(global.mode = "research")
{

/*
help
0 = earth
1 = air
2 = water
3 = fire
4 = rock
5 = ice
6 = lightning
7 = explosion
*/

if(research[0] == "started")
{
rescode[0] = "20146753"
reqelem[0] = 65
catelem[0] = 59
}


if(research[1] == "started")
{
rescode[1] = "36247051"
reqelem[1] = 32
catelem[1] = 56
}
if(research[2] == "started")
{
rescode[2] = "67145302"
reqelem[2] = 37
catelem[2] = 60
}
/*
if(research[3] == "started")
{
nstep[0] = "water"
nstep[1] = "water"
nstep[2] = "water"
nstep[3] = "fire"
nstep[4] = "fire"
}
if(research[4] == "started")
{
nstep[0] = "fire"
nstep[1] = "mortar"
nstep[2] = "water"
nstep[3] = "spoon"
nstep[4] = "spoon"
}
if(research[5] == "started")
{
nstep[0] = "spoon"
nstep[1] = "mortar"
nstep[2] = "spoon"
nstep[3] = "fire"
nstep[4] = "water"
}
if(research[6] == "started")
{
nstep[0] = "mortar"
nstep[1] = "mortar"
nstep[2] = "fire"
nstep[3] = "spoon"
nstep[4] = "water"
}
if(research[7] == "started")
{
nstep[0] = "spoon"
nstep[1] = "mortar"
nstep[2] = "fire"
nstep[3] = "water"
nstep[4] = "water"
}
if(research[8] == "started")
{
nstep[0] = "fire"
nstep[1] = "water"
nstep[2] = "mortar"
nstep[3] = "water"
nstep[4] = "spoon"
}
*/

}

#define resdecoding
///research decoding

if(startedres !=-1)
{
for(i=0;i<8;i++)
{
nstep[startedres,string_pos(string(i),rescode[startedres])-1] = i 
}
}


#define researchmode
///research
//draw control
if(global.mode = "research")
{
draw_sprite(spr_crucible,0,tx,ty)

for(i=0;i<8;i++)
{
for(z=0;z<2;z++)
{
if(ustep[startedres,i] == -1 && z == 1)
{
draw_sprite(spr_label,1,tx+i*69-241,ty+z*69+180)
}
else
{
draw_sprite(spr_label,0,tx+i*69-241,ty+z*69+180)
}
if(step[startedres,i]!= -1 && z == 0)
{
draw_sprite(spr_steps,step[startedres,i],tx+i*69-241,ty+180)
}
if(ustep[startedres,i]!= -1 && z== 1)
{
draw_sprite(spr_steps,ustep[startedres,i],tx+i*69-241,ty+69+180)
}

}
}


//steps clicking
for(i=0;i<4;i++)
{
for(z=0;z<2;z++)
{
draw_sprite(spr_label,0,tx+z*640-320,ty+i*69-120)
draw_sprite(spr_steps,z*4+i,tx+z*640-320,ty+i*69-120)
if(stepactive[startedres,z*4+i] = 1)
{
draw_set_colour(c_black)
draw_set_alpha(0.4)
draw_rectangle(tx+z*640-320+32,ty+i*69-120+32,tx+z*640-320-32,ty+i*69-120-32,0)
draw_set_colour(c_white)
draw_set_alpha(1)
}

if(mouse_x < tx+z*640-320+32 && mouse_x > tx+z*640-320-32 && mouse_y < ty+i*69-120+32 && mouse_y > ty+i*69-120-32)
{
if(mouse_check_button_pressed(1) && stepactive[startedres,z*4+i] = 0)
{
stepactive[startedres,z*4+i] = 1
step[startedres,stepcount[startedres]] = z*4+i
stepcount[startedres] +=1
}
}
}
}




draw_sprite(spr_label,0,tx,ty-245)
draw_sprite(spr_label,0,tx,ty-220)
draw_set_font(fontsym2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx,ty-248,global.elementsym[reqelem[startedres]])
draw_set_font(fontres2)
draw_text(tx,ty-272,string(global.elementscount[reqelem[startedres]])+"g")




draw_sprite(spr_label,0,tx-1*69-241,ty+0.5*69+180-25)
draw_sprite(spr_label,0,tx-1*69-241,ty+0.5*69+180)

if(catelemadd[startedres] = 0)
{
draw_sprite(spr_steps,8,tx-1*69-241,ty+0.5*69+180)
if(mouse_x < tx-1*69-241+32 && mouse_x > tx-1*69-241-32 && mouse_y < ty+0.5*69+180 +32 && mouse_y > ty+0.5*69+180-32)
{
if(mouse_check_button_pressed(1))
{
catelemadd[startedres] = 1
}
}
}

if(catelemadd[startedres] = 1)
{
draw_set_font(fontsym2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx-1*69-241,ty+0.5*69+180-28,global.elementsym[catelem[startedres]])
draw_set_font(fontres2)
draw_text(tx-1*69-241,ty+0.5*69+180-28-24,string(global.elementscount[catelem[startedres]])+"g")

if(mouse_x < tx-1*69-241+32 && mouse_x > tx-1*69-241-32 && mouse_y < ty+0.5*69+180 +32 && mouse_y > ty+0.5*69+180-32)
{
if(mouse_check_button_pressed(2))
{
catelemadd[startedres] = 0
}
}
}







draw_sprite(spr_resbutton,0,tx,ty+30)
draw_set_font(fontres2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx,ty+20,"research")
if(stepcount[startedres] < 8)
{
draw_set_colour(c_black)
draw_set_alpha(0.4)
draw_rectangle(tx+58,ty+30+24,tx-58,ty+30-24,0)
draw_set_colour(c_white)
draw_set_alpha(1)
}
if(mouse_x < tx+58 && mouse_x > tx-58 && mouse_y < ty+54 && mouse_y > ty+6 && stepcount[startedres] >= 8)
{
if(mouse_check_button_pressed(1) && global.elementscount[reqelem[startedres]] > 0)
{
global.elementscount[reqelem[startedres]] -= 1
for(i=0;i<8;i++)
{
if(ustep[startedres,i]!=-1)
{
if(step[startedres,i] != ustep[startedres,i])
{
fakeres = 1
}
}
}

for(i=0;i<8;i++)
{
if(step[startedres,i] = nstep[startedres,i] && fakeres = 0)
{
ustep[startedres,i] = step[startedres,i]
}
step[startedres,i] = -1
stepactive[startedres,i] = 0
}

for(i=0;i<8;i++)
{
if(ustep[startedres,i] = -1)
{
lockedres[totallocks] = ustep[startedres,i]
lockedadres[totallocks] = i
totallocks +=1
}
}

catalyst()

stepcount[startedres] = 0

if(totallocks = 0)
{
research[startedres] = "finished"
global.mode = "main"
startedres = -1
totalunlocks = 0
}
totallocks = 0
fakeres = 0
}
}
}

#define catalyst
if(catelemadd[startedres] = 1 && global.elementscount[catelem[startedres]] >0 && fakeres = 0)
{
if(totallocks !=0)
{
unlockable = irandom(totallocks-1)

ustep[startedres,lockedadres[unlockable]] = nstep[startedres,lockedadres[unlockable]]
unlockable = -1
for(i=0;i<8;i++)
{
lockedres[i] = -1
lockedadres[i] = -1
}
global.elementscount[catelem[startedres]]-=1
}
}

#define researchfinishing
