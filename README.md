# F29AI_KnowledgeRepresentation

## Part 2: Knowledge Representation problem description
A popular fictional monster battling game features a type system that is used to determine the effectiveness of a
monster’s ability to attack or defend against another monster. In this coursework you will write a short Prolog
program to represent knowledge about this system and to answer queries using the resulting knowledge base.
The version of the game we will use includes five monsters: annihilape, espathra, flamigo, lechonk, and
mabosstiff. Each monster can be one of five basic types: psychic, fighting, dark, ghost, and normal.
Each monster has four moves that it can use. Each move is also assigned one of the basic types. The details of
each monster, its type, its moves, and the move types are given in the following table:

E.g., annihilape is a ghost type monster with 4 moves: lowKick (a fighting type move), shadowPunch (a
ghost type move), rageFist (a ghost type move), and bodySlam (a normal type move).
The effectiveness of a monster’s move when used on another monster depends on the move type (of the
monster using the move) and the monster type (of the monster the move is being used on). Certain moves are
strong against certain types of monsters while other moves are weak or superweak against other monster
types. The effectiveness of a move type against a monster type is represented in the following table:
move \ monster psychic fighting dark ghost normal
psychic weak strong superweak ordinary ordinary
fighting weak ordinary strong superweak strong
dark strong weak weak strong ordinary
ghost strong ordinary weak strong superweak
normal ordinary ordinary ordinary superweak ordinary
E.g., a fighting type move is weak against psychic type monsters but a dark type move is strong against
ghost type monsters. Combinations that aren’t strong, weak, or superweak are ordinary.
What to do
Write a Prolog program to represent the knowledge in the monster game according to the following specification:
1. Encode information about the monsters and their moves using Prolog facts of the following form:
− basicType(t): to represent the idea that t is a basic type.
− monster(mo,t): to represent the idea that mo is a monster of type t.
− move(mv,t): to represent the idea that mv is a move of type t.
− monsterMove(mo,mv): to represent the idea that monster mo has a move mv.
2. Encode effectiveness information using Prolog facts of the form typeEffectiveness(e,t1,t2): a
move of type t1 used again monsters of type t2 has effectiveness e.
3. Encode basic effectiveness relationships using Prolog facts of the form moreEffective(e1,e2): e1 is
more effective than e2. You should only encode the strict ordering on effectiveness in this way, i.e.,
strong is more effective than ordinary, ordinary is more effective than weak, and weak is more
effective than superweak.
4. Encode transitive effectiveness information using a Prolog rule of the form
moreEffectiveThan(E1,E2): E1 is more effective than E2. The rule should cover the basic
effectiveness information above but also information not represented by the facts in part 3, e.g., strong
is more effective than weak, ordinary is more effective than superweak, etc. E1 and E2 should be
variables in your rule definition.
5. Define a Prolog rule called monsterMoveMatch(T,MO1,MO2,MV) which represents the idea that
monster MO1 and monster MO2 both have a move MV which has type T. MO1, MO2, MV, and T should be
variables in your rule definition.
6. Define a Prolog rule called moreEffectiveMoveType(MV1,MV2,T) to represent the idea that move
MV1 is more effective than move MV2 against monsters of type T. MV1, MV2, and T should be variables in
your rule definition.
7. Define a Prolog rule called moreEffectiveMove(MO1,MV1,MO2,MV2) to represent the idea that if
monster MO1 performs move MV1 against MO2, and monster MO2 performs move MV2 against MO1, then
MV1 is more effective than MV2. MO1, MV1, MO2, and MV2 should be variables in your rule definition. Note
that the monsters should actually be capable of performing their respective moves.
