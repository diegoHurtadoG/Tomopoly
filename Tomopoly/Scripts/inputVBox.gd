extends VBoxContainer

onready var playerInput = get_node("playerInput")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_addPlayer_pressed():
	var newLineEdit = LineEdit.new()
	newLineEdit.placeholder_text = "Jugador"
	var customFont = playerInput.get_font("font")
	customFont.size = 20
	newLineEdit.add_font_override("font", customFont)
	newLineEdit.align = LineEdit.ALIGN_CENTER
	add_child(newLineEdit)
