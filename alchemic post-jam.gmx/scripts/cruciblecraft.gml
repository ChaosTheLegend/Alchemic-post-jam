#define cruciblecraft
if(global.mode = "crucible")
{
for(i=0;i<9;i++)
{
if(research[i] = "finished")
{
if(temp >= rtempmin[i] && temp <= rtempmax[i] && water >= rwater[i] && ((c1 == rc1[i] && c2 == rc2[i]) || (c1 == rc2[i] && c2 == rc1[i])))
{
c3 = rc3[i]
if(mouse_x < tx +40 && mouse_x > tx-40 && mouse_y < ty+24 && mouse_y > ty-24)
{
if(mouse_check_button_pressed(1))
{
if(global.elementscount[c1] > 0 && global.elementscount[c2] >0)
{
global.elementscount[c3] +=1
global.elementscount[c2] -=1
global.elementscount[c1] -=1
water -= rwater[i]
}
}
}
}
else
{
c3 = -1
}
}
}

}

#define crucible
///crucible
if(global.mode = "crucible")
{
draw_sprite(spr_crucible,0,tx,ty)
draw_sprite(spr_label,0,tx-50,ty-225)
draw_sprite(spr_label,0,tx+50,ty-225)
draw_sprite(spr_label,0,tx-50,ty-200)
draw_sprite(spr_label,0,tx+50,ty-200)
draw_sprite(spr_label,0,tx,ty+200)
draw_sprite(spr_label,0,tx,ty+225)
draw_sprite(spr_buybutton,0,tx,ty)
draw_set_font(fontres2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx,ty-8,"make")

draw_healthbar(tx-221,ty-130,tx-190,ty+150,temp/5,c_gray,c_yellow,c_red,3,0,0)
draw_sprite(spr_plus,0,tx-205,ty+175)
draw_healthbar(tx+220,ty-130,tx+189,ty+150,water,c_gray,c_aqua,c_aqua,3,0,0)
draw_sprite(spr_plus,0,tx+205,ty+175)

draw_sprite(spr_bar,0,tx+205,ty+10)
draw_sprite(spr_bar,0,tx-205,ty+10)



draw_sprite(spr_cbutton,0,tx+205,ty+214)
draw_sprite(spr_cbutton,0,tx-205,ty+214)
draw_set_colour(c_black)
draw_set_font(fontres2)
draw_set_halign(fa_center)
draw_text(tx-205,ty+205,string(temp)+"°")
draw_text(tx+205,ty+205,string(water)+"l")

if(mouse_x < tx-205+20 && mouse_x > tx-205-20 && mouse_y < ty+175+20 && mouse_y > ty+175-20)
{
if(mouse_check_button(1))
{
if(temp < 500)
{
temp+=0.5
}
}
}

if(mouse_x < tx+205+20 && mouse_x > tx+205-20 && mouse_y < ty+175+20 && mouse_y > ty+175-20)
{
if(mouse_check_button(1))
{
if(water < 100)
{
water+=0.2
}
}
}


if(temp>20)
{
temp-=temp*(water/5+1)/10000
}

if(temp>100 && water > 0)
{
water-=temp*(water/5)/100000
}



if(mouse_x < tx-50+32 && mouse_x > tx-50-32 && mouse_y < ty-200+32 && mouse_y > ty-200-32)
{
if(mouse_check_button_pressed(1))
{
selectedslot = 1
global.mode = "picking"

}
}
if(mouse_x < tx+50+32 && mouse_x > tx+50-32 && mouse_y < ty-200+32 && mouse_y > ty-200-32)
{
if(mouse_check_button_pressed(1))
{
selectedslot = 2
global.mode = "picking"
}
}





if(c1 = -1)
{
draw_sprite(spr_steps,8,tx-50,ty-200)
}
else
{
draw_set_font(fontsym2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx-50,ty-228,global.elementsym[c1])
draw_set_font(fontres2)
draw_text(tx-50,ty-254,string(global.elementscount[c1])+"g")

}
if(c2 = -1)
{
draw_sprite(spr_steps,8,tx+50,ty-200)
}
else
{
draw_set_font(fontsym2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx+50,ty-228,global.elementsym[c2])
draw_set_font(fontres2)
draw_text(tx+50,ty-254,string(global.elementscount[c2])+"g")
}

if(c3 != -1)
{
draw_set_font(fontsym2)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx,ty+204,global.elementsym[c3])
draw_set_font(fontres2)
draw_text(tx,ty+200-26,string(global.elementscount[c3])+"g")
}

}

#define elempicking
///piccking elements
if(global.mode == "picking")
{
draw_sprite(spr_table,0,tx,ty)
for(i=0;i<18;i++)
{
for(z=0;z<7;z++)
{
if(((z=0 && i>0 && i<17)|| (z>0 && z<3 && i>1 && i<12)) || z*18+i>125)
{
}
else if(global.elementresearch[z*18+i] = 0)
{
draw_sprite(spr_cell,0,tx-380+i*45,ty-130+z*45)
draw_set_font(fontsym)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx-380+i*45,ty-142+z*45,global.elementsym[z*18+i])
if(mouse_x <= tx-380+i*45+20 && mouse_x >= tx-380+i*45-20 && mouse_y <= ty-130+z*45+20 && mouse_y >= ty-130+z*45-20)
{
if(mouse_check_button_pressed(1))
{
if(selectedslot = 1)
{
c1 = z*18+i
}
if(selectedslot = 2)
{
c2 = z*18+i
}
global.mode = "crucible"
}



if(buyingelem = -1)
{
draw_text(tx+250,ty-155,string(global.elementnub[z*18+i])+"."+global.elementname[z*18+i])
draw_text(tx+250,ty-135,"Ammount:"+string(global.elementscount[z*18+i])+"g")
}

}
}
}
}
for(i=0;i<14;i++)
{
for(z=0;z<2;z++)
{
if(global.elementresearch[126+z*14+i] = 0)
{
draw_sprite(spr_cell,0,tx-245+i*45,ty+200+z*45)
draw_set_font(fontsym)
draw_set_colour(c_black)
draw_set_halign(fa_center)
draw_text(tx-245+i*45,ty+200-12+z*45,global.elementsym[126+z*14+i])
if(mouse_x <= tx-245+i*45+20 && mouse_x >= tx-245+i*45-20 && mouse_y <= ty+200+z*45+20 && mouse_y >= ty+200+z*45-20)
{
if(mouse_check_button_pressed(1))
{
if(selectedslot = 1)
{
c1 = 126+z*14+i
}
if(selectedslot = 2)
{
c2 = 126+z*14+i
}
global.mode = "crucible"
}


draw_text(tx+250,ty-155,string(global.elementnub[126+z*14+i])+"."+global.elementname[126+z*14+i])
draw_text(tx+250,ty-135,"Ammount:"+string(global.elementscount[126+z*14+i])+"g")
}
}
}
}
}