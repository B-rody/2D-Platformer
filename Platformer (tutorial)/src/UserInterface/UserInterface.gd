extends Control


onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var coins_collected: Label = $HBoxContainer/Score
onready var pause_title: Label = $PauseOverlay/Title
var paused: = false setget set_paused


func _ready() -> void:
	pause_title.text = "Paused"
	PlayerData.connect("coins_collected_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_title.text != "You died.":
		self.paused = !paused
		scene_tree.set_input_as_handled()


func set_paused(value: bool) -> void:
	paused = value
	get_tree().paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func update_interface() -> void:
	coins_collected.text = "%s" % str(PlayerData.coins_collected).pad_zeros(_countDigits(PlayerData.coins_collected) + 1)


func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = "You died."


func _countDigits(num: int) -> int:
	var digits: int = 0
	while (num > 0):
		num /= 10
		digits += 1
	return digits
