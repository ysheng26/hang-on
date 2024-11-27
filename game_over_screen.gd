extends CanvasLayer

@onready var score_label = $Panel/MarginContainer/Rows/Score
@onready var high_score_label = $Panel/MarginContainer/Rows/HighScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score = Global.score
	score_label.text = "You Survived For " + str(score) + " Seconds"
	Global.score = 0
	#var high_score = load_from_file()
	#if Global.score > high_score:
		#save_to_file(Global.score)
		#high_score = Global.score
	#high_score_label.text = "High Score " + str(Global.score) + " seconds"

#
#func save_to_file(content):
	#var file = FileAccess.open("user://high_score.dat", FileAccess.WRITE)
	#file.store_64(content)
#
#func load_from_file():
	#var file = FileAccess.open("user://high_score.dat", FileAccess.READ)
	#if file:
		#var content = file.get_64()
		#return content
	#return 0


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
