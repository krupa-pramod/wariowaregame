extends Node2D
@onready var PotionContainer: HBoxContainer = $PotionContainer
@onready var Potion: TextureRect = $PotionContainer/Potion
@onready var Potion2: TextureRect = $PotionContainer/Potion2
@onready var Potion3: TextureRect = $PotionContainer/Potion3
@onready var Potion4: TextureRect = $PotionContainer/Potion4
@onready var Potion5: TextureRect = $PotionContainer/Potion5



@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Time

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

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
			
	timer.text = str(time)
	level.text = "Level" + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	
	return

func wait(seconds:float) -> void:
	await get_tree().create_timer(seconds).timeout			
			
