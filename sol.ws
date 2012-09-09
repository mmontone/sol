"Linux"

ast := SolParserDecorator parseFile: 'tests/SemanticGeneratorTest.txt' with: Sol.ASTGrammarBuilder new.
spec := 'tests/SemanticGeneratorTest.txt' asLogicalFileSpecification readStream contents.
sg := Sol.CodeGeneration.SolitaireGenerator on: ast solitaireName: 'generated Golf' spec: spec.
sg run.


Golf play.
Sol.Application.GeneratedGolf.GeneratedGolf play.
Sol.Application.GeneratedGolf.GeneratedGolf displayString.

Sol.GenerationTool open
Sol.Application localBindings do:[:a | a value inspect].


'HOla Mundo' copyWithRegex: '\s+' matchesReplacedWith: ''.

GenerationTool Items := OrderedCollection new