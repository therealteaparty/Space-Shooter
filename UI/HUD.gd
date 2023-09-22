extends Control

var Indicator = load("res://UI/indicator.tscn")
var lives_pos = Vector2(20, Global.VP.y -20)
var lives_index = 30

func _ready():
	update_score()
	update_lives()
	update_time()

func update_score():
	$Score.text = "Score: " + str(Global.score)
	
func update_time():
	$Time.text = "Time: " + str(Global.time)

func update_lives():
	var lives_pos = Vector2(20, Global.VP.y -30)
	for child in $Indicator_Container.get_children():
		child.queue_free()
	for i in range(Global.lives):
		var indicator = Indicator.instantiate()
		$Indicator_Container.add_child(indicator)
		indicator.position = lives_pos + Vector2(lives_index*i, 0)

func _on_timer_timeout():
	Global.update_time(-1)
	update_time()
	if Global.time == 0:
		get_tree().change_scene_to_file("res://UI/end_game.tscn")
	
