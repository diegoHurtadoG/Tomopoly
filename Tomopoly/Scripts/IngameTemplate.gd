extends Node2D


#Este script es el del template, solo tiene el boton back, que lo que deberia hacer es
#	Si estoy jugando, cambio a la prueba anterior segun la lista de pruebas hechas
#	Si ya estoy en la ultima prueba, podria no hacer nada o ir al menu


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Back_pressed():
	#get_tree().change_scene(Global.prevScene)
	# Aqui tengo que hacer que en el label ponga la prueba pasada guardad en la lista de global
	pass



func _on_SideMenu_pressed():
	z_index = 1


func _on_hideMenu_pressed():
	z_index = 0
