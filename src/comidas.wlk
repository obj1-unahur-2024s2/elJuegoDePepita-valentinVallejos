import pepita.*
import wollok.game.*
import extras.*

object manzana {

	method image() = "manzana.png"

	method position() = game.at(game.width()-1,game.height()-1)

	method energiaQueOtorga() = 100

	method chocar(personaje) {personaje.come(self)} 

}

object alpiste {

	method image() = "alpiste.png"

	method position() = nido.position().down(1)

	method energiaQueOtorga() = pepita.energia()*3

	method chocar(personaje) {personaje.come(self)} 
}


