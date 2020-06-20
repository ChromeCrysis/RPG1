//Define o que cada tecla faz
key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_down = keyboard_check(ord("S"));

xaxis = (key_right - key_left);
yaxis = (key_up - key_down);