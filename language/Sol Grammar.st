<?xml version="1.0"?>

<st-source>



















<name-space>
<name>Grammar</name>
<environment>Sol</environment>
<private>false</private>
<imports>
			private Smalltalk.*
			</imports>
<category>Sol Grammar</category>
</name-space>


<class>
<name>WastePilesSpec</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.WastePilesSpec class</class-id> <category>creation</category>

<body>new: cant
	^super new initialize:cant</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.WastePilesSpec</class-id> <category>initialization</category>

<body>initialize:cant
	count:=cant</body>
</methods>

<methods>
<class-id>Sol.Grammar.WastePilesSpec</class-id> <category>getters</category>

<body>count
	^count</body>
</methods>

<methods>
<class-id>Sol.Grammar.WastePilesSpec</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'pilas auxiliares :'.
	aStream nextPutAll: count asString.</body>
</methods>
<new-page/>


<class>
<name>Condition</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>ForEach</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Condition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pile variable conditions </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ForEach class</class-id> <category>creation</category>

<body>new:p using: v check:cond
	^super new initialize: p using: v check:cond</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ForEach</class-id> <category>initialization</category>

<body>initialize: p using: v check:cond
	pile:=p.
	variable:=v.
	conditions:=cond.</body>
</methods>

<methods>
<class-id>Sol.Grammar.ForEach</class-id> <category>getters</category>

<body>conditions
	^conditions</body>

<body>pile
	^pile</body>

<body>variable
	^variable</body>
</methods>

<methods>
<class-id>Sol.Grammar.ForEach</class-id> <category>printing</category>

<body>printOn: aStream
	self print:aStream.
	aStream nextPutAll:'-para-cada ('.
	pile printOn: aStream.
	aStream nextPutAll:' '.
	variable printOn: aStream.
	aStream nextPutAll:' ) ['.
	conditions printOn: aStream.
	aStream nextPutAll:' ]'.</body>
</methods>
<new-page/>


<class>
<name>PilesType</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>BinaryCondition</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Condition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>cond1 cond2 </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.BinaryCondition class</class-id> <category>creation</category>

<body>new:cond1 with:cond2
	^super new initialize:cond1 with:cond2</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.BinaryCondition</class-id> <category>getters</category>

<body>firstCondition
	^cond1</body>

<body>secondCondition
	^cond2</body>
</methods>

<methods>
<class-id>Sol.Grammar.BinaryCondition</class-id> <category>initialization</category>

<body>initialize:con1 with:con2
	cond1:=con1.
	cond2:=con2.</body>
</methods>

<methods>
<class-id>Sol.Grammar.BinaryCondition</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'('.
	cond1 printOn: aStream.
	self printOperation:aStream.
	cond2 printOn:aStream.
	aStream nextPutAll:')'.</body>
</methods>
<new-page/>


<class>
<name>Foundations</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.PilesType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Foundations</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' bases'.</body>
</methods>
<new-page/>


<class>
<name>AllDecks</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.PilesType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.AllDecks</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' mazos'</body>
</methods>
<new-page/>


<class>
<name>GameSpecification</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name configuration init rules </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.GameSpecification class</class-id> <category>creation</category>

<body>new: nombre init: inicio configuration:configuracion rules: reglas
	^super new initialize: nombre init: inicio configuration:configuracion rules: reglas</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.GameSpecification</class-id> <category>getters</category>

<body>configuration 
^configuration</body>

<body>init
	^init</body>

<body>name
	^name</body>

<body>rules
	^rules</body>
</methods>

<methods>
<class-id>Sol.Grammar.GameSpecification</class-id> <category>initialization</category>

<body>initialize: nombre init: inicio configuration:configuracion rules: reglas
	name:=nombre.
	init:=inicio.
	configuration:=configuracion.
	rules:=reglas.</body>
</methods>

<methods>
<class-id>Sol.Grammar.GameSpecification</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:('Nombre = ', name). aStream cr. aStream cr.
	configuration printOn: aStream. 	aStream cr.
	init printOn:aStream. 	aStream cr.
	rules printOn:aStream.</body>
</methods>
<new-page/>


<class>
<name>CardTypeSubExpression</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>RemoveFromTalonHeader</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.RemoveFromTalonHeader</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' sacar del pozo'.</body>
</methods>
<new-page/>


<class>
<name>Pile</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>Talon</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Pile</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Talon</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' pozo'.</body>
</methods>
<new-page/>


<class>
<name>PlayingPile</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Pile</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.PlayingPile</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' pila de juego'.</body>
</methods>
<new-page/>


<class>
<name>WastePile</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Pile</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.WastePile</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' pila auxiliar'.</body>
</methods>
<new-page/>


<class>
<name>NextCardType</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardTypeSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>type </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.NextCardType class</class-id> <category>creation</category>

<body>new: type
	^super new initialize: type</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.NextCardType</class-id> <category>initialization</category>

<body>initialize: t
	type:=t.</body>
</methods>

<methods>
<class-id>Sol.Grammar.NextCardType</class-id> <category>getters</category>

<body>type
	^type</body>
</methods>

<methods>
<class-id>Sol.Grammar.NextCardType</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' siguiente('.
	type printOn: aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Init</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>configuration </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Init class</class-id> <category>creation</category>

<body>new: initConf
	^super new initialize: initConf</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Init</class-id> <category>initialization</category>

<body>initialize: initConf
	configuration:= initConf</body>
</methods>

<methods>
<class-id>Sol.Grammar.Init</class-id> <category>getters</category>

<body>configuration
	^configuration</body>
</methods>

<methods>
<class-id>Sol.Grammar.Init</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'Inicio ='. 	aStream cr.
	configuration do:[:c| c printOn: aStream. aStream cr.]</body>
</methods>
<new-page/>


<class>
<name>Talons</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.PilesType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>talons </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Talons class</class-id> <category>creation</category>

<body>new: spec
	^super new initialize:spec</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Talons</class-id> <category>initialization</category>

<body>initialize: spec
	talons:=spec.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Talons</class-id> <category>getters</category>

<body>talons
	^talons</body>
</methods>

<methods>
<class-id>Sol.Grammar.Talons</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' pozos'.</body>
</methods>
<new-page/>


<class>
<name>PreviousCardType</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardTypeSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>type </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PreviousCardType class</class-id> <category>creation</category>

<body>new: type
	^super new initialize: type</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PreviousCardType</class-id> <category>initialization</category>

<body>initialize: t
	type:=t.</body>
</methods>

<methods>
<class-id>Sol.Grammar.PreviousCardType</class-id> <category>getters</category>

<body>type
	^type</body>
</methods>

<methods>
<class-id>Sol.Grammar.PreviousCardType</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' anterior('.
	type printOn: aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Implies</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.BinaryCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Implies</class-id> <category>printing</category>

<body>printOperation:aStream
	aStream nextPutAll: ' =&gt; '</body>
</methods>
<new-page/>


<class>
<name>UnaryCondition</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Condition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>cond </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.UnaryCondition class</class-id> <category>creation</category>

<body>new: cond
	^super new initialize:cond</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.UnaryCondition</class-id> <category>getters</category>

<body>condition
^cond</body>
</methods>

<methods>
<class-id>Sol.Grammar.UnaryCondition</class-id> <category>initialization</category>

<body>initialize:con
	cond:=con.</body>
</methods>
<new-page/>


<class>
<name>Rules</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>rules </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Rules class</class-id> <category>creation</category>

<body>new:lst
	^super new initialize: lst</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Rules</class-id> <category>initialization</category>

<body>initialize:lst
	rules:=lst</body>
</methods>

<methods>
<class-id>Sol.Grammar.Rules</class-id> <category>getters</category>

<body>rules
	^rules</body>
</methods>

<methods>
<class-id>Sol.Grammar.Rules</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'Reglas ='.
	aStream cr.
	rules do:[:r| aStream nextPutAll:'* '. r printOn:aStream. aStream nextPutAll:'.'. aStream cr.].</body>
</methods>
<new-page/>


<class>
<name>TalonSpec</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count turn circular repository </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.TalonSpec class</class-id> <category>creation</category>

<body>new: cant turn: turn circular: circ repository: rep
	^super new initialize: cant turn: turn circular: circ repository: rep</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.TalonSpec</class-id> <category>getters</category>

<body>circular
	^circular</body>

<body>count
	^count</body>

<body>repository
	^repository</body>

<body>turn
	^turn</body>
</methods>

<methods>
<class-id>Sol.Grammar.TalonSpec</class-id> <category>initialization</category>

<body>initialize: cant turn: turn_ circular: circ repository: rep
	count:=cant.
	turn:=turn_.
	circular:=circ.
	repository:=rep.</body>
</methods>

<methods>
<class-id>Sol.Grammar.TalonSpec</class-id> <category>printing</category>

<body>printOn: aStream
	count printOn: aStream.	aStream nextPutAll:' ,'.
	turn printOn: aStream. 	aStream nextPutAll:' ,'.
	circular printOn: aStream. aStream nextPutAll:' ,'.
	repository printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>IntegerSubExpression</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>CardsCountInPilesType</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.IntegerSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pileType </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardsCountInPilesType class</class-id> <category>creation</category>

<body>new: pileType
	^super new initialize: pileType</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardsCountInPilesType</class-id> <category>initialization</category>

<body>initialize: pt
	pileType:=pt</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardsCountInPilesType</class-id> <category>getters</category>

<body>pileType
	^pileType</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardsCountInPilesType</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' cantidad en ('.
	pileType printOn:aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>CardsCountInPile</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.IntegerSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pile </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardsCountInPile class</class-id> <category>creation</category>

<body>new: pile
	^super new initialize: pile</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardsCountInPile</class-id> <category>initialization</category>

<body>initialize: p
	pile:=p</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardsCountInPile</class-id> <category>getters</category>

<body>pile
	^pile</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardsCountInPile</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' cantidad de cartas ('.
	pile printOn:aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>OrForEach</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ForEach</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.OrForEach</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'o'.</body>
</methods>
<new-page/>


<class>
<name>NoWastePiles</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.NoWastePiles</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'pilas auxiliares: 0'.</body>
</methods>
<new-page/>


<class>
<name>FoundationSpec</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.FoundationSpec class</class-id> <category>creation</category>

<body>new: cant
	^super new initialize:cant</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.FoundationSpec</class-id> <category>getters</category>

<body>count
	^count</body>
</methods>

<methods>
<class-id>Sol.Grammar.FoundationSpec</class-id> <category>initialization</category>

<body>initialize:cant
	count:=cant</body>
</methods>

<methods>
<class-id>Sol.Grammar.FoundationSpec</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'bases :'.
	aStream nextPutAll: count asString.</body>
</methods>
<new-page/>


<class>
<name>AndForEach</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ForEach</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.AndForEach</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'y'.</body>
</methods>
<new-page/>


<class>
<name>WastePiles</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.PilesType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.WastePiles</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' pilas auxiliares'.</body>
</methods>
<new-page/>


<class>
<name>Variable</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>var </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Variable class</class-id> <category>creation</category>

<body>new: value
	^super new initialize: value</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Variable</class-id> <category>getters</category>

<body>value
	^var</body>
</methods>

<methods>
<class-id>Sol.Grammar.Variable</class-id> <category>initialization</category>

<body>initialize: v
	var:=v.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Variable</class-id> <category>printing</category>

<body>printOn: aStream
	var printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>Rule</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>description </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Rule class</class-id> <category>creation</category>

<body>new: desc
	^super new initialize:desc</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Rule</class-id> <category>initialization</category>

<body>initialize: desc
	description:= desc</body>
</methods>

<methods>
<class-id>Sol.Grammar.Rule</class-id> <category>getters</category>

<body>description
	^description</body>
</methods>

<methods>
<class-id>Sol.Grammar.Rule</class-id> <category>setters</category>

<body>description:desc
	description:=desc.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Rule</class-id> <category>printing</category>

<body>printOn: aStream
	self print:aStream.
	description do:[:line| line printOn:aStream. aStream cr.].</body>
</methods>
<new-page/>


<class>
<name>Pile_Variable</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pile var </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Pile_Variable class</class-id> <category>creation</category>

<body>new: p variable: v
	^super new initialize: p variable: v</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Pile_Variable</class-id> <category>initialization</category>

<body>initialize: p variable: v
	pile:=p.
	var:= v.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Pile_Variable</class-id> <category>getters</category>

<body>pile
	^pile</body>

<body>variable
	^var</body>
</methods>

<methods>
<class-id>Sol.Grammar.Pile_Variable</class-id> <category>printing</category>

<body>printOn: aStream
	pile printOn: aStream.
	var printOn: aStream.</body>

<body>printOperation:aStream
	aStream nextPutAll: ' || '</body>
</methods>
<new-page/>


<class>
<name>CardExpression</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>NextCard</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>card </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.NextCard class</class-id> <category>creation</category>

<body>new:card
	^super new initialize: card</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.NextCard</class-id> <category>initialization</category>

<body>initialize: c
	card:= c.</body>
</methods>

<methods>
<class-id>Sol.Grammar.NextCard</class-id> <category>getters</category>

<body>card
	^card</body>
</methods>

<methods>
<class-id>Sol.Grammar.NextCard</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'siguiente('.
	card printOn:aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>TopPile</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pile </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.TopPile class</class-id> <category>creation</category>

<body>new: pile
	^super new initialize:pile</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.TopPile</class-id> <category>initialization</category>

<body>initialize:p
	pile:=p</body>
</methods>

<methods>
<class-id>Sol.Grammar.TopPile</class-id> <category>getters</category>

<body>pile
	^pile</body>
</methods>

<methods>
<class-id>Sol.Grammar.TopPile</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'tope('.
	pile printOn:aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Configuration</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>decks wastePiles talons foundations playingPiles </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Configuration class</class-id> <category>creation</category>

<body>new: decks wastePiles: wastePiles talons: talons foundations: foundations playingPiles: playingPiles
	^super new initialize: decks wastePiles: wastePiles talons: talons foundations: foundations playingPiles: playingPiles</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Configuration</class-id> <category>getters</category>

<body>decks
^decks</body>

<body>foundations
	^foundations</body>

<body>playingPiles
	^playingPiles</body>

<body>talons
	^talons</body>

<body>wastePiles
	^wastePiles</body>
</methods>

<methods>
<class-id>Sol.Grammar.Configuration</class-id> <category>initialization</category>

<body>initialize: decks_ wastePiles: wastePiles_ talons: talons_ foundations: foundations_ playingPiles: playingPiles_
	decks:=decks_.
	wastePiles:=wastePiles_.
	talons:=talons_.
	foundations:=foundations_.
	playingPiles:=playingPiles_.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Configuration</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'Configuración='.	aStream cr.
	decks printOn: aStream.	aStream cr.
	wastePiles printOn: aStream.	aStream cr.
	talons printOn: aStream.	aStream cr.
	foundations printOn: aStream.	aStream cr.
	playingPiles printOn: aStream.	aStream cr.</body>
</methods>
<new-page/>


<class>
<name>NoTalon</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.NoTalon</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' pozos: 0'.</body>
</methods>
<new-page/>


<class>
<name>And</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.BinaryCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.And</class-id> <category>printing</category>

<body>printOperation:aStream
	aStream nextPutAll: ' &amp;&amp; '</body>
</methods>
<new-page/>


<class>
<name>DescriptionLine</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>conditions actions </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.DescriptionLine class</class-id> <category>creation</category>

<body>new: cond actions:act
	^super new initialize: cond actions:act</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.DescriptionLine</class-id> <category>initialization</category>

<body>initialize: cond actions:act
	conditions:=cond.
	actions:=act.</body>
</methods>

<methods>
<class-id>Sol.Grammar.DescriptionLine</class-id> <category>getters</category>

<body>actions
	^actions</body>

<body>conditions
	^conditions</body>
</methods>

<methods>
<class-id>Sol.Grammar.DescriptionLine</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:'si ('.
	conditions printOn:aStream.
	aStream nextPutAll:')'.
	aStream cr.
	aStream nextPutAll:'entonces '.
	actions printOn:aStream.</body>
</methods>
<new-page/>


<class>
<name>InitAll</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.InitAll class</class-id> <category>creation</category>

<body>new: cant
	^super new initialize:cant</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.InitAll</class-id> <category>initialization</category>

<body>initialize:cant
	count:=cant</body>
</methods>

<methods>
<class-id>Sol.Grammar.InitAll</class-id> <category>getters</category>

<body>count
	^count</body>
</methods>

<methods>
<class-id>Sol.Grammar.InitAll</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'todos a '.
	count printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>WinRule</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Rule</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.WinRule</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'ganar: '.
	description printOn:aStream.</body>
</methods>
<new-page/>


<class>
<name>Or</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.BinaryCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Or</class-id> <category>printing</category>

<body>printOperation:aStream
	aStream nextPutAll: ' || '</body>
</methods>
<new-page/>


<class>
<name>SimpleCondition</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Condition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>ComparisonExpression</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.SimpleCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>elem1 elem2 </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ComparisonExpression class</class-id> <category>creation</category>

<body>new:e1 and:e2
	^super new initialize:e1 and:e2</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ComparisonExpression</class-id> <category>initialization</category>

<body>initialize:e1 and:e2
	elem1:=e1.
	elem2:=e2.</body>
</methods>

<methods>
<class-id>Sol.Grammar.ComparisonExpression</class-id> <category>getters</category>

<body>element1
	^elem1</body>

<body>element2
	^elem2</body>
</methods>

<methods>
<class-id>Sol.Grammar.ComparisonExpression</class-id> <category>printing</category>

<body>printOn: aStream
	elem1 printOn: aStream.
	self print: aStream.
	elem2 printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>Lower</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Lower</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'&lt;'.</body>
</methods>
<new-page/>


<class>
<name>Comparison</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Comparison</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:' =='.</body>
</methods>
<new-page/>


<class>
<name>Greater</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Greater</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'&gt;'.</body>
</methods>
<new-page/>


<class>
<name>LowerE</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.LowerE</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'&lt;='.</body>
</methods>
<new-page/>


<class>
<name>ComparisonNot</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.ComparisonNot</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:' /='.</body>
</methods>
<new-page/>


<class>
<name>Decks</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count type </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Decks class</class-id> <category>creation</category>

<body>new:cant type:tipo
	^super new initialize:cant type:tipo</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Decks</class-id> <category>initialization</category>

<body> initialize:cant type:tipo
	count:=cant.
	type:=tipo.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Decks</class-id> <category>getters</category>

<body>count
	^count</body>

<body>type
	^type</body>
</methods>

<methods>
<class-id>Sol.Grammar.Decks</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'mazos :'.
	count printOn: aStream.
	type printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>CardColorSubExpression</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>CardColorExpression</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardColorSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>card </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardColorExpression class</class-id> <category>creation</category>

<body>new: card
	^super new initialize: card</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardColorExpression</class-id> <category>initialization</category>

<body>initialize: c
	card:=c.</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardColorExpression</class-id> <category>getters</category>

<body>card
	^card</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardColorExpression</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' color('.
	card printOn: aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Black</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardColorSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Black</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' negro'.</body>
</methods>
<new-page/>


<class>
<name>Red</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardColorSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Red</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' rojo'.</body>
</methods>
<new-page/>


<class>
<name>InitCount</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.InitCount class</class-id> <category>creation</category>

<body>new: cant
	^super new initialize:cant</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.InitCount</class-id> <category>initialization</category>

<body>initialize:cant
	count:=cant</body>
</methods>

<methods>
<class-id>Sol.Grammar.InitCount</class-id> <category>getters</category>

<body>count
	^count</body>
</methods>

<methods>
<class-id>Sol.Grammar.InitCount</class-id> <category>printing</category>

<body>printOn:aStream
	self print:aStream.
	aStream nextPutAll:' :'.
	count printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>PlayingPileInitCount</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.InitCount</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.PlayingPileInitCount</class-id> <category>printing</category>

<body>print:aStream
	aStream nextPutAll:' cartas en pilas de juego	'.</body>
</methods>
<new-page/>


<class>
<name>TalonsInitCount</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.InitCount</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.TalonsInitCount</class-id> <category>printing</category>

<body>print:aStream
	aStream nextPutAll:' cartas en pozos '.</body>
</methods>
<new-page/>


<class>
<name>FoundationsInitCount</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.InitCount</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.FoundationsInitCount</class-id> <category>printing</category>

<body>print:aStream
	aStream nextPutAll:' cartas en bases '.</body>
</methods>
<new-page/>


<class>
<name>ListInitValues</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>list </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ListInitValues class</class-id> <category>creation</category>

<body>new: lst
	^super new initialize:lst</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ListInitValues</class-id> <category>getters</category>

<body>list
	^list</body>
</methods>

<methods>
<class-id>Sol.Grammar.ListInitValues</class-id> <category>initialization</category>

<body>initialize: lista
	list:=lista</body>
</methods>

<methods>
<class-id>Sol.Grammar.ListInitValues</class-id> <category>printing</category>

<body>printOn: aStream
	list do:[:v| v printOn: aStream].</body>
</methods>
<new-page/>


<class>
<name>CardSuitSubExpression</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>Diamond</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Diamond</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' diamante'.</body>
</methods>
<new-page/>


<class>
<name>PlayingPilesSpec</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>count </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PlayingPilesSpec class</class-id> <category>creation</category>

<body>new: cant
	^super new initialize:cant</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PlayingPilesSpec</class-id> <category>initialization</category>

<body>initialize:cant
	count:=cant</body>
</methods>

<methods>
<class-id>Sol.Grammar.PlayingPilesSpec</class-id> <category>getters</category>

<body>count
	^count</body>
</methods>

<methods>
<class-id>Sol.Grammar.PlayingPilesSpec</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'pilas de juegos :'.
	aStream nextPutAll: count asString.</body>
</methods>
<new-page/>


<class>
<name>Heart</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Heart</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'corazón'.</body>
</methods>
<new-page/>


<class>
<name>Rough</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Rough</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' basto'.</body>
</methods>
<new-page/>


<class>
<name>Spade</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Spade</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' pica'.</body>
</methods>
<new-page/>


<class>
<name>Gold</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Gold</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'oro'.</body>
</methods>
<new-page/>


<class>
<name>Club</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Club</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:' trébol'</body>
</methods>
<new-page/>


<class>
<name>CardSuit</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>card </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardSuit class</class-id> <category>creation</category>

<body>new: card
	^super new initialize: card</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardSuit</class-id> <category>initialization</category>

<body>initialize: c
	card:=c.</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardSuit</class-id> <category>getters</category>

<body>card
	^card</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardSuit</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:' palo('.
	card printOn:aStream.
	aStream nextPutAll:')'.</body>
</methods>
<new-page/>


<class>
<name>GreaterE</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ComparisonExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.GreaterE</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'&gt;='.</body>
</methods>
<new-page/>


<class>
<name>MoveHeader</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>source target </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.MoveHeader class</class-id> <category>creation</category>

<body>new: pila1 target:pila2
	^super new initialize: pila1 target:pila2</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.MoveHeader</class-id> <category>getters</category>

<body>source
	^source</body>

<body>target
	^target</body>
</methods>

<methods>
<class-id>Sol.Grammar.MoveHeader</class-id> <category>initialization</category>

<body>initialize: pila1 target:pila2
	source:=pila1.
	target:= pila2.</body>
</methods>

<methods>
<class-id>Sol.Grammar.MoveHeader</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'mover '.
	source printOn: aStream.
	aStream nextPutAll: ' =&gt; '.
	target printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>InitRest</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.InitRest</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:'resto'.</body>
</methods>
<new-page/>


<class>
<name>Foundation</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Pile</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Foundation</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:' base'.</body>
</methods>
<new-page/>


<class>
<name>Action</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>
<new-page/>


<class>
<name>Move</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Action</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>source target </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Move class</class-id> <category>creation</category>

<body>new: pile1 to:pile2
	^super new initialize:pile1 to:pile2</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Move</class-id> <category>initialization</category>

<body>initialize:p1 to:p2
	source:=p1.
	target:=p2.</body>
</methods>

<methods>
<class-id>Sol.Grammar.Move</class-id> <category>getters</category>

<body>source
	^source</body>

<body>target
	^target</body>
</methods>

<methods>
<class-id>Sol.Grammar.Move</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'mover '.
	source printOn: aStream.
	aStream nextPutAll: ' a '.
	target printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>TurnCards</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Action</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.TurnCards</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'dar vuelta cartas'.</body>
</methods>
<new-page/>


<class>
<name>RemoveCards</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Action</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.RemoveCards</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' sacar cartas'.</body>
</methods>
<new-page/>


<class>
<name>UndoAction</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Action</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.UndoAction</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'deshacer'.</body>
</methods>
<new-page/>


<class>
<name>SpanishDeck</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.SpanishDeck</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' español'.</body>
</methods>
<new-page/>


<class>
<name>CardType</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardTypeSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>card </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardType class</class-id> <category>creation</category>

<body>new: card
	^super new initialize:card</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CardType</class-id> <category>initialization</category>

<body>initialize: c
	card:=c.</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardType</class-id> <category>getters</category>

<body>card
	^card</body>
</methods>

<methods>
<class-id>Sol.Grammar.CardType</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' tipo('.
	card printOn: aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Queen</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Queen</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' reina'.</body>
</methods>
<new-page/>


<class>
<name>Number</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>number </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Number class</class-id> <category>creation</category>

<body>new:number
	^super new initialize:number</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.Number</class-id> <category>initialization</category>

<body>initialize:n
	number:=n</body>
</methods>

<methods>
<class-id>Sol.Grammar.Number</class-id> <category>getters</category>

<body>number
	^number</body>
</methods>

<methods>
<class-id>Sol.Grammar.Number</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: number asString</body>
</methods>
<new-page/>


<class>
<name>Joker</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Joker</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' joker'.</body>
</methods>
<new-page/>


<class>
<name>Ten</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Ten</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' 10'.</body>
</methods>
<new-page/>


<class>
<name>As</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.As</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' as'.</body>
</methods>
<new-page/>


<class>
<name>LoseRule</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Rule</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.LoseRule</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: 'perder: '.
	description printOn:aStream.</body>
</methods>
<new-page/>


<class>
<name>True</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.SimpleCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.True</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'V'.</body>
</methods>
<new-page/>


<class>
<name>PreviousCard</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>card </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PreviousCard class</class-id> <category>creation</category>

<body>new: card
	^super new initialize: card</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.PreviousCard</class-id> <category>initialization</category>

<body>initialize: c
	card:=c.</body>
</methods>

<methods>
<class-id>Sol.Grammar.PreviousCard</class-id> <category>getters</category>

<body>card
	^card</body>
</methods>

<methods>
<class-id>Sol.Grammar.PreviousCard</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' anterior('.
	card printOn:aStream.
	aStream nextPutAll: ')'.</body>
</methods>
<new-page/>


<class>
<name>Cup</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardSuitSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Cup</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll:' copa'</body>
</methods>
<new-page/>


<class>
<name>ArithmeticalOperation</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.IntegerSubExpression</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>operand1 operand2 </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ArithmeticalOperation class</class-id> <category>creation</category>

<body>new: op1 with: op2
	^super new initialize:op1 with:op2</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.ArithmeticalOperation</class-id> <category>getters</category>

<body>operand1
	^operand1</body>

<body>operand2
	^operand2</body>
</methods>

<methods>
<class-id>Sol.Grammar.ArithmeticalOperation</class-id> <category>initialization</category>

<body>initialize:op1 with:op2
	operand1:=op1.
	operand2:=op2.</body>
</methods>

<methods>
<class-id>Sol.Grammar.ArithmeticalOperation</class-id> <category>printing</category>

<body>printOn: aStream
	operand1 printOn: aStream.
	self print: aStream.
	operand2 printOn: aStream.</body>
</methods>
<new-page/>


<class>
<name>Div</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ArithmeticalOperation</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Div</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll: ' / '.</body>
</methods>
<new-page/>


<class>
<name>Plus</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ArithmeticalOperation</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Plus</class-id> <category>printing</category>

<body>print: aStream
	aStream nextPutAll:'+'.</body>
</methods>
<new-page/>


<class>
<name>Mult</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ArithmeticalOperation</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Mult</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'*'.</body>
</methods>
<new-page/>


<class>
<name>Minus</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.ArithmeticalOperation</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Minus</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'-'.</body>
</methods>
<new-page/>


<class>
<name>Not</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.UnaryCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.Not</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'¬('.
	cond printOn: aStream.
	aStream nextPutAll:')'.</body>
</methods>
<new-page/>


<class>
<name>CommonRule</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.Rule</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>header </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CommonRule class</class-id> <category>creation</category>

<body>new: enc description:desc
	^super new initialize:enc description:desc</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.CommonRule</class-id> <category>initialization</category>

<body> initialize:enc description:desc
	header:=enc.
	description:=desc.</body>
</methods>

<methods>
<class-id>Sol.Grammar.CommonRule</class-id> <category>getters</category>

<body>header
	^header</body>
</methods>

<methods>
<class-id>Sol.Grammar.CommonRule</class-id> <category>printing</category>

<body>print: aStream
	header printOn:aStream.
	aStream nextPutAll:': '.</body>
</methods>
<new-page/>


<class>
<name>PokerDeck</name>
<environment>Sol.Grammar</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.PokerDeck</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'pocker'.</body>
</methods>
<new-page/>


<class>
<name>EmptyPile</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.SimpleCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>pile </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.EmptyPile class</class-id> <category>creation</category>

<body>new:p
	^super new initialize:p</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>Sol.Grammar.EmptyPile</class-id> <category>getters</category>

<body>pile
	^pile</body>
</methods>

<methods>
<class-id>Sol.Grammar.EmptyPile</class-id> <category>initialization</category>

<body>initialize:p
	pile:=p.</body>
</methods>

<methods>
<class-id>Sol.Grammar.EmptyPile</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'vacia ('.
	pile printOn:aStream.
	aStream nextPutAll:')'.</body>
</methods>
<new-page/>


<class>
<name>King</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.CardType</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.King</class-id> <category>printing</category>

<body>printOn:aStream
	aStream nextPutAll: ' rey'.</body>
</methods>
<new-page/>


<class>
<name>WastePileInitCount</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.InitCount</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.WastePileInitCount</class-id> <category>printing</category>

<body>print:aStream
	aStream nextPutAll:' cartas en pilas auxiliares'.</body>
</methods>
<new-page/>


<class>
<name>False</name>
<environment>Sol.Grammar</environment>
<super>Sol.Grammar.SimpleCondition</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Sol Grammar</category>
</class>

<methods>
<class-id>Sol.Grammar.False</class-id> <category>printing</category>

<body>printOn: aStream
	aStream nextPutAll:'F'.</body>
</methods>













</st-source>
