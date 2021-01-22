extends Node2D


# En este script solo guardo lo que pasa cuando se apreta play, lo que deberia pasar
#	es guardar todos los nombres que se escribieron (validando los vacios) en la lista de jugadores

# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	Global.prevScene = get_tree().current_scene.filename
	get_tree().change_scene("res://Scenes/GameModes.tscn")
