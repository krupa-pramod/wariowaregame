extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var friends_collected = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(10.0)
	print("Timer ended in level")
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if timer_end:
		print("changing scene now")
		timer_end = false
		Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

	elif friends_collected >= 3:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func friends_collect() -> void: # cool function that you connect to those garlics
	friends_collected = friends_collected +1
	return
