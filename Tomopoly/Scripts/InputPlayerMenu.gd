extends Node2D

onready var nameContainer = get_node("inputVBox/inputVBox")
onready var firstPlayerLE = get_node("inputVBox/inputVBox/playerInput")

var count = 0

# En este script solo guardo lo que pasa cuando se apreta play, lo que deberia pasar
#	es guardar todos los nombres que se escribieron (validando los vacios) en la lista de jugadores


# Called when the node enters the scene tree for the first time.
func _ready():
	if len(Global.nameList) == 0:
		pass
	else:
		var firstPlayerLE = get_node("inputVBox/inputVBox/playerInput")
		firstPlayerLE.text = Global.nameList[0]
		count += 1
		var customFont = firstPlayerLE.get_font("font")
		customFont.size = 20
		for name in Global.nameList:
			if count == 1:
				count += 1
				continue
			var addedName = LineEdit.new()
			addedName.add_font_override("font", customFont)
			addedName.text = name
			count += 1
			nameContainer.add_child(addedName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	Global.prevScene = get_tree().current_scene.filename
	get_tree().change_scene("res://Scenes/GameModes.tscn")
	
	#Aqui abajo tengo que recorrer el VBox de nombres y guardar los nombres en global
	#	vboxChild es un int que guarda la cantidad de hijos de la caja, el hijo 0 es el boton de agregar
	#	actualChild es el lineEdit de la iteracion.
	Global.nameList = []
	var vboxChild = nameContainer.get_child_count()
	for i in range(1, vboxChild):
		var actualChild = nameContainer.get_child(i)
		if actualChild.text != "":
			Global.nameList.append(actualChild.text)
		else:
			Global.playerNumber -= 1


