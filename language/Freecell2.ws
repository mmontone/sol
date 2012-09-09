Nombre = Freecell

Configuracion =
	  mazo de poker llamado mazo_pocker.
	  8 pilas_de_juego.
 	  pozos:0.
	  bases: 1.
  	  pilas auxiliares:4.

Empezar =
          pilas de juego (pila) hacer:
              repartir 1 carta de mazo a pila

Reglas =
      # mover pila auxiliar => pila de juego:
	       si (vacia(pila de juego) ||
                 tipo(tope(pila auxiliar)) == anterior (tipo(tope(pila de juego))) &&
                 color(tope(pila auxiliar)) /= color(tope(pila de juego)))
   		  entonces mover pila auxiliar a pila de juego.
	# mover pila de juego => base:
		  si (    (vacia(base)      &&      tipo(tope(pila de juego)) == as) ||
			     tipo(tope(pila de juego)) == siguiente(tipo(tope(base))) &&
			     color (tope(pila de juego)) == color (tope(base)) &&
			     palo(tope(pila de juego)) == palo(tope(base)) )
		  entonces mover pila de juego a base.
	# mover pila auxiliar => base:
             si (  (vacia(base)   &&   tipo(tope(pila auxiliar)) == as) ||
                   tipo(tope(pila auxiliar)) == tipo (tope(base)) &&
			 color(tope(pila auxiliar)) == color (tope(base)) &&
                   palo(tope(pila auxiliar)) == palo(tope(base)) )
             entonces mover pila auxiliar a base.
	# mover pila de juego (c) => pila de juego (b):
		  si (  vacia(b) ||
			  ( cantidad de cartas (c) == 1 &&
		          tipo(tope(c)) == anterior(tipo(tope(b))) &&
                     color(tope(c)) /= color( tope(b))))
		  entonces mover c a b.
              si (cantidad en (pilas auxiliares) + 1 > cantidad de cartas(c) ) entonces mover c a b.
	# mover pila de juego => pila auxiliar:
		  si (vacia(pila auxiliar)) entonces mover pila de juego a pila auxiliar.
	# ganar:
           cantidad en (bases) == cantidad en (mazos)
