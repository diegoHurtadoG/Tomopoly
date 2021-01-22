extends Node2D

# Este es el script del menu, con los botones basicos del principio
# No deberia tener ninguna ciencia.


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/InputPlayerMenu.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_Exit_pressed():
	get_tree().quit()
