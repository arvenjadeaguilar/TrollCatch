extends Control

signal gameover;
signal score;
func _ready():
	pass # Replace with function body.

func play_animation():
	$animation.play("smash");

func stop_animation():
	$animation.stop(true);
	
func _on_Area2D_area_entered(area):
	if(area.is_in_group("snake")):
		emit_signal("gameover")
	if(area.is_in_group("apple")):
		emit_signal("score")
	pass # Replace with function body.
