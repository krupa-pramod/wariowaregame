extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var buttons_pressed := 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(3.0)
	timer_end = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if buttons_pressed == 4:
		Global.current_minigame += 1
		if Global.current_minigmae > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

	if timer_end:
		Global.lives -= 1

		if Global.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
