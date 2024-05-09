extends Label


func _ready():
	text = "Server Ip: " + IP.get_local_addresses()[5]
