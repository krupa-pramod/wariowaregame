extends Node2D

@onready var player_area: Area2D = $"../Player/Area2D"
@onready var self_area: Area2D = $Area2D

signal friend_collected

var collected = false


func _process(delta: float) -> void:
	if collected:
		return

	if player_area.overlaps_area(self_area):
		collected = true
		emit_signal("friend_collected")
		queue_free()
