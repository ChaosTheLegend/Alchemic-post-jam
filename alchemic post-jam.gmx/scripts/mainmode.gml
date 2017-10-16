#define mainmode
///main mode
if(global.mode == "main")
{

}

#define modechange
///mode changing
if(global.mode == "picking" || global.mode == "mainmenu" || global.mode == "help")
{}
else
{
if(keyboard_check_pressed(vk_escape))
{
global.mode = "main"
buyingelem = -1
}
if(keyboard_check_pressed(ord('T')))
{
global.mode = "table"
buyingelem = -1
}
if(keyboard_check_pressed(ord('B')))
{
global.mode = "book"
buyingelem = -1
}
if(keyboard_check_pressed(ord('C')))
{
global.mode = "crucible"
buyingelem = -1
}
}
if(global.mode == "help" && keyboard_check_pressed(vk_escape))
{
global.mode = "mainmenu"
}