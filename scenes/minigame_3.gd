extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
@onready var memory: Node2D = $memory
@onready var dress_set: Node2D = $dress_set
@onready var boots_set: Node2D = $boots_set
@onready var bags_set: Node2D = $bag_set
@onready var glasses_set: Node2D = $glasses_set


func _ready() -> void:
	dress_set.hide()
	boots_set.hide()
	bags_set.hide()
	glasses_set.hide()
	await themed_timer.Timer(7.0)
	start_selection()


func start_selection() -> void:
	memory.hide()

	dress_set.show()
	boots_set.hide()
	bags_set.hide()
	glasses_set.hide()

func _on_dress1_pressed() -> void:
	lose()

func _on_dress2_pressed() -> void:
	lose()

func _on_dress3_pressed() -> void:
	lose()

func _on_dress4_pressed() -> void:
	print("correct dress clicked")
	dress_set.hide()
	boots_set.show()

func _on_boots1_pressed() -> void:
	lose()

func _on_boots2_pressed() -> void:
	lose()

func _on_boots3_pressed() -> void:
	boots_set.hide()
	bags_set.show()
	
func _on_boots4_pressed() -> void:
	lose()


func _on_bag1_pressed() -> void:
	bags_set.hide()
	glasses_set.show()

func _on_bag2_pressed() -> void:
	lose()

func _on_bag3_pressed() -> void:
	lose()

func _on_bag4_pressed() -> void:
	lose()


func _on_glass1_pressed() -> void:
	lose()

func _on_glasses2_pressed() -> void:
	lose()

func _on_glass3_pressed() -> void:
	lose()

func _on_glass4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")


func lose() -> void:
	Global.lives -= 1

	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
