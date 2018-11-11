extends Node

onready var troll = $troll;
var left_position = Vector2(272, 358);
var right_position = Vector2(582, 358);


var left_spawn_position = Vector2(381, -74);
var right_spawn_position = Vector2(717, -74);

var snake = preload("res://scenes/Snake.tscn");
var apple = preload("res://scenes/Apple.tscn");
var score = 0;

var items = [];
func _ready():
	
	
	troll.connect("gameover",self,"on_gameover");
	troll.connect("score",self,"on_score");
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_just_pressed("go_left")):
		troll.rect_position = left_position;
		troll.rect_scale = Vector2(1,1);
		
	if(Input.is_action_just_pressed("go_right")):
		troll.rect_position = right_position;
		troll.rect_scale = Vector2(-1,1);

func _spawn_items():
	var randomNumber = round(rand_range(0,1));
	var randomNumber2 = round(rand_range(0,1));
	var instance;
	if randomNumber == 0:
		instance = snake.instance();
	else:
		instance = apple.instance();
		
	if randomNumber2 == 0:
		instance.position = left_spawn_position;
	else:
		instance.position = right_spawn_position;
	
	add_child(instance);
	items.append(instance);
	pass;
	

func _on_Timer_timeout():
	_spawn_items();
	pass # Replace with function body.

func on_gameover():
	$gameover.visible = true;
	$gameover/title.visible = true;
	$gameover/play.visible = true;
	
	$animate.stop(true);
	troll.stop_animation();
	$Timer.stop();
	
	for item in items:
		var ref = weakref(item);
		if(ref.get_ref()):
			item.queue_free();
	items = [];
	pass


func on_score():
	score += 1;
	$score.text = String(score);
	pass

func _on_play_pressed():
	
	$animate.play("tree_shaking")
	$Timer.start();
	troll.play_animation();
	$gameover.visible = false;
	$gameover/title.visible = false;
	$gameover/play.visible = false;
	pass # Replace with function body.
