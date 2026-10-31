extends Control

@onready var time = $Panel/TextureRect2/Label
@onready var kill = $Panel/TextureRect3/Label
@onready var gold = $Panel/TextureRect4/Label

var callback:Callable

var data

func _enter_tree() -> void:
	Utils.crosshairChange(false)
	Utils.set_menu_mouse()

func _exit_tree() -> void:
	Utils.crosshairChange(true)
	Utils.set_gameplay_mouse()

func _ready() -> void:
	time.text = "%s: %s" %[tr("SURVIVAL TIME"),int(data["time"])]
	kill.text = "%s: %s" %[tr("DEFEAT ENEMIES"),data["kill"]]
	gold.text = "%s: %s" %[tr("OBTAIN GOLD"),data["gold"]]

func setData(data):
	self.data = data

func setCallBack(callback:Callable):
	self.callback = callback

func _on_button_pressed() -> void:
	if callback:
		callback.call()
	queue_free()



