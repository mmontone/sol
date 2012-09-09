<?xml version="1.0"?>

<st-source>



<class>
<name>SolParser</name>
<environment>Smalltalk</environment>
<super>Refactory.SmaCC.SmaCCParser</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>SmaCC Generated Scanner/Parser</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>SolParser class</class-id> <category>generated-starting states</category>

<body>startingStateForSpecification
	^1</body>
</methods>

<methods>
<class-id>SolParser class</class-id> <category>generated-accessing</category>

<body>scannerClass
	^SolScanner</body>
</methods>

<methods>
<class-id>SolParser class</class-id> <category>generated-comments</category>

<body>parserDefinitionComment

	"%left ""+"" ""-"";
%left ""*"" ""/"";
%left ""=&gt;"";
%left ""&amp;&amp;"" ""||"";

Specification ::= Name 'n' Configuration 'conf' Init 'ini' Rules 'rules'{Sol.Grammar.GameSpecification new: n init: ini configuration:conf rules: rules}; 

Name ::= ""Nombre"" ""="" Strings 'sts' {sts};
Strings ::= &lt;String&gt; 'string' &lt;string&gt;* 'strings' {string value, (strings inject:'' into:[:a :b | a, '_', b value]) };

Configuration ::= ""Configuracion"" ""="" Decks 'decks' PlayingPiles 'playingPiles' Talons 'talons' Foundations 'foundations' WastePiles 'wastePiles' {Sol.Grammar.Configuration new: decks wastePiles: wastePiles talons: talons foundations: foundations playingPiles: playingPiles};
Decks ::= ""mazos"" "":"" &lt;natural&gt; 'cant' DeckType 't' ""."" {Sol.Grammar.Decks new:cant value type:t};
PlayingPiles ::= ""pilas"" ""de"" ""juego"" "":"" &lt;natural&gt; 'cant' ""."" {Sol.Grammar.PlayingPilesSpec new:cant value};
WastePiles ::= ""pilas"" ""auxiliares"" "":"" WastePilesSpec 's' ""."" {s};
WastePilesSpec ::= &lt;natural&gt; 'cant' {cant value = 0 ifTrue:[^Sol.Grammar.NoWastePiles new] ifFalse:[^Sol.Grammar.WastePilesSpec new:cant value]};
Talons ::= ""pozos"" "":"" TalonsSpec 'spec'""."" {Sol.Grammar.Talons new: spec};
TalonsSpec ::= {OrderedCollection new} | TalonSpec 'spec' {OrderedCollection with: spec} | TalonSpec 'spec' "";"" TalonsSpec 'specCol' {specCol add: spec;yourself};
TalonSpec ::= ""0"" {Sol.Grammar.NoTalon new} | &lt;natural&gt; 'cant' "","" TurnCards 'turn' "","" Circularity 'circ' "","" Repository 'rep' {Sol.Grammar.TalonSpec new: cant value turn: turn circular: circ repository: rep};
TurnCards ::= ""una"" ""carta"" {1} | ""dos"" ""cartas"" {2} | ""tres"" ""cartas"" {3};
Circularity ::= ""circular"" {true} | ""no circular"" {false};
Repository ::= ""con"" ""repositorio"" {true} | ""sin"" ""repositorio"" {false};

Foundations ::= ""bases"" "":"" &lt;natural&gt; 'cant' ""."" {Sol.Grammar.FoundationSpec new: cant value};
DeckType ::= ""españoles"" {Sol.Grammar.SpanishDeck new} | ""poker"" {Sol.Grammar.PokerDeck new};


Init ::= ""Inicio"" ""="" CardsInPiles 'initConf' {Sol.Grammar.Init new: initConf };
CardsInPiles ::= CardsInPile+ 'cs' {cs};
CardsInPile ::= ""cartas"" ""en"" ""pilas"" ""de"" ""juego"" "":"" CardsCount 'cant' ""."" {Sol.Grammar.PlayingPileInitCount new:cant}
                      | ""cartas"" ""en"" ""bases"" "":"" CardsCount 'cant' ""."" {Sol.Grammar.FoundationsInitCount new: cant}
                      | ""cartas"" ""en"" ""pozos"" "":"" CardsCount 'cant' ""."" {Sol.Grammar.TalonsInitCount new: cant}
                      | ""cartas"" ""en"" ""pilas"" ""auxiliares"" "":"" CardsCount 'cant' ""."" {Sol.Grammar.WastePileInitCount new: cant};
CardsCount ::= ""resto"" {Sol.Grammar.InitRest new} | ""todos"" ""a"" &lt;natural&gt; 'cant' {Sol.Grammar.InitAll new: cant value}
			   | ""todas"" ""a"" &lt;natural&gt; 'cant' {Sol.Grammar.InitAll new: cant value} | NaturalsList 'lst' {Sol.Grammar.ListInitValues new: lst};
NaturalsList ::= &lt;natural&gt;+ 'lista' {lista collect:[:n| n value asNumber]};


Rules ::= ""Reglas"" ""="" RulesList 'lst' {Sol.Grammar.Rules new:lst};
RulesList ::= {OrderedCollection new} | ""#"" Rule 'rule' RulesList 'rules'{rules add: rule; yourself};
Rule ::= CommonRule 'rule' {rule} |  SpecialRule 'rule' {rule};

CommonRule::= RuleHeader 'h' "":"" RuleDescription 'desc'  {Sol.Grammar.CommonRule new: h description:desc};
RuleHeader ::= ""mover"" Pile 'pile1' ""=&gt;"" Pile 'pile2' {Sol.Grammar.MoveHeader new: pile1 target:pile2} |  ""sacar"" ""del"" ""pozo"" {Sol.Grammar.RemoveFromTalonHeader new};
Pile ::= BasicPile 'p' ""("" Variable 'v' "")"" {Sol.Grammar.Pile_Variable new: p variable: v} | BasicPile 'p' {p};
BasicPile ::= ""pozo"" {Sol.Grammar.Talon new} | ""base"" {Sol.Grammar.Foundation new} | ""pila"" ""de"" ""juego"" {Sol.Grammar.PlayingPile new}
			| ""pila"" ""auxiliar"" {Sol.Grammar.WastePile new} | Variable 'var' {var} ;
Variable ::= &lt;string&gt; 's' {Sol.Grammar.Variable new:s value};

RuleDescription ::= Line+ 'lines' {lines};
Line ::= ""si"" Conditions 'cond' ""entonces"" Actions 'act' {Sol.Grammar.DescriptionLine new: cond actions:act};
Conditions ::= Conditions 'cond1' ""&amp;&amp;"" Conditions 'cond2' {Sol.Grammar.And new:cond1 with:cond2}
                  | Conditions 'cond1' ""||"" Conditions 'cond2' {Sol.Grammar.Or new:cond1 with:cond2}
                  | Conditions 'cond1' ""=&gt;"" Conditions 'cond1' {Sol.Grammar.Implies new:cond1 with:cond2}
                  | ""¬"" ""("" Conditions 'cond' "")"" {Sol.Grammar.Not new: cond}
                  | SimpleCondition 'c' {c}
			| ""y-para-cada"" ""("" BasicPile 'p' Variable 'v' "")"" ""["" Conditions 'cs' ""]"" {Sol.Grammar.AndForEach new:p using: v check:cs}
			| ""o-para-cada"" ""("" BasicPile 'p' Variable 'v' "")"" ""["" Conditions 'cs' ""]"" {Sol.Grammar.OrForEach new:p using: v check:cs}
			| ""("" Conditions 'c' "")"" {c};

SimpleCondition ::= ""V"" {Sol.Grammar.True new}
                   | ""F"" {Sol.Grammar.False new}
                   | ""vacia"" ""("" BasicPile 'p' "")"" {Sol.Grammar.EmptyPile new:p}
			 | EqExpression 'e' {e}
                   | IntegerSubExpression 'e1' ComparisonOperator 'op' IntegerSubExpression 'e2' {op new: e1 and:e2}
			 | ""("" Condiciones 'cs' "")"" {cs};

EqExpression ::= IntegerSubExpression 'e1' EqOp 'op' IntegerSubExpression 'e2' {op new:e1 and:e2}
                   | SuitSubExpression 'e1' EqOp 'op' SuitSubExpression 'e2' {op new:e1 and:e2}
                   | ColorSubExpression 'e1' EqOp 'op' ColorSubExpression 'e2' {op new:e1 and:e2}
                   | TypeSubExpression 'e1' EqOp 'op' TypeSubExpression 'e2' {op new:e1 and:e2.}
                   | Card 'c1' EqOp 'op' Card 'c2' {op new:c1 and:c2};

TypeSubExpression ::= ""tipo"" ""("" Card 'p' "")"" {Sol.Grammar.CardType new:p} | CardType 't' {t}
					| ""anterior"" ""("" TypeSubExpression 't' "")"" {Sol.Grammar.PreviousCardType new:t}
					| ""siguiente"" ""("" TypeSubExpression 't' "")"" {Sol.Grammar.NextCardType new: t};
CardType ::= ""as"" {Sol.Grammar.As new} | Number 'n' {Sol.Grammar.Number new} | ""rey"" {Sol.Grammar.King new} | ""reina"" {Sol.Grammar.Queen new} | ""joker""  
                       {Sol.Grammar.Joker new} | ""zota"" {Sol.Grammar.Ten new};
Number ::=""uno"" {Sol.Grammar.Number new:1} | ""dos"" {Sol.Grammar.Number new:2} | ""tres"" {Sol.Grammar.Number new:3} | ""cuatro"" {Sol.Grammar.Number new:4}
              | ""cinco"" {Sol.Grammar.Number new:5} | ""seis"" {Sol.Grammar.Number new:6} | ""siete"" {Sol.Grammar.Number new:7} | ""ocho"" {Sol.Grammar.Number new:8}
              | ""nueve"" {Sol.Grammar.Number new:9} | ""diez"" {Sol.Grammar.Ten new};

EqOp ::= ""=="" {Sol.Grammar.Comparison} | ""/="" {Sol.Grammar.ComparisonNot};

SuitSubExpression ::= ""palo"" ""("" Card 'card' "")"" {Sol.Grammar.CardSuit new:card} | Suit 's' {s};
Suit ::= ""espada"" {Sol.Grammar.Spade new} | ""oro"" {Sol.Grammar.Gold new} | ""copa"" {Sol.Grammar.Cup new} | ""basto"" {Sol.Grammar.Rough new}
		| ""trebol"" {So.Grammar.Club new} | ""corazon"" {Sol.Grammar.Heart new} | ""pica"" {Sol.Grammar.Spade new} | ""diamante"" {Sol.Grammar.Diamond new};
Card ::= ""tope"" ""("" BasicPile 'p' "")"" {Sol.Grammar.TopPile new:p.}
        | ""siguiente"" ""("" Card 'c' "")"" {Sol.Grammar.PreviousCard new:c}
        | ""anterior"" ""("" Card 'c' "")"" {Sol.Grammar.NextCard new:c};

ColorSubExpression ::= ""color"" ""("" Card 'c' "")"" {Sol.Grammar.CardColorExpression new: c} | ""rojo"" {Sol.Grammar.Red new} | ""negro"" {Sol.Grammar.Black new};

IntegerSubExpression ::= CardsCountInPile 'c' {c}
				 | CardsCountInPiles 'cp' {cp}
				 | &lt;natural&gt; 'n' {n value}
                         | IntegerSubExpression 'e1' ""+"" IntegerSubExpression 'e2' {Sol.Grammar.Plus new: e1 with: e2}
                         | IntegerSubExpression 'e1' ""*"" IntegerSubExpression 'e2' {Sol.Grammar.Mult new: e1 with: e2}
                         | IntegerSubExpression 'e1' ""-"" IntegerSubExpression 'e2' {Sol.Grammar.Minus new: e1 with: e2}
                         | IntegerSubExpression 'e1' ""/"" IntegerSubExpression 'e2' {Sol.Grammar.Div new: e1 with: e2}
                         | ""("" IntegerSubExpression 'e' "")"" {e};
CardsCountInPile ::= ""cantidad"" ""de"" ""cartas"" ""("" BasicPile 'p' "")"" {Sol.Grammar.CardsCountInPile new: 'p'};
CardsCountInPiles ::= ""cantidad"" ""en"" ""("" PilesType 'pt' "")"" {Sol.Grammar.CardsCountInPilesType new: pt};
PilesType ::= ""bases"" {Sol.Grammar.Foundations new} | ""pozos"" {Sol.Grammar.Talons new} | ""pilas"" ""auxiliares"" {Sol.Grammar.WastePiles new}
			| ""mazos"" {Sol.Grammar.AllDecks new};
ComparisonOperator ::=""&gt;"" {Sol.Grammar.Greater} | ""&gt;="" {Sol.Grammar.GreaterE} | ""&lt;"" {Sol.Grammar.Lower} | ""&lt;="" {Sol.Grammar.LowerE};


SpecialRule ::= SpecialRuleType 'tr' "":"" Conditions 'conds' {tr new:conds};
SpecialRuleType ::= ""perder"" {Sol.Grammar.LoseRule} | ""ganar"" {Sol.Grammar.WinRule};


Actions ::= {OrderedCollection new} |  Action 'a' ""."" {a} | Accion 'a' "";"" Actions 'as' {as add:a; yourself};
Action ::= ""mover"" BasicPile 'p1'  ""a"" BasicPile 'p2' {Sol.Grammar.Move new: p1 to:p2.} |
              ""sacar"" ""cartas"" {Sol.Grammar.RemoveCards new} |
              ""deshacer"" {Sol.Grammar.UndoAction new} | ""dar"" ""vuelta"" ""cartas"" {Sol.Grammar.TurnCards new} |""**COMPLETAR******"" {nil};
 

GameStates ::= {OrderedCollection new}  | GameStates "","" State {nil};
State ::= &lt;String&gt; {nil};"</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>SolParser</class-id> <category>generated-tables</category>

<body>reduceTable
	^#(
#(108 4 #reduceActionForSpecification1:)
#(109 1 #reduceFor:)
#(110 2 #reduceActionForStrings1:)
#(111 3 #reduceActionForName1:)
#(112 3 #reduceActionForInit1:)
#(113 0 #reduceActionForRepeat___string_1:)
#(113 2 #reduceActionForRepeat___string_2:)
#(114 5 #reduceActionForDecks1:)
#(115 6 #reduceActionForPlayingPiles1:)
#(116 4 #reduceActionForTalons1:)
#(117 4 #reduceActionForFoundations1:)
#(118 5 #reduceActionForWastePiles1:)
#(119 3 #reduceActionForRules1:)
#(120 1 #reduceActionForDeckType1:)
#(120 1 #reduceActionForDeckType2:)
#(121 1 #reduceActionForWastePilesSpec1:)
#(122 0 #reduceActionForTalonsSpec1:)
#(122 1 #reduceActionForTalonsSpec2:)
#(122 3 #reduceActionForTalonsSpec3:)
#(123 1 #reduceActionForTalonSpec1:)
#(123 7 #reduceActionForTalonSpec2:)
#(124 2 #reduceActionForTurnCards1:)
#(124 2 #reduceActionForTurnCards2:)
#(124 2 #reduceActionForTurnCards3:)
#(125 1 #reduceActionForCircularity1:)
#(125 1 #reduceActionForCircularity2:)
#(126 2 #reduceActionForRepository1:)
#(126 2 #reduceActionForRepository2:)
#(127 1 #reduceActionForCardsInPiles1:)
#(128 8 #reduceActionForCardsInPile1:)
#(128 6 #reduceActionForCardsInPile2:)
#(128 6 #reduceActionForCardsInPile3:)
#(128 7 #reduceActionForCardsInPile4:)
#(129 1 #reduceActionForRepeat_Multiple__CardsInPile1:)
#(129 2 #reduceActionForRepeat_Multiple__CardsInPile2:)
#(130 1 #reduceActionForCardsCount1:)
#(130 3 #reduceActionForCardsCount2:)
#(130 3 #reduceActionForCardsCount3:)
#(130 1 #reduceActionForCardsCount4:)
#(131 1 #reduceActionForNaturalsList1:)
#(132 1 #reduceActionForRepeat_Multiple___natural_1:)
#(132 2 #reduceActionForRepeat_Multiple___natural_2:)
#(133 0 #reduceActionForRulesList1:)
#(133 3 #reduceActionForRulesList2:)
#(134 1 #reduceActionForRule1:)
#(134 1 #reduceActionForRule2:)
#(135 3 #reduceActionForCommonRule1:)
#(136 3 #reduceActionForSpecialRule1:)
#(137 4 #reduceActionForRuleHeader1:)
#(137 3 #reduceActionForRuleHeader2:)
#(138 1 #reduceActionForRuleDescription1:)
#(139 4 #reduceActionForPile1:)
#(139 1 #reduceActionForPile2:)
#(140 1 #reduceActionForBasicPile1:)
#(140 1 #reduceActionForBasicPile2:)
#(140 3 #reduceActionForBasicPile3:)
#(140 2 #reduceActionForBasicPile4:)
#(140 1 #reduceActionForBasicPile5:)
#(141 1 #reduceActionForVariable1:)
#(142 4 #reduceActionForLine1:)
#(143 1 #reduceActionForRepeat_Multiple__Line1:)
#(143 2 #reduceActionForRepeat_Multiple__Line2:)
#(144 3 #reduceActionForConditions1:)
#(144 3 #reduceActionForConditions2:)
#(144 3 #reduceActionForConditions3:)
#(144 4 #reduceActionForConditions4:)
#(144 1 #reduceActionForConditions5:)
#(144 8 #reduceActionForConditions6:)
#(144 8 #reduceActionForConditions7:)
#(144 3 #reduceActionForConditions8:)
#(145 0 #reduceActionForActions1:)
#(145 2 #reduceActionForActions2:)
#(145 3 #reduceActionForActions3:)
#(146 1 #reduceActionForSimpleCondition1:)
#(146 1 #reduceActionForSimpleCondition2:)
#(146 4 #reduceActionForSimpleCondition3:)
#(146 1 #reduceActionForSimpleCondition4:)
#(146 3 #reduceActionForSimpleCondition5:)
#(146 3 #reduceActionForSimpleCondition6:)
#(147 3 #reduceActionForEqExpression1:)
#(147 3 #reduceActionForEqExpression2:)
#(147 3 #reduceActionForEqExpression3:)
#(147 3 #reduceActionForEqExpression4:)
#(147 3 #reduceActionForEqExpression5:)
#(148 1 #reduceActionForIntegerSubExpression1:)
#(148 1 #reduceActionForIntegerSubExpression2:)
#(148 1 #reduceActionForIntegerSubExpression3:)
#(148 3 #reduceActionForIntegerSubExpression4:)
#(148 3 #reduceActionForIntegerSubExpression5:)
#(148 3 #reduceActionForIntegerSubExpression6:)
#(148 3 #reduceActionForIntegerSubExpression7:)
#(148 3 #reduceActionForIntegerSubExpression8:)
#(149 1 #reduceActionForComparisonOperator1:)
#(149 1 #reduceActionForComparisonOperator2:)
#(149 1 #reduceActionForComparisonOperator3:)
#(149 1 #reduceActionForComparisonOperator4:)
#(151 1 #reduceActionForEqOp1:)
#(151 1 #reduceActionForEqOp2:)
#(152 4 #reduceActionForSuitSubExpression1:)
#(152 1 #reduceActionForSuitSubExpression2:)
#(153 4 #reduceActionForColorSubExpression1:)
#(153 1 #reduceActionForColorSubExpression2:)
#(153 1 #reduceActionForColorSubExpression3:)
#(154 4 #reduceActionForTypeSubExpression1:)
#(154 1 #reduceActionForTypeSubExpression2:)
#(154 4 #reduceActionForTypeSubExpression3:)
#(154 4 #reduceActionForTypeSubExpression4:)
#(155 4 #reduceActionForCard1:)
#(155 4 #reduceActionForCard2:)
#(155 4 #reduceActionForCard3:)
#(156 1 #reduceActionForCardType1:)
#(156 1 #reduceActionForCardType2:)
#(156 1 #reduceActionForCardType3:)
#(156 1 #reduceActionForCardType4:)
#(156 1 #reduceActionForCardType5:)
#(156 1 #reduceActionForCardType6:)
#(157 1 #reduceActionForNumber1:)
#(157 1 #reduceActionForNumber2:)
#(157 1 #reduceActionForNumber3:)
#(157 1 #reduceActionForNumber4:)
#(157 1 #reduceActionForNumber5:)
#(157 1 #reduceActionForNumber6:)
#(157 1 #reduceActionForNumber7:)
#(157 1 #reduceActionForNumber8:)
#(157 1 #reduceActionForNumber9:)
#(157 1 #reduceActionForNumber10:)
#(158 1 #reduceActionForSuit1:)
#(158 1 #reduceActionForSuit2:)
#(158 1 #reduceActionForSuit3:)
#(158 1 #reduceActionForSuit4:)
#(158 1 #reduceActionForSuit5:)
#(158 1 #reduceActionForSuit6:)
#(158 1 #reduceActionForSuit7:)
#(158 1 #reduceActionForSuit8:)
#(159 6 #reduceActionForCardsCountInPile1:)
#(160 5 #reduceActionForCardsCountInPiles1:)
#(161 1 #reduceActionForPilesType1:)
#(161 1 #reduceActionForPilesType2:)
#(161 2 #reduceActionForPilesType3:)
#(161 1 #reduceActionForPilesType4:)
#(162 1 #reduceActionForSpecialRuleType1:)
#(162 1 #reduceActionForSpecialRuleType2:)
#(163 4 #reduceActionForAction1:)
#(163 2 #reduceActionForAction2:)
#(163 1 #reduceActionForAction3:)
#(163 3 #reduceActionForAction4:)
#(163 1 #reduceActionForAction5:)
#(165 0 #reduceActionForGameStates1:)
#(165 3 #reduceActionForGameStates2:)
#(166 1 #reduceActionForState1:)
#(169 7 #reduceActionForConfiguration1:)
)</body>

<body>transitionTable
	^#(
#[1 0 9 0 28 0 13 0 108 0 17 0 111]
#[0 0 21 0 29]
#[0 0 0 0 167]
#[1 0 25 0 30 0 29 0 169]
#[1 0 33 0 105 0 37 0 110]
#[0 0 41 0 29]
#[1 0 45 0 3 0 49 0 112]
#[1 0 26 0 30 0 26 0 106 0 53 0 113]
#[0 0 18 0 30]
#[1 0 57 0 31 0 61 0 114]
#[0 0 65 0 29]
#[1 0 69 0 23 0 73 0 119]
#[1 0 14 0 30 0 77 0 106]
#[0 0 81 0 33]
#[1 0 85 0 48 0 89 0 115]
#[1 0 93 0 20 0 97 0 127 0 101 0 128 0 105 0 129]
#[0 0 109 0 29]
#[0 0 6 0 167]
#[0 0 30 0 30 0 106]
#[0 0 113 0 107]
#[0 0 117 0 49]
#[1 0 121 0 52 0 125 0 116]
#[0 0 129 0 4]
#[0 0 22 0 23]
#[0 0 138 0 20 0 23]
#[1 0 93 0 20 0 118 0 23 0 133 0 128]
#[1 0 137 0 24 0 141 0 133 0 174 0 167]
#[1 0 145 0 1 0 149 0 2 0 153 0 120]
#[0 0 157 0 50]
#[0 0 161 0 33]
#[1 0 165 0 6 0 169 0 117]
#[1 0 173 0 6 0 177 0 48 0 181 0 52]
#[0 0 142 0 20 0 23]
#[1 0 185 0 25 0 189 0 26 0 193 0 66 0 197 0 67 0 201 0 134 0 205 0 135 0 209 0 136 0 213 0 137 0 217 0 162]
#[0 0 54 0 167]
#[0 0 58 0 34]
#[0 0 62 0 34]
#[0 0 221 0 34]
#[0 0 225 0 33]
#[1 0 70 0 34 0 229 0 40 0 233 0 107 0 237 0 122 0 241 0 123]
#[0 0 245 0 33]
#[1 0 249 0 48 0 253 0 118]
#[0 1 1 0 33]
#[1 1 5 0 49 1 9 0 51]
#[0 1 13 0 33]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 1 33 0 139 1 37 0 140 1 41 0 141]
#[0 1 45 0 19]
#[0 2 54 0 33]
#[0 2 58 0 33]
#[1 0 137 0 24 1 49 0 133 0 174 0 167]
#[0 0 182 0 24 0 167]
#[0 0 186 0 24 0 167]
#[0 1 53 0 33]
#[0 1 57 0 33]
#[0 0 34 0 48]
#[0 1 61 0 107]
#[0 0 82 0 34 0 47]
#[0 1 65 0 41]
#[0 1 69 0 34]
#[1 0 74 0 34 1 73 0 47]
#[0 1 77 0 107]
#[0 1 81 0 51]
#[0 2 94 0 3]
#[1 1 85 0 5 1 89 0 7 1 93 0 22 1 97 0 107 1 101 0 130 1 105 0 131 1 109 0 132]
#[0 1 113 0 50]
#[0 1 117 0 33]
#[1 1 85 0 5 1 89 0 7 1 93 0 22 1 97 0 107 1 121 0 130 1 105 0 131 1 109 0 132]
#[0 0 218 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[0 0 222 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[1 1 125 0 46 1 129 0 49]
#[0 0 238 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[0 1 133 0 39]
#[1 1 137 0 15 0 214 0 33 0 214 0 39]
#[0 0 234 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[0 1 141 0 14]
#[0 0 178 0 167]
#[1 1 145 0 98 1 149 0 138 1 153 0 142 1 157 0 143]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 2 65 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[0 2 117 0 34]
#[1 2 121 0 21 2 125 0 42 2 129 0 44 2 133 0 124]
#[0 0 42 0 6]
#[1 0 70 0 34 0 229 0 40 0 233 0 107 2 137 0 122 0 241 0 123]
#[0 2 141 0 34]
#[0 2 145 0 33]
#[0 0 146 0 34]
#[0 2 149 0 8]
#[0 2 153 0 8]
#[0 0 166 0 34 0 107]
#[0 2 157 0 34]
#[0 0 158 0 34]
#[1 0 162 0 34 2 161 0 107]
#[0 2 165 0 33]
#[1 1 85 0 5 1 89 0 7 1 93 0 22 1 97 0 107 2 169 0 130 1 105 0 131 1 109 0 132]
#[0 2 173 0 34]
#[0 0 230 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[0 2 177 0 50]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 2 181 0 139 1 37 0 140 1 41 0 141]
#[1 1 29 0 106 2 185 0 141]
#[0 0 202 0 33]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 2 189 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[0 0 190 0 24 0 167]
#[0 0 246 0 24 0 98 0 167]
#[1 0 206 0 24 1 145 0 98 2 193 0 142 0 206 0 167]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 2 197 0 144 2 69 0 146 2 73 0 147 2 201 0 148 2 205 0 150 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[0 1 222 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 218 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 14 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 18 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 22 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 26 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 209 0 15]
#[0 2 10 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 213 0 15]
#[0 1 154 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 217 0 15]
#[0 1 254 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 2 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 6 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 250 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 158 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[1 2 221 0 4 2 225 0 49]
#[0 1 42 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 46 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 2 229 0 15]
#[0 2 233 0 15]
#[0 2 237 0 15]
#[0 2 241 0 15]
#[0 2 245 0 15]
#[0 1 190 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 249 0 15]
#[0 2 253 0 15]
#[0 1 230 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 234 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 238 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 242 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 246 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 226 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 198 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 202 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 206 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 210 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 214 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 94 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[1 0 194 0 24 3 1 0 27 3 5 0 32 3 9 0 39 0 194 0 167]
#[0 1 14 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 54 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[1 3 13 0 35 3 17 0 36 3 21 0 37 3 25 0 38 3 29 0 61 3 33 0 71 3 37 0 73 3 41 0 76 3 45 0 77 3 49 0 78 3 53 0 149 3 57 0 151]
#[1 3 29 0 61 3 37 0 73 3 61 0 151]
#[1 3 29 0 61 3 37 0 73 3 65 0 151]
#[1 3 29 0 61 3 37 0 73 3 69 0 151]
#[1 3 29 0 61 3 37 0 73 3 73 0 151]
#[0 1 166 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 194 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 146 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 86 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[0 1 90 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[0 0 38 0 52]
#[0 3 77 0 20]
#[0 3 81 0 43]
#[0 3 85 0 20]
#[0 3 89 0 41]
#[0 0 78 0 34]
#[0 0 46 0 48]
#[1 3 93 0 107 3 97 0 121]
#[0 3 101 0 107]
#[0 3 105 0 107]
#[0 0 126 0 20 0 23]
#[0 0 170 0 34 0 107]
#[1 1 85 0 5 1 89 0 7 1 93 0 22 1 97 0 107 3 109 0 130 1 105 0 131 1 109 0 132]
#[0 3 113 0 34]
#[0 0 130 0 20 0 23]
#[0 0 226 0 8 0 15 0 16 0 33 0 34 0 39 0 106]
#[0 0 198 0 33]
#[0 3 117 0 16]
#[1 3 1 0 27 3 5 0 32 3 9 0 39 3 121 0 87]
#[0 0 250 0 24 0 98 0 167]
#[1 3 125 0 16 3 1 0 27 3 5 0 32 3 9 0 39]
#[1 3 129 0 16 3 13 0 35 3 17 0 36 3 21 0 37 3 25 0 38 3 29 0 61 3 33 0 71 3 37 0 73 3 41 0 76 3 45 0 77 3 49 0 78 3 53 0 149 3 57 0 151]
#[0 3 133 0 16]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 3 137 0 140 1 41 0 141]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 3 149 0 155]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 3 153 0 155]
#[0 3 157 0 15]
#[0 3 161 0 20]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 3 165 0 140 1 41 0 141]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 3 169 0 155]
#[1 1 165 0 21 1 169 0 44 1 189 0 57 1 221 0 72 1 245 0 82 1 249 0 83 2 1 0 85 2 5 0 86 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 3 173 0 154 3 177 0 155 2 97 0 156 2 101 0 157]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 3 181 0 140 1 41 0 141]
#[1 1 165 0 21 1 169 0 44 1 189 0 57 1 221 0 72 1 245 0 82 1 249 0 83 2 1 0 85 2 5 0 86 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 3 185 0 154 3 189 0 155 2 97 0 156 2 101 0 157]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 3 193 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 3 197 0 140 1 41 0 141]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 3 201 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 3 205 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 3 209 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 217 0 148 2 109 0 159 2 113 0 160]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 221 0 148 2 109 0 159 2 113 0 160]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 225 0 148 2 109 0 159 2 113 0 160]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 229 0 148 2 109 0 159 2 113 0 160]
#[0 1 138 0 15 0 21 0 44 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 62 0 63 0 64 0 65 0 72 0 74 0 75 0 82 0 83 0 85 0 86 0 92 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 101 0 102 0 103 0 107]
#[0 1 130 0 15 0 75 0 107]
#[0 1 134 0 15 0 21 0 44 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 62 0 63 0 64 0 65 0 72 0 74 0 75 0 82 0 83 0 85 0 86 0 92 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 101 0 102 0 103 0 107]
#[0 1 118 0 15 0 75 0 107]
#[0 1 122 0 15 0 75 0 107]
#[0 1 126 0 15 0 75 0 107]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 233 0 148 2 109 0 159 2 113 0 160]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 3 237 0 148 2 109 0 159 2 113 0 160]
#[1 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 193 0 58 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 3 241 0 152 2 105 0 158]
#[1 1 197 0 59 1 201 0 60 1 225 0 74 3 245 0 153]
#[1 1 165 0 21 1 169 0 44 1 221 0 72 1 245 0 82 3 249 0 83 3 253 0 85 2 5 0 86 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 4 1 0 154 2 97 0 156 2 101 0 157]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 4 5 0 155]
#[0 0 98 0 41]
#[0 0 90 0 41]
#[0 0 94 0 41]
#[1 4 9 0 9 4 13 0 10 4 17 0 125]
#[0 0 66 0 34]
#[0 4 21 0 34]
#[0 0 150 0 34]
#[0 0 154 0 34]
#[0 4 25 0 34]
#[0 0 134 0 20 0 23]
#[0 0 210 0 33 0 39]
#[1 1 30 0 24 4 29 0 25 4 33 0 26 4 37 0 45 4 41 0 68 4 45 0 69 1 30 0 98 4 49 0 145 4 53 0 163 4 57 0 164 1 30 0 167]
#[0 1 26 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 114 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[0 1 62 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 4 61 0 16]
#[0 4 65 0 15]
#[0 4 69 0 15]
#[0 4 73 0 16]
#[0 4 77 0 16]
#[1 4 81 0 6 4 85 0 31 4 89 0 48 4 93 0 52 4 97 0 161]
#[0 4 101 0 15]
#[0 4 105 0 16]
#[0 4 109 0 16]
#[0 4 113 0 16]
#[0 4 117 0 16]
#[1 1 29 0 106 4 121 0 141]
#[0 4 125 0 16]
#[0 4 129 0 16]
#[1 4 133 0 16 3 1 0 27 3 5 0 32 3 9 0 39]
#[1 1 29 0 106 4 137 0 141]
#[0 1 2 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 0 254 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[1 1 6 0 16 1 6 0 24 3 1 0 27 3 5 0 32 1 6 0 39 1 6 0 87 1 6 0 91 1 6 0 167]
#[1 3 213 0 15 1 229 0 75 2 61 0 107 4 141 0 148 2 109 0 159 2 113 0 160]
#[1 1 98 0 16 1 98 0 24 1 98 0 27 1 98 0 32 1 98 0 35 1 98 0 36 3 21 0 37 3 25 0 38 1 98 0 39 1 98 0 61 1 98 0 71 1 98 0 73 1 98 0 76 1 98 0 77 1 98 0 78 1 98 0 87 1 98 0 91 1 98 0 167]
#[1 1 106 0 16 1 106 0 24 1 106 0 27 1 106 0 32 1 106 0 35 1 106 0 36 3 21 0 37 3 25 0 38 1 106 0 39 1 106 0 61 1 106 0 71 1 106 0 73 1 106 0 76 1 106 0 77 1 106 0 78 1 106 0 87 1 106 0 91 1 106 0 167]
#[0 1 102 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[0 1 110 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[1 1 58 0 16 1 58 0 24 1 58 0 27 1 58 0 32 3 13 0 35 3 17 0 36 3 21 0 37 3 25 0 38 1 58 0 39 1 58 0 87 1 58 0 91 1 58 0 167]
#[1 1 66 0 16 1 66 0 24 1 66 0 27 1 66 0 32 3 13 0 35 3 17 0 36 3 21 0 37 3 25 0 38 1 66 0 39 1 66 0 87 1 66 0 91 1 66 0 167]
#[0 1 70 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 74 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 4 145 0 15]
#[0 4 149 0 15]
#[0 1 78 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 82 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 0 102 0 41]
#[0 0 106 0 41]
#[0 4 153 0 41]
#[0 0 50 0 3]
#[0 0 122 0 20 0 23]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 4 157 0 140 1 41 0 141]
#[0 4 161 0 20]
#[0 2 78 0 34]
#[0 2 70 0 34]
#[0 4 165 0 70]
#[0 0 242 0 24 0 98 0 167]
#[0 4 169 0 34]
#[0 4 173 0 47]
#[0 1 178 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 3 177 0 155]
#[1 1 189 0 57 3 141 0 83 3 145 0 85 3 189 0 155]
#[0 1 150 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 142 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 2 38 0 16]
#[0 2 50 0 16]
#[0 4 177 0 51]
#[0 2 42 0 16]
#[0 4 181 0 16]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 4 185 0 140 1 41 0 141]
#[0 1 50 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 162 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 170 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 186 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 4 189 0 16]
#[0 1 174 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 182 0 16 0 24 0 27 0 32 0 39 0 61 0 73 0 87 0 91 0 167]
#[0 1 10 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 4 193 0 16]
#[1 3 129 0 16 3 13 0 35 3 17 0 36 3 21 0 37 3 25 0 38]
#[1 1 165 0 21 1 169 0 44 1 221 0 72 1 245 0 82 3 249 0 83 3 253 0 85 2 5 0 86 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 3 173 0 154 2 97 0 156 2 101 0 157]
#[1 1 165 0 21 1 169 0 44 1 221 0 72 1 245 0 82 3 249 0 83 3 253 0 85 2 5 0 86 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 3 185 0 154 2 97 0 156 2 101 0 157]
#[1 4 197 0 11 4 201 0 13 4 205 0 126]
#[0 4 209 0 8]
#[0 2 66 0 34]
#[0 4 213 0 20]
#[0 1 34 0 24 0 98 0 167]
#[1 1 30 0 24 4 29 0 25 4 33 0 26 4 37 0 45 4 41 0 68 4 45 0 69 1 30 0 98 4 217 0 145 4 53 0 163 4 57 0 164 1 30 0 167]
#[0 2 46 0 16]
#[0 2 34 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[0 4 221 0 16]
#[0 4 225 0 90]
#[0 4 229 0 90]
#[0 4 233 0 12]
#[0 4 237 0 12]
#[0 0 86 0 34 0 47]
#[1 1 17 0 14 1 21 0 17 1 25 0 18 1 29 0 106 4 241 0 140 1 41 0 141]
#[0 2 74 0 34]
#[0 1 38 0 24 0 98 0 167]
#[0 2 30 0 16 0 24 0 27 0 32 0 35 0 36 0 37 0 38 0 39 0 61 0 71 0 73 0 76 0 77 0 78 0 87 0 91 0 167]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 4 245 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[1 1 161 0 15 1 165 0 21 1 169 0 44 1 173 0 53 1 177 0 54 1 181 0 55 1 185 0 56 1 189 0 57 1 193 0 58 1 197 0 59 1 201 0 60 1 205 0 62 1 209 0 63 1 213 0 64 1 217 0 65 1 221 0 72 1 225 0 74 1 229 0 75 1 233 0 79 1 237 0 80 1 241 0 81 1 245 0 82 1 249 0 83 1 253 0 84 2 1 0 85 2 5 0 86 2 9 0 88 2 13 0 89 2 17 0 92 2 21 0 93 2 25 0 94 2 29 0 95 2 33 0 96 2 37 0 97 2 41 0 99 2 45 0 100 2 49 0 101 2 53 0 102 2 57 0 103 2 61 0 107 4 249 0 144 2 69 0 146 2 73 0 147 2 77 0 148 2 81 0 152 2 85 0 153 2 89 0 154 2 93 0 155 2 97 0 156 2 101 0 157 2 105 0 158 2 109 0 159 2 113 0 160]
#[0 0 110 0 34 0 47]
#[0 0 114 0 34 0 47]
#[0 2 62 0 34]
#[1 3 1 0 27 3 5 0 32 3 9 0 39 4 253 0 91]
#[1 3 1 0 27 3 5 0 32 3 9 0 39 5 1 0 91]
#[0 1 22 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
#[0 1 18 0 16 0 24 0 27 0 32 0 39 0 87 0 91 0 167]
)</body>
</methods>

<methods>
<class-id>SolParser</class-id> <category>generated-reduction actions</category>

<body>reduceActionForAction1: nodes 
	^Sol.Grammar.Move new: (nodes at: 2) to: (nodes at: 4)</body>

<body>reduceActionForAction2: nodes 
	^Sol.Grammar.RemoveCards new</body>

<body>reduceActionForAction3: nodes 
	^Sol.Grammar.UndoAction new</body>

<body>reduceActionForAction4: nodes 
	^Sol.Grammar.TurnCards new</body>

<body>reduceActionForAction5: nodes 
	^nil</body>

<body>reduceActionForActions1: nodes 
	^OrderedCollection new</body>

<body>reduceActionForActions2: nodes 
	^nodes at: 1</body>

<body>reduceActionForActions3: nodes 
	^(nodes at: 3)
		add: (nodes at: 1);
		yourself</body>

<body>reduceActionForBasicPile1: nodes 
	^Sol.Grammar.Talon new</body>

<body>reduceActionForBasicPile2: nodes 
	^Sol.Grammar.Foundation new</body>

<body>reduceActionForBasicPile3: nodes 
	^Sol.Grammar.PlayingPile new</body>

<body>reduceActionForBasicPile4: nodes 
	^Sol.Grammar.WastePile new</body>

<body>reduceActionForBasicPile5: nodes 
	^nodes at: 1</body>

<body>reduceActionForCard1: nodes 
	^Sol.Grammar.TopPile new: (nodes at: 3)</body>

<body>reduceActionForCard2: nodes 
	^Sol.Grammar.PreviousCard new: (nodes at: 3)</body>

<body>reduceActionForCard3: nodes 
	^Sol.Grammar.NextCard new: (nodes at: 3)</body>

<body>reduceActionForCardsCount1: nodes 
	^Sol.Grammar.InitRest new</body>

<body>reduceActionForCardsCount2: nodes 
	^Sol.Grammar.InitAll new: (nodes at: 3) value</body>

<body>reduceActionForCardsCount3: nodes 
	^Sol.Grammar.InitAll new: (nodes at: 3) value</body>

<body>reduceActionForCardsCount4: nodes 
	^Sol.Grammar.ListInitValues new: (nodes at: 1)</body>

<body>reduceActionForCardsCountInPile1: nodes 
	^Sol.Grammar.CardsCountInPile new: 'p'</body>

<body>reduceActionForCardsCountInPiles1: nodes 
	^Sol.Grammar.CardsCountInPilesType new: (nodes at: 4)</body>

<body>reduceActionForCardsInPile1: nodes 
	^Sol.Grammar.PlayingPileInitCount new: (nodes at: 7)</body>

<body>reduceActionForCardsInPile2: nodes 
	^Sol.Grammar.FoundationsInitCount new: (nodes at: 5)</body>

<body>reduceActionForCardsInPile3: nodes 
	^Sol.Grammar.TalonsInitCount new: (nodes at: 5)</body>

<body>reduceActionForCardsInPile4: nodes 
	^Sol.Grammar.WastePileInitCount new: (nodes at: 6)</body>

<body>reduceActionForCardsInPiles1: nodes 
	^nodes at: 1</body>

<body>reduceActionForCardType1: nodes 
	^Sol.Grammar.As new</body>

<body>reduceActionForCardType2: nodes 
	^Sol.Grammar.Number new</body>

<body>reduceActionForCardType3: nodes 
	^Sol.Grammar.King new</body>

<body>reduceActionForCardType4: nodes 
	^Sol.Grammar.Queen new</body>

<body>reduceActionForCardType5: nodes 
	^Sol.Grammar.Joker new</body>

<body>reduceActionForCardType6: nodes 
	^Sol.Grammar.Ten new</body>

<body>reduceActionForCircularity1: nodes 
	^true</body>

<body>reduceActionForCircularity2: nodes 
	^false</body>

<body>reduceActionForColorSubExpression1: nodes 
	^Sol.Grammar.CardColorExpression new: (nodes at: 3)</body>

<body>reduceActionForColorSubExpression2: nodes 
	^Sol.Grammar.Red new</body>

<body>reduceActionForColorSubExpression3: nodes 
	^Sol.Grammar.Black new</body>

<body>reduceActionForCommonRule1: nodes 
	^Sol.Grammar.CommonRule new: (nodes at: 1) description: (nodes at: 3)</body>

<body>reduceActionForComparisonOperator1: nodes 
	^Sol.Grammar.Greater</body>

<body>reduceActionForComparisonOperator2: nodes 
	^Sol.Grammar.GreaterE</body>

<body>reduceActionForComparisonOperator3: nodes 
	^Sol.Grammar.Lower</body>

<body>reduceActionForComparisonOperator4: nodes 
	^Sol.Grammar.LowerE</body>

<body>reduceActionForConditions1: nodes 
	^Sol.Grammar.And new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForConditions2: nodes 
	^Sol.Grammar.Or new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForConditions3: nodes 
	^Sol.Grammar.Implies new: (nodes at: 3) with: cond2</body>

<body>reduceActionForConditions4: nodes 
	^Sol.Grammar.Not new: (nodes at: 3)</body>

<body>reduceActionForConditions5: nodes 
	^nodes at: 1</body>

<body>reduceActionForConditions6: nodes 
	^Sol.Grammar.AndForEach 
		new: (nodes at: 3)
		using: (nodes at: 4)
		check: (nodes at: 7)</body>

<body>reduceActionForConditions7: nodes 
	^Sol.Grammar.OrForEach 
		new: (nodes at: 3)
		using: (nodes at: 4)
		check: (nodes at: 7)</body>

<body>reduceActionForConditions8: nodes 
	^nodes at: 2</body>

<body>reduceActionForConfiguration1: nodes 
	^Sol.Grammar.Configuration 
		new: (nodes at: 3)
		wastePiles: (nodes at: 7)
		talons: (nodes at: 5)
		foundations: (nodes at: 6)
		playingPiles: (nodes at: 4)</body>

<body>reduceActionForDecks1: nodes 
	^Sol.Grammar.Decks new: (nodes at: 3) value type: (nodes at: 4)</body>

<body>reduceActionForDeckType1: nodes 
	^Sol.Grammar.SpanishDeck new</body>

<body>reduceActionForDeckType2: nodes 
	^Sol.Grammar.PokerDeck new</body>

<body>reduceActionForEqExpression1: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForEqExpression2: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForEqExpression3: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForEqExpression4: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForEqExpression5: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForEqOp1: nodes 
	^Sol.Grammar.Comparison</body>

<body>reduceActionForEqOp2: nodes 
	^Sol.Grammar.ComparisonNot</body>

<body>reduceActionForFoundations1: nodes 
	^Sol.Grammar.FoundationSpec new: (nodes at: 3) value</body>

<body>reduceActionForGameStates1: nodes 
	^OrderedCollection new</body>

<body>reduceActionForGameStates2: nodes 
	^nil</body>

<body>reduceActionForInit1: nodes 
	^Sol.Grammar.Init new: (nodes at: 3)</body>

<body>reduceActionForIntegerSubExpression1: nodes 
	^nodes at: 1</body>

<body>reduceActionForIntegerSubExpression2: nodes 
	^nodes at: 1</body>

<body>reduceActionForIntegerSubExpression3: nodes 
	^(nodes at: 1) value</body>

<body>reduceActionForIntegerSubExpression4: nodes 
	^Sol.Grammar.Plus new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForIntegerSubExpression5: nodes 
	^Sol.Grammar.Mult new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForIntegerSubExpression6: nodes 
	^Sol.Grammar.Minus new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForIntegerSubExpression7: nodes 
	^Sol.Grammar.Div new: (nodes at: 1) with: (nodes at: 3)</body>

<body>reduceActionForIntegerSubExpression8: nodes 
	^nodes at: 2</body>

<body>reduceActionForLine1: nodes 
	^Sol.Grammar.DescriptionLine new: (nodes at: 2) actions: (nodes at: 4)</body>

<body>reduceActionForName1: nodes 
	^nodes at: 3</body>

<body>reduceActionForNaturalsList1: nodes 
	^(nodes at: 1) collect: [:n | n value asNumber]</body>

<body>reduceActionForNumber10: nodes 
	^Sol.Grammar.Ten new</body>

<body>reduceActionForNumber1: nodes 
	^Sol.Grammar.Number new: 1</body>

<body>reduceActionForNumber2: nodes 
	^Sol.Grammar.Number new: 2</body>

<body>reduceActionForNumber3: nodes 
	^Sol.Grammar.Number new: 3</body>

<body>reduceActionForNumber4: nodes 
	^Sol.Grammar.Number new: 4</body>

<body>reduceActionForNumber5: nodes 
	^Sol.Grammar.Number new: 5</body>

<body>reduceActionForNumber6: nodes 
	^Sol.Grammar.Number new: 6</body>

<body>reduceActionForNumber7: nodes 
	^Sol.Grammar.Number new: 7</body>

<body>reduceActionForNumber8: nodes 
	^Sol.Grammar.Number new: 8</body>

<body>reduceActionForNumber9: nodes 
	^Sol.Grammar.Number new: 9</body>

<body>reduceActionForPile1: nodes 
	^Sol.Grammar.Pile_Variable new: (nodes at: 1) variable: (nodes at: 3)</body>

<body>reduceActionForPile2: nodes 
	^nodes at: 1</body>

<body>reduceActionForPilesType1: nodes 
	^Sol.Grammar.Foundations new</body>

<body>reduceActionForPilesType2: nodes 
	^Sol.Grammar.Talons new</body>

<body>reduceActionForPilesType3: nodes 
	^Sol.Grammar.WastePiles new</body>

<body>reduceActionForPilesType4: nodes 
	^Sol.Grammar.AllDecks new</body>

<body>reduceActionForPlayingPiles1: nodes 
	^Sol.Grammar.PlayingPilesSpec new: (nodes at: 5) value</body>

<body>reduceActionForRepeat_Multiple__CardsInPile1: nodes 
	^OrderedCollection with: (nodes at: 1)</body>

<body>reduceActionForRepeat_Multiple__CardsInPile2: nodes 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself</body>

<body>reduceActionForRepeat_Multiple__Line1: nodes 
	^OrderedCollection with: (nodes at: 1)</body>

<body>reduceActionForRepeat_Multiple__Line2: nodes 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself</body>

<body>reduceActionForRepeat_Multiple___natural_1: nodes 
	^OrderedCollection with: (nodes at: 1)</body>

<body>reduceActionForRepeat_Multiple___natural_2: nodes 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself</body>

<body>reduceActionForRepeat___string_1: nodes 
	^OrderedCollection new</body>

<body>reduceActionForRepeat___string_2: nodes 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself</body>

<body>reduceActionForRepository1: nodes 
	^true</body>

<body>reduceActionForRepository2: nodes 
	^false</body>

<body>reduceActionForRule1: nodes 
	^nodes at: 1</body>

<body>reduceActionForRule2: nodes 
	^nodes at: 1</body>

<body>reduceActionForRuleDescription1: nodes 
	^nodes at: 1</body>

<body>reduceActionForRuleHeader1: nodes 
	^Sol.Grammar.MoveHeader new: (nodes at: 2) target: (nodes at: 4)</body>

<body>reduceActionForRuleHeader2: nodes 
	^Sol.Grammar.RemoveFromTalonHeader new</body>

<body>reduceActionForRules1: nodes 
	^Sol.Grammar.Rules new: (nodes at: 3)</body>

<body>reduceActionForRulesList1: nodes 
	^OrderedCollection new</body>

<body>reduceActionForRulesList2: nodes 
	^(nodes at: 3)
		add: (nodes at: 2);
		yourself</body>

<body>reduceActionForSimpleCondition1: nodes 
	^Sol.Grammar.True new</body>

<body>reduceActionForSimpleCondition2: nodes 
	^Sol.Grammar.False new</body>

<body>reduceActionForSimpleCondition3: nodes 
	^Sol.Grammar.EmptyPile new: (nodes at: 3)</body>

<body>reduceActionForSimpleCondition4: nodes 
	^nodes at: 1</body>

<body>reduceActionForSimpleCondition5: nodes 
	^(nodes at: 2) new: (nodes at: 1) and: (nodes at: 3)</body>

<body>reduceActionForSimpleCondition6: nodes 
	^nodes at: 2</body>

<body>reduceActionForSpecialRule1: nodes 
	^(nodes at: 1) new: (nodes at: 3)</body>

<body>reduceActionForSpecialRuleType1: nodes 
	^Sol.Grammar.LoseRule</body>

<body>reduceActionForSpecialRuleType2: nodes 
	^Sol.Grammar.WinRule</body>

<body>reduceActionForSpecification1: nodes 
	^Sol.Grammar.GameSpecification 
		new: (nodes at: 1)
		init: (nodes at: 3)
		configuration: (nodes at: 2)
		rules: (nodes at: 4)</body>

<body>reduceActionForState1: nodes 
	^nil</body>

<body>reduceActionForStrings1: nodes 
	^(nodes at: 1) value 
		, ((nodes at: 2) inject: '' into: [:a :b | a , '_' , b value])</body>

<body>reduceActionForSuit1: nodes 
	^Sol.Grammar.Spade new</body>

<body>reduceActionForSuit2: nodes 
	^Sol.Grammar.Gold new</body>

<body>reduceActionForSuit3: nodes 
	^Sol.Grammar.Cup new</body>

<body>reduceActionForSuit4: nodes 
	^Sol.Grammar.Rough new</body>

<body>reduceActionForSuit5: nodes 
	^So.Grammar.Club new</body>

<body>reduceActionForSuit6: nodes 
	^Sol.Grammar.Heart new</body>

<body>reduceActionForSuit7: nodes 
	^Sol.Grammar.Spade new</body>

<body>reduceActionForSuit8: nodes 
	^Sol.Grammar.Diamond new</body>

<body>reduceActionForSuitSubExpression1: nodes 
	^Sol.Grammar.CardSuit new: (nodes at: 3)</body>

<body>reduceActionForSuitSubExpression2: nodes 
	^nodes at: 1</body>

<body>reduceActionForTalons1: nodes 
	^Sol.Grammar.Talons new: (nodes at: 3)</body>

<body>reduceActionForTalonSpec1: nodes 
	^Sol.Grammar.NoTalon new</body>

<body>reduceActionForTalonSpec2: nodes 
	^Sol.Grammar.TalonSpec 
		new: (nodes at: 1) value
		turn: (nodes at: 3)
		circular: (nodes at: 5)
		repository: (nodes at: 7)</body>

<body>reduceActionForTalonsSpec1: nodes 
	^OrderedCollection new</body>

<body>reduceActionForTalonsSpec2: nodes 
	^OrderedCollection with: (nodes at: 1)</body>

<body>reduceActionForTalonsSpec3: nodes 
	^(nodes at: 3)
		add: (nodes at: 1);
		yourself</body>

<body>reduceActionForTurnCards1: nodes 
	^1</body>

<body>reduceActionForTurnCards2: nodes 
	^2</body>

<body>reduceActionForTurnCards3: nodes 
	^3</body>

<body>reduceActionForTypeSubExpression1: nodes 
	^Sol.Grammar.CardType new: (nodes at: 3)</body>

<body>reduceActionForTypeSubExpression2: nodes 
	^nodes at: 1</body>

<body>reduceActionForTypeSubExpression3: nodes 
	^Sol.Grammar.PreviousCardType new: (nodes at: 3)</body>

<body>reduceActionForTypeSubExpression4: nodes 
	^Sol.Grammar.NextCardType new: (nodes at: 3)</body>

<body>reduceActionForVariable1: nodes 
	^Sol.Grammar.Variable new: (nodes at: 1) value</body>

<body>reduceActionForWastePiles1: nodes 
	^nodes at: 4</body>

<body>reduceActionForWastePilesSpec1: nodes 
	^(nodes at: 1) value = 0 
		ifTrue: [^Sol.Grammar.NoWastePiles new]
		ifFalse: [^Sol.Grammar.WastePilesSpec new: (nodes at: 1) value]</body>
</methods>
<new-page/>


<class>
<name>SolScanner</name>
<environment>Smalltalk</environment>
<super>Refactory.SmaCC.SmaCCScanner</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>SmaCC Generated Scanner/Parser</category>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>SolScanner class</class-id> <category>generated-initialization</category>

<body>initializeKeywordMap
	keywordMap := Dictionary new.
	#(#(105 'Configuracion' 30) #(105 'F' 80) #(105 'Inicio' 3) #(105 'Nombre' 28) #(105 'Reglas' 23) #(105 'V' 79) #(106 'a' 8) #(106 'anterior' 83) #(106 'as' 86) #(106 'auxiliar' 46) #(106 'auxiliares' 51) #(106 'base' 17) #(106 'bases' 6) #(106 'basto' 58) #(106 'cantidad' 75) #(106 'carta' 43) #(106 'cartas' 20) #(106 'cinco' 92) #(106 'circular' 9) #(106 'color' 59) #(106 'con' 11) #(106 'copa' 65) #(106 'corazon' 54) #(106 'cuatro' 97) #(106 'dar' 69) #(106 'de' 49) #(106 'del' 19) #(106 'deshacer' 68) #(106 'diamante' 56) #(106 'diez' 72) #(106 'dos' 44) #(106 'en' 4) #(106 'entonces' 87) #(106 'espada' 63) #(106 'ganar' 67) #(106 'joker' 101) #(106 'juego' 50) #(106 'mazos' 31) #(106 'mover' 25) #(106 'negro' 74) #(106 'nueve' 96) #(106 'ocho' 95) #(106 'oro' 64) #(106 'palo' 62) #(106 'perder' 66) #(106 'pica' 55) #(106 'pila' 18) #(106 'pilas' 48) #(106 'poker' 2) #(106 'pozo' 14) #(106 'pozos' 52) #(106 'reina' 100) #(106 'repositorio' 12) #(106 'resto' 5) #(106 'rey' 99) #(106 'rojo' 60) #(106 'sacar' 26) #(106 'seis' 93) #(106 'si' 98) #(106 'siete' 94) #(106 'siguiente' 85) #(106 'sin' 13) #(106 'tipo' 82) #(106 'todas' 22) #(106 'todos' 7) #(106 'tope' 57) #(106 'trebol' 53) #(106 'tres' 21) #(106 'una' 42) #(106 'uno' 103) #(106 'vacia' 81) #(106 'vuelta' 70) #(106 'zota' 102) #(107 '0' 40)) 
		do: 
			[:each | 
			(keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2)
				put: each last].
	^keywordMap</body>
</methods>

<methods>
<class-id>SolScanner class</class-id> <category>generated-comments</category>

<body>scannerDefinitionComment

	"&lt;whitespace&gt; : \s+;
&lt;eol&gt; : \r | \n | \r\n ;
&lt;line&gt; : \% ;
&lt;String&gt; : [A-Z] \w*;
&lt;string&gt; : [a-z] \w*;
&lt;xstring&gt; : \w+;
&lt;natural&gt; : \d+;"</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>SolScanner</class-id> <category>generated-scanner</category>

<body>scanForToken
	self step.
	(currentCharacter between: $A and: $Z) 
		ifTrue: 
			[
			[self recordMatch: #(105).
			self step.
			currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
					whileTrue.
			^self reportLastMatch].
	((currentCharacter between: $a and: $d) or: 
			[(currentCharacter between: $f and: $m) 
				or: [(currentCharacter between: $p and: $x) or: [currentCharacter == $z]]]) 
		ifTrue: 
			[
			[self recordMatch: #(106).
			self step.
			currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter isDigit 
		ifTrue: 
			[
			[self recordMatch: #(107).
			self step.
			currentCharacter isDigit] 
					whileTrue.
			^self reportLastMatch].
	((currentCharacter between: Character tab and: Character cr) 
		or: [currentCharacter == Character space]) 
			ifTrue: 
				[
				[self recordMatch: #whitespace.
				self step.
				(currentCharacter between: Character tab and: Character cr) 
					or: [currentCharacter == Character space]] 
						whileTrue.
				^self reportLastMatch].
	currentCharacter == $# ifTrue: [^self recordAndReportMatch: #(24)].
	currentCharacter == $&amp; 
		ifTrue: 
			[self step.
			currentCharacter == $&amp; ifTrue: [^self recordAndReportMatch: #(32)].
			^self reportLastMatch].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(15)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(16)].
	currentCharacter == $* 
		ifTrue: 
			[self recordMatch: #(37).
			self step.
			currentCharacter == $* 
				ifTrue: 
					[self step.
					currentCharacter == $C 
						ifTrue: 
							[self step.
							currentCharacter == $O 
								ifTrue: 
									[self step.
									currentCharacter == $M 
										ifTrue: 
											[self step.
											currentCharacter == $P 
												ifTrue: 
													[self step.
													currentCharacter == $L 
														ifTrue: 
															[self step.
															currentCharacter == $E 
																ifTrue: 
																	[self step.
																	currentCharacter == $T 
																		ifTrue: 
																			[self step.
																			currentCharacter == $A 
																				ifTrue: 
																					[self step.
																					currentCharacter == $R 
																						ifTrue: 
																							[self step.
																							currentCharacter == $* 
																								ifTrue: 
																									[self step.
																									currentCharacter == $* 
																										ifTrue: 
																											[self step.
																											currentCharacter == $* 
																												ifTrue: 
																													[self step.
																													currentCharacter == $* 
																														ifTrue: 
																															[self step.
																															currentCharacter == $* 
																																ifTrue: 
																																	[self step.
																																	currentCharacter == $* ifTrue: [^self recordAndReportMatch: #(45)]].
																															^self reportLastMatch]].
																											^self reportLastMatch]].
																							^self reportLastMatch]].
																			^self reportLastMatch]].
															^self reportLastMatch]].
											^self reportLastMatch]].
							^self reportLastMatch]].
			^self reportLastMatch].
	currentCharacter == $+ ifTrue: [^self recordAndReportMatch: #(35)].
	currentCharacter == $, ifTrue: [^self recordAndReportMatch: #(41)].
	currentCharacter == $- ifTrue: [^self recordAndReportMatch: #(36)].
	currentCharacter == $. ifTrue: [^self recordAndReportMatch: #(34)].
	currentCharacter == $/ 
		ifTrue: 
			[self recordMatch: #(38).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(61)].
			^self reportLastMatch].
	currentCharacter == $: ifTrue: [^self recordAndReportMatch: #(33)].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(47)].
	currentCharacter == $&lt; 
		ifTrue: 
			[self recordMatch: #(78).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(71)].
			^self reportLastMatch].
	currentCharacter == $= 
		ifTrue: 
			[self recordMatch: #(29).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(73)].
			currentCharacter == $&gt; ifTrue: [^self recordAndReportMatch: #(39)].
			^self reportLastMatch].
	currentCharacter == $&gt; 
		ifTrue: 
			[self recordMatch: #(76).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(77)].
			^self reportLastMatch].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(90)].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(91)].
	currentCharacter == $e 
		ifTrue: 
			[self recordMatch: #(106).
			self step.
			(currentCharacter isDigit or: 
					[(currentCharacter between: $A and: $Z) or: 
							[currentCharacter == $_ or: 
									[(currentCharacter between: $a and: $r) 
										or: [currentCharacter between: $t and: $z]]]]) 
				ifTrue: 
					[
					[self recordMatch: #(106).
					self step.
					currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $s 
				ifTrue: 
					[self recordMatch: #(106).
					self step.
					(currentCharacter isDigit or: 
							[(currentCharacter between: $A and: $Z) or: 
									[currentCharacter == $_ or: 
											[(currentCharacter between: $a and: $o) 
												or: [currentCharacter between: $q and: $z]]]]) 
						ifTrue: 
							[
							[self recordMatch: #(106).
							self step.
							currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
									whileTrue.
							^self reportLastMatch].
					currentCharacter == $p 
						ifTrue: 
							[self recordMatch: #(106).
							self step.
							(currentCharacter isDigit or: 
									[(currentCharacter between: $A and: $Z) 
										or: [currentCharacter == $_ or: [currentCharacter between: $b and: $z]]]) 
								ifTrue: 
									[
									[self recordMatch: #(106).
									self step.
									currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
											whileTrue.
									^self reportLastMatch].
							currentCharacter == $a 
								ifTrue: 
									[self recordMatch: #(106).
									self step.
									(currentCharacter isAlphaNumeric or: [currentCharacter == $_]) 
										ifTrue: 
											[
											[self recordMatch: #(106).
											self step.
											currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
													whileTrue.
											^self reportLastMatch].
									currentCharacter == $ñ 
										ifTrue: 
											[self step.
											currentCharacter == $o 
												ifTrue: 
													[self step.
													currentCharacter == $l 
														ifTrue: 
															[self step.
															currentCharacter == $e 
																ifTrue: 
																	[self step.
																	currentCharacter == $s ifTrue: [^self recordAndReportMatch: #(1)]].
															^self reportLastMatch]].
											^self reportLastMatch]].
							^self reportLastMatch]].
			^self reportLastMatch].
	currentCharacter == $n 
		ifTrue: 
			[self recordMatch: #(106).
			self step.
			(currentCharacter isDigit or: 
					[(currentCharacter between: $A and: $Z) or: 
							[currentCharacter == $_ or: 
									[(currentCharacter between: $a and: $n) 
										or: [currentCharacter between: $p and: $z]]]]) 
				ifTrue: 
					[
					[self recordMatch: #(106).
					self step.
					currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $o 
				ifTrue: 
					[self recordMatch: #(106).
					self step.
					(currentCharacter isAlphaNumeric or: [currentCharacter == $_]) 
						ifTrue: 
							[
							[self recordMatch: #(106).
							self step.
							currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
									whileTrue.
							^self reportLastMatch].
					currentCharacter == Character space 
						ifTrue: 
							[self step.
							currentCharacter == $c 
								ifTrue: 
									[self step.
									currentCharacter == $i 
										ifTrue: 
											[self step.
											currentCharacter == $r 
												ifTrue: 
													[self step.
													currentCharacter == $c 
														ifTrue: 
															[self step.
															currentCharacter == $u 
																ifTrue: 
																	[self step.
																	currentCharacter == $l 
																		ifTrue: 
																			[self step.
																			currentCharacter == $a 
																				ifTrue: 
																					[self step.
																					currentCharacter == $r ifTrue: [^self recordAndReportMatch: #(10)]].
																			^self reportLastMatch]].
															^self reportLastMatch]].
											^self reportLastMatch]].
							^self reportLastMatch]].
			^self reportLastMatch].
	currentCharacter == $o 
		ifTrue: 
			[self recordMatch: #(106).
			self step.
			(currentCharacter isAlphaNumeric or: [currentCharacter == $_]) 
				ifTrue: 
					[
					[self recordMatch: #(106).
					self step.
					currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $- 
				ifTrue: 
					[self step.
					currentCharacter == $p 
						ifTrue: 
							[self step.
							currentCharacter == $a 
								ifTrue: 
									[self step.
									currentCharacter == $r 
										ifTrue: 
											[self step.
											currentCharacter == $a 
												ifTrue: 
													[self step.
													currentCharacter == $- 
														ifTrue: 
															[self step.
															currentCharacter == $c 
																ifTrue: 
																	[self step.
																	currentCharacter == $a 
																		ifTrue: 
																			[self step.
																			currentCharacter == $d 
																				ifTrue: 
																					[self step.
																					currentCharacter == $a ifTrue: [^self recordAndReportMatch: #(84)]].
																			^self reportLastMatch]].
															^self reportLastMatch]].
											^self reportLastMatch]].
							^self reportLastMatch]].
			^self reportLastMatch].
	currentCharacter == $y 
		ifTrue: 
			[self recordMatch: #(106).
			self step.
			(currentCharacter isAlphaNumeric or: [currentCharacter == $_]) 
				ifTrue: 
					[
					[self recordMatch: #(106).
					self step.
					currentCharacter isAlphaNumeric or: [currentCharacter == $_]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $- 
				ifTrue: 
					[self step.
					currentCharacter == $p 
						ifTrue: 
							[self step.
							currentCharacter == $a 
								ifTrue: 
									[self step.
									currentCharacter == $r 
										ifTrue: 
											[self step.
											currentCharacter == $a 
												ifTrue: 
													[self step.
													currentCharacter == $- 
														ifTrue: 
															[self step.
															currentCharacter == $c 
																ifTrue: 
																	[self step.
																	currentCharacter == $a 
																		ifTrue: 
																			[self step.
																			currentCharacter == $d 
																				ifTrue: 
																					[self step.
																					currentCharacter == $a ifTrue: [^self recordAndReportMatch: #(89)]].
																			^self reportLastMatch]].
															^self reportLastMatch]].
											^self reportLastMatch]].
							^self reportLastMatch]].
			^self reportLastMatch].
	currentCharacter == $| 
		ifTrue: 
			[self step.
			currentCharacter == $| ifTrue: [^self recordAndReportMatch: #(27)].
			^self reportLastMatch].
	currentCharacter == $¬ ifTrue: [^self recordAndReportMatch: #(88)].
	^self reportLastMatch</body>
</methods>

<methods>
<class-id>SolScanner</class-id> <category>generated-tokens</category>

<body>emptySymbolTokenId
	^167</body>

<body>errorTokenId
	^168</body>
</methods>






























</st-source>
