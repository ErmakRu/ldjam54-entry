can_click = true
rightLimit = x+(sprite_get_width (spr_bar)/2)-30
leftLimit = x-(sprite_get_width (spr_bar) /2)+30


a = instance_create_layer(x,y,"Instances", obj_slider)
a.image_xscale = 1
a.image_yscale = 1
a.barlength = sprite_get_width(spr_slider)
a.rightLimit = rightLimit
a.leftLimit = leftLimit
a.percentage = 100

a.x = a.leftLimit + ((a.percentage/100) * (a.rightLimit-a.leftLimit))
a.clicked = false

