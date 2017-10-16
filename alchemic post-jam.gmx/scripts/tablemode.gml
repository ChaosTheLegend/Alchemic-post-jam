///table mode
if(global.mode == "table")
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
buyingelem = z*18+i
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
buyingelem = 126+z*14+i
}

if(buyingelem = -1)
{
draw_text(tx+250,ty-155,string(global.elementnub[126+z*14+i])+"."+global.elementname[126+z*14+i])
draw_text(tx+250,ty-135,"Ammount:"+string(global.elementscount[126+z*14+i])+"g")
}

}
}
}
}

//
if(buyingelem > -1)
{
draw_text(tx+250,ty-155,string(global.elementnub[buyingelem])+"."+global.elementname[buyingelem])
draw_text(tx+250,ty-135,"Ammount:"+string(global.elementscount[buyingelem])+"g")
if(buyingelem<75)
{
draw_text(tx-100,ty-185,"Buy:")
}
draw_text(tx-100,ty-110,"Sell:")
draw_set_halign(fa_left)
if(global.money<10000)
{
draw_text(tx-425,ty+180,"Money:"+string(global.money))
}
else if(global.money < 10000000)
{
math_set_epsilon(0.1)
draw_text(tx-425,ty+180,"Money:"+string(global.money/1000)+"k")
math_set_epsilon(0)
}
else
{
math_set_epsilon(0.1)
draw_text(tx-425,ty+180,"Money:"+string(global.money/1000000)+"M")
math_set_epsilon(0)
}
draw_set_halign(fa_center)
for(i=0;i<4;i++)
{
if(buyingelem<75)
{
draw_sprite(spr_buybutton,0,tx-220+85*i,ty-135)
draw_set_font(fonttab)
draw_text(tx-220+85*i,ty-135-8,string(power(10,i))+"G")

if(mouse_x < tx-220+85*i +40 && mouse_x > tx-220+85*i-40 && mouse_y < ty-135+24 && mouse_y > ty-135-24)
{
if(mouse_check_button_pressed(1))
{
if(global.money>=power(10,i)*global.elementcost[buyingelem])
{
global.money-=power(10,i)*global.elementcost[buyingelem]
global.elementscount[buyingelem] += power(10,i)
}
}
}
}
}

for(i=0;i<4;i++)
{
draw_sprite(spr_buybutton,0,tx-220+85*i,ty-55)
draw_set_font(fonttab)
draw_text(tx-220+85*i,ty-28-35,string(power(10,i))+"G")
if(mouse_x < tx-220+85*i +40 && mouse_x > tx-220+85*i-40 && mouse_y < ty-55+24 && mouse_y > ty-55-24)
{
if(mouse_check_button_pressed(1))
{
if(global.elementscount[buyingelem] - power(10,i) >= 0)
{
global.money+=power(10,i)*global.elementcost[buyingelem]
global.elementscount[buyingelem] -= power(10,i)

}
}
}
}

}
}
