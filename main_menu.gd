extends Node2D

const PEER = 9999
var peer = ENetMultiplayerPeer.new()
@export var game_scene: PackedScene
@export var player_scene: PackedScene
@onready var buttons = $Buttons

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_host_button_pressed():
	peer.create_server(PEER)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	add_player()
	buttons.visible = false

func add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)


func _on_join_button_pressed():
	peer.create_client("192.168.2.102", PEER)
	multiplayer.multiplayer_peer = peer
	buttons.visible = false
