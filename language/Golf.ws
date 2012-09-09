Nombre = Golf
Configuracion = 
	  mazos: 1 poker.
	  pilas de juego: 7.
	  pozos: 1, una carta, no circular, sin repositorio.
	  bases: 1.
	  pilas auxiliares:0.

Inicio =
	  cartas en bases: 1.
  	  cartas en pilas de juego: todas a 5.
	  cartas en pozos: resto.

Reglas =
      # mover pozo => base: si V entonces mover pozo a base.
	# mover pila de juego => base:
             si tipo (siguiente (tope (pila de juego)) == tipo (tope (base)) ||
                  anterior(tipo(tope(pila de juego))) == tipo(tope(base)))
             entonces mover pila de juego a base.
	# ganar:
           cantidad en (bases) == cantidad en (mazos)
      # perder:
 		¬(cantidad en (bases) == cantidad en (mazos)) &&
		cantidad en (pozos) /= 0 &&
		y-para-cada (pila de juego o) :
                    ¬(vacia(p)) => siguiente(tipo(tope(p))) /= tipo(tope(base)) ||
                                          anterior(tipo(tope(p))) /= tipo (tope(base)).

InterfaceVisual =
    poner pozo:
        coordenada horizontal: centrado.
        coordenada vertical:
