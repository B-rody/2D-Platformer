extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node) -> void:
	PlayerData.coins_collected += 1
	anim_player.play("fade_out")
