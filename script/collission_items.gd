extends Area2D

var speed = 100;
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.y += delta * speed;
	
	if(position.y > 560):
		queue_free();
	pass


func _on_Area2D_area_entered(area):
	if(area.is_in_group("troll")):
		queue_free();
	pass # Replace with function body.
