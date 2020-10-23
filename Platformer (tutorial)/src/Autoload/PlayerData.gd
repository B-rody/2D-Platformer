extends Node


signal coins_collected_updated
signal player_died

var coins_collected: = 0 setget set_coins_collected
var deaths := 0 setget set_deaths


func set_coins_collected(value: int) -> void:
	coins_collected = value
	emit_signal("coins_collected_updated")

func set_deaths(value: int) -> void:
	deaths = value
	emit_signal("player_died")


func reset() -> void:
	coins_collected = 0
	deaths = 0
