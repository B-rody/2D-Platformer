extends "res://src/Actors/Actor.gd"


func _ready() -> void:
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > $StompDetector.global_position.y:
		return
	$CollisionShape2D.call_deferred("set", "disabled", true)
	die()
	
	
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	var snap: = Vector2.DOWN * 65.0
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL).y


func die() -> void:
	queue_free()
