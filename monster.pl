/* Part 2 - Knowledge Representation Problem Description */
/* H00361901 */

/* Question 1: */
% basicType(t): to represent the idea that t is a basic type
basicType(ghost).
basicType(psychic).
basicType(fighting).
basicType(normal).
basicType(dark).

% monster(mo,t): to represent the idea that mo is a monster of type t.
monster(annihilape,ghost).
monster(espathra,psychic).
monster(flamigo,fighting).
monster(lechonk,normal).
monster(mabosstiff,dark).

% move(mv,t): to represent the idea that mv is a move of type t.
move(lowKick,fighting).
move(shadowPunch,ghost).
move(rageFist,ghost).
move(bodySlam,normal).

move(psybeam,psychic).
move(quickAttack,normal).
move(shadowBall,ghost).

move(payback,dark).
move(megaKick,normal).
move(closeCombat,fighting).

move(tackle,normal).
move(takeDown,normal).
move(zenHeadbutt,psychic).


move(snarl,dark).
move(lick,ghost).
move(bite,dark).

% monsterMove(mo,mv): to represent the idea that mo has a move mv.

% Annihilape moves
monsterMove(annihilape,lowKick).
monsterMove(annihilape,shadowPunch).
monsterMove(annihilape,rageFist).
monsterMove(annihilape,bodySlam).

% Espathra moves
monsterMove(espathra,psybeam).
monsterMove(espathra,quickAttack).
monsterMove(espathra,lowKick).
monsterMove(espathra,shadowBall).

% Flamigo moves
monsterMove(flamigo,lowKick).
monsterMove(flamigo,payback).
monsterMove(flamigo,megaKick).
monsterMove(flamigo,closeCombat).

% Lechonk moves
monsterMove(lechonk,tackle).
monsterMove(lechonk,takeDown).
monsterMove(lechonk,zenHeadbutt).
monsterMove(lechonk,bodySlam).

% Mabosstiff moves
monsterMove(mabosstiff,snarl).
monsterMove(mabosstiff,lick).
monsterMove(mabosstiff,bite).
monsterMove(mabosstiff,bodySlam).

/* Question 2: */
% Prolog facts of the form typeEffectiveness(e,t1,t2)

% Psychic effectiveness against other types
typeEffectiveness(weak,psychic,psychic).
typeEffectiveness(strong,psychic,fighting).
typeEffectiveness(superweak,psychic,dark).
typeEffectiveness(ordinary,psychic,ghost).
typeEffectiveness(ordinary,psychic,normal).

typeEffectiveness(weak,fighting,psychic).
typeEffectiveness(ordinary,fighting,fighting).
typeEffectiveness(strong,fighting,dark).
typeEffectiveness(superweak,fighting,ghost).
typeEffectiveness(strong,fighting,normal).

typeEffectiveness(strong,dark,psychic).
typeEffectiveness(weak,dark,fighting).
typeEffectiveness(weak,dark,dark).
typeEffectiveness(strong,dark,ghost).
typeEffectiveness(ordinary,dark,normal).

typeEffectiveness(strong,ghost,psychic).
typeEffectiveness(ordinary,ghost,fighting).
typeEffectiveness(weak,ghost,dark).
typeEffectiveness(strong,ghost,ghost).
typeEffectiveness(superweak,ghost,normal).

typeEffectiveness(ordinary,normal,psychic).
typeEffectiveness(ordinary,normal,fighting).
typeEffectiveness(ordinary,normal,dark).
typeEffectiveness(superweak,normal,ghost).
typeEffectiveness(ordinary,normal,normal).

/* Question 3: */
% Strong is more effective than Ordinary
moreEffective(strong, ordinary).

% Ordinary is more effective than Weak
moreEffective(ordinary, weak).

% Weak is more effective than Superweak
moreEffective(weak, superweak).

/* Question 4: */
moreEffectiveThan(E1,E2):- moreEffective(E1,E2).
moreEffectiveThan(E1,E2) :- moreEffective(E1,X), moreEffectiveThan(X,E2).

/* Question 5: */
monsterMoveMatch(T, MO1, MO2, MV) :-
    move(MV, T),
    monsterMove(MO1, MV),
    monsterMove(MO2, MV).

/* Question 6: */
moreEffectiveMoveType(MV1,MV2,T) :- 
move(MV1,MVT1) , 
move(MV2,MVT2) , 
typeEffectiveness(Z,MVT1,T), 
typeEffectiveness(W,MVT2,T), 
moreEffectiveThan(Z,W).

/* Question 7 */
moreEffectiveMove(MO1,MV1,MO2,MV2) :- 
monster(MO1,MOT1) , 
monster(MO2,MOT2) , 
move(MV1,MVT1) , 
move(MV2,MVT2) , 
typeEffectiveness(X,MVT1,MOT2) ,
typeEffectiveness(Y,MVT2,MOT1) ,
moreEffectiveThan(X,Y). 