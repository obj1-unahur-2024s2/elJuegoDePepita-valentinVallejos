import extras.*
import wollok.game.*

object pepita {

	var property energia = 1000
	var property position = game.at(1,1)

	method image() = "pepita" + if(self.estaEnElNido()) "-grande.png" else if (self.estaSinEnergia()) "-gris.png" else ".png"

	method come(comida) {
		keyboard.c().onPressDo({
			energia = energia + comida.energiaQueOtorga()
			game.removeVisual(comida)
			})
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaSinEnergia()  and self.posicionPosible(nuevaPosicion)){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			game.say(pepita, "energia:"+energia)
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() = position == nido.position()

	method fueAtrapada() = silvestre.position() == position

	method estaSinEnergia() = self.fueAtrapada() or (energia < 0)

	method estaEnElFondo() = self.position().y() == 0

	method posicionPosible(unaPosicion) = unaPosicion.x().between(0, game.width()-1) and unaPosicion.y().between(0, game.height()-1)

	method acercarseAlFondo() {position = game.at(position.x(), 0.max(position.y()-1))}

	method caer(){
		game.onTick(8000, "pepitaCaer", {self.acercarseAlFondo()})
	}

	
	
}

