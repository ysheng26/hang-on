extends CharacterBody3D

const MAXSPEED = 30
const ACCELERATION = 0.75
var inputVector = Vector3()
var velo = Vector3()

@onready var score_timer = $"../Score/Timer"

func _physics_process(_delta: float) -> void:
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	# try to understand
	velo.x = move_toward(velo.x, inputVector.x * MAXSPEED, ACCELERATION)
	velo.y = move_toward(velo.y, inputVector.y * MAXSPEED, ACCELERATION)
	rotation_degrees.z = velo.x * -2
	rotation_degrees.x = velo.y / 2
	rotation_degrees.y = -velo.x / 2
	velocity = velo
	move_and_slide()
	transform.origin.x = clamp(transform.origin.x, -25, 25)
	transform.origin.y = clamp(transform.origin.y, -15, 15)
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("enemy_group"):
		score_timer.stop()
		get_tree().change_scene_to_file("res://game_over_screen.tscn")
