Nombre = Solitario simple
Configuracion = 
	  mazos: 1 españoles.
	  pilas de juego: 0.
	  pozos: 1, dos cartas, circular, con repositorio.
	  bases: 4.
  	  pilas auxiliares:0.

Inicio =
	  cartas en bases: todas a 0.
	  cartas en pozos: resto.

Reglas =
	# mover pozo => base:
             si ((vacia (base) && (tipo(tope(pozo))== as)) || 
                (anterior(tipo(tope(pozo))) == tipo(tope(base))) && (palo(tope(pozo)) == palo(tope(base))))
entonces mover pozo a base.
	# ganar:
           cantidad en (bases) == cantidad en (mazos)