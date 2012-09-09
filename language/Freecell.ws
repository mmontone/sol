Nombre = Freecell
Configuracion = 
	  mazos: 1 poker.
	  pilas de juego: 8.
 	  pozos:0.
	  bases: 1.
  	  pilas auxiliares:4.
Inicio =
	  cartas en bases: todas a 0.
  	  cartas en pilas de juego: 7 7 7 7 6 6 6 6.
	  cartas en pilas auxiliares: todas a 0.
Reglas =
      # mover pila auxiliar => pila de juego:
	        (vacia(pila de juego) ||
                 tipo(tope(pila auxiliar)) == anterior (tipo(tope(pila de juego))) &&
                 color(tope(pila auxiliar)) /= color(tope(pila de juego)))

	# mover pila de juego => base:
		   (    (vacia(base)      &&      tipo(tope(pila de juego)) == as) ||
			     tipo(tope(pila de juego)) == siguiente(tipo(tope(base))) &&
			     color (tope(pila de juego)) == color (tope(base)) &&
			     palo(tope(pila de juego)) == palo(tope(base)) )

	# mover pila auxiliar => base:
              (  (vacia(base)   &&   tipo(tope(pila auxiliar)) == as) ||
                   tipo(tope(pila auxiliar)) == tipo (tope(base)) &&
			 color(tope(pila auxiliar)) == color (tope(base)) &&
                   palo(tope(pila auxiliar)) == palo(tope(base)) )

	# mover pila de juego (c) => pila de juego (b):
		 (  vacia(b) ||
			  ( cantidad de cartas (c) == 1 &&
		          tipo(tope(c)) == anterior(tipo(tope(b))) &&
                     color(tope(c)) /= color( tope(b))))

	# mover pila de juego => pila auxiliar:
		  (vacia(pila auxiliar))
	# ganar:
           cantidad en (bases) == cantidad en (mazos)
