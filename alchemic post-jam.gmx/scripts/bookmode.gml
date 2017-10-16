#define bookmode
///book mode


if(global.mode = "book")
{
draw_sprite(spr_bookopen,0,tx,ty)

//researches
totalres = 0
for(i=0;i<9;i++)
{
if(research[i] = "unlocked" || research[i] = "started" )
{
tab[totalres] = i
totalres +=1
}
}

for(i=0;i<totalres;i++)
{
if(resopenable[i] = 0)
{
draw_sprite(spr_binder,1,room_width/2-5-360+100-extention[i],room_height/2-180+i*40)
}
else if (resopenable[i] = 1)
{
draw_sprite(spr_binder,0,room_width/2-5-360+100-extention[i],room_height/2-180+i*40)
if(mouse_x > room_width/2-5-360-62-extention[i]+55 && mouse_x < room_width/2-5-360 && mouse_y > room_height/2-180+i*40-17 && mouse_y < room_height/2-180+i*40+17)
{
if(extention[i] < maxext)
{
extention[i] += 18
}
if(extention[i] > maxext)
{
extention[i] = maxext
}
if(extention[i] = maxext)
{
draw_set_font(fontres)
draw_set_colour(c_white)
draw_set_halign(fa_left)
draw_text(room_width/2-5-360-extention[i]+14,room_height/2-186+i*40,researchname[tab[i]])
}
if(mouse_check_button_pressed(1))
{
selectedres = tab[i]
extention[i] = minext
global.mode = "tab"
}
}
else
{
if(extention[i]> minext)
{
extention[i] -= 15
}
if(extention[i]< minext)
{
extention[i] = minext

}
}
}
}

draw_sprite(spr_page,0,room_width/2-185,room_height/2)
draw_sprite_ext(spr_page,0,room_width/2+185,room_height/2,-1,1,0,c_white,1)

for(i=0;i<10;i++)
{
if(research[i] = "finished")
{
draw_set_colour(tabcolor)
draw_set_font(fontres2)
draw_set_halign(fa_left)
if(mouse_x < tx-320+string_width(researchname[i]) && mouse_x > tx-320 && mouse_y < ty-200+i*22+string_height(researchname[i]) && mouse_y > ty-200+i*22)
{
if(mouse_check_button_pressed(1))
{
selectedres = i
global.mode = "tab"
}
draw_set_colour(tabcolorlight)
}
draw_text(tx-320,ty-200+i*22,"-"+string(researchname[i]))
draw_set_colour(c_black)
}

}

}

#define researchtabmode
///researchtab mode
if(global.mode = "tab")
{
draw_sprite(spr_bookopen,0,tx,ty)
draw_sprite(spr_binder2,0,tx-60,ty-175-extention2)
//draw_rectangle(tx-60+17,ty-205,tx-60-17,ty-205-40-extention2,0)
if(mouse_x < tx-60+17 && mouse_x > tx-60-17 && mouse_y < ty-245 && mouse_y > ty-245-extention2)
{
if(extention2 < maxext2)
{
extention2 += 6
}
if(extention2 >= maxext2)
{
extention2 = maxext2
}
if(mouse_check_button_pressed(1))
{
global.mode = "book"
extention2 = minext2
}
}
else
{
if(extention2 > minext2)
{
extention2 -= 8
}
if(extention2 <= minext2)
{
extention2 = minext2
}
}

if(research[selectedres] != "finished")
{
draw_sprite_ext(spr_page,0,room_width/2+185,room_height/2,-1,1,0,c_white,1)
}
else
{
draw_sprite(spr_page,1,room_width/2+185,room_height/2)
}
draw_sprite(spr_page,0,room_width/2-185,room_height/2)
if(research[selectedres] = "unlocked")
{
if(mouse_x < tx-184+152 && mouse_x > tx-184-152 && mouse_y < ty-130+30 && mouse_y > ty-130-30)
{
draw_sprite(spr_button,1,tx-184,ty-130)
if(mouse_check_button_pressed(1))
{
research[selectedres] = "started"
resnumb = selectedres
startedres = selectedres

global.mode = "research" 
}
}
else
{
draw_sprite(spr_button,0,tx-184,ty-130)
}
}


if(research[selectedres] = "started")
{
if(mouse_x < tx-184+152 && mouse_x > tx-184-152 && mouse_y < ty-130+30 && mouse_y > ty-130-30)
{
draw_sprite(spr_button,3,tx-184,ty-130)
if(mouse_check_button_pressed(1))
{
resnumb = selectedres
startedres = selectedres
global.mode = "research" 
}
}
else
{
draw_sprite(spr_button,2,tx-184,ty-130)
}
}

if(research[selectedres] = "finished")
{
draw_set_font(fontres2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_ext(tx-320,ty-200,researchtext[selectedres],-1,270)



draw_set_font(fontsym3)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_alpha(0.8)

draw_text(tx+155,ty-108,global.elementsym[rc1[selectedres]])
draw_text(tx+215,ty-108,global.elementsym[rc2[selectedres]])
draw_text(tx+185,ty+165,global.elementsym[rc3[selectedres]])
draw_set_font(fontres3)
draw_text(tx+70,ty+135,string(rtempmin[selectedres])+"-"+string(rtempmax[selectedres])+"°")
draw_text(tx+300,ty+135,string(rwater[selectedres])+"L")
draw_set_alpha(1)
draw_set_valign(fa_top)

}
}