extends Node2D
@onready var PotionContainer: HBoxContainer = $PotionContainer
@onready var Potion: TextureRect = $PotionContainer/Potion
@onready var Potion2: TextureRect = $PotionContainer/Potion2
@onready var Potion3: TextureRect = $PotionContainer/Potion3
@onready var Potion4: TextureRect = $PotionContainer/Potion4
@onready var Potion5: TextureRect = $PotionContainer/Potion5



@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Potion.show()
	Potion2.show()
	Potion3.show()
	Potion4.show()
	Potion5.show()
	
	await Timer(5.0)
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
	elif Global.current_minigame <= 3:
		get_tree().change_scene_to_file(
		"res://scenes/minigame_" + str(Global.current_minigame) + ".tscn"
	)
	else:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4:
			Potion.hide()
		3:
			Potion.hide()
			Potion2.hide()
		2:
			Potion.hide()
			Potion2.hide()
			Potion3.hide()
		1:
			Potion.hide()
			Potion2.hide()
			Potion3.hide()
			Potion4.hide()
		0:
			PotionContainer.hide()
			
	timer.clear()
	timer.append_text(str(time))
	
	level.clear()
	level.append_text("Level " + str(Global.current_minigame))

func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time = max(time - 0.1, 0.0)
	
	return

func wait(seconds:float) -> void:
	await get_tree().create_timer(seconds).timeout			
			
