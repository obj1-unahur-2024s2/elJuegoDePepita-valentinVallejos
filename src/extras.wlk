import pepita.*
import wollok.game.*

object nido {

	method position() = game.center()
	method image() = "nido.png"
	method chocar(personaje) {game.say(personaje,"ganaste")}
}

object silvestre {


	method position() = game.at(pepita.position().x().max(3),0)
	

	method image() = "silvestre.png"

	method chocar(personaje) {game.say(personaje,"perdiste")}

}

