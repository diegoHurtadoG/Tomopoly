extends VBoxContainer

# Lo que deberia hacer este script es ir agregando nuevas lineas de input cuando se apreta 
#	el boton + en la pantalla
# La parte de guardar los jugadores en la lista lo deberia hacer InputPlayerMenu, pero si 
#	se pone dificil lo puedo hacer aqui

onready var playerInput = get_node("playerInput")
var playerNumber = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	#Aqui poner una condicion sobre si la lista de nombres esta vacia o llena
	#	si esta vacia, cargar la escena normal
	#	si esta no vacia, agregar cajas de texto con cada nombre como si fueran
	#		los jugadores.
	pass


func _on_addPlayer_pressed():
	if playerNumber == 16:
		#Aqui tirar un mensaje de que ya estan los maximo jugadores
		return
	var newLineEdit = LineEdit.new()
	playerNumber += 1
	newLineEdit.placeholder_text = "Jugador " + str(playerNumber)
	var customFont = playerInput.get_font("font")
	customFont.size = 20
	newLineEdit.add_font_override("font", customFont)
	#newLineEdit.align = LineEdit.ALIGN_CENTER #Aqui hay un problema de que no alinea al centro centro
	add_child(newLineEdit)
