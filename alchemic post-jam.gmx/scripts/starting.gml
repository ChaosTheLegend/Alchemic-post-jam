#define starting
///start
if(global.mode = "mainmenu")
{
draw_sprite(spr_mainmenu,0,tx,ty)
for(i=0;i<2;i++)
{
draw_sprite(spr_mainbuttons,i,tx,ty-100+60*i)
if(mouse_x < tx+100 && mouse_x > tx-100 && mouse_y < ty-100+60*i+25 && mouse_y > ty-100+60*i-25 )
{
if(mouse_check_button_pressed(1))
{
if(i = 0)
{
global.mode = "main"
}
if(i = 1)
{
global.mode = "help"
}
}
}



}

}

#define help
///help
if(global.mode == "help")
{
draw_sprite(spr_help,0,tx,ty)
}

#define ending
///ending
if(global.elementscount[83] > 0)
{
global.mode = "ending"
}
if(global.mode = "ending")
{
draw_sprite(spr_ending,0,tx,ty)
}