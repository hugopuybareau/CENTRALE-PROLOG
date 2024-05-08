medaille(Personnes):-
	Personnes = [personne(personne1,_,_,_,_,_),
			 personne(personne2,_,_,_,_,_),
			 personne(personne3,_,_,_,_,_),
			 personne(personne4,_,_,_,_,_),
			 personne(personne5,_,_,_,_,_)],

	Contraintes=
	[
	personne(_,	_,	pierre,	brascass, _, _),
	personne(_,	cinq, _, entorse, _, _),
	personne(_,	_, paul, _,	equitation,	_),
	personne(Paul, _, _, _, equitation,	_),
	personne(_,	_, _, _, sautaperche, cafe),
	personne(_,	_, _, insolation,	_, jus),
	personne(_,	_, _, rhume, decathlon,	_),
	personne(_,	or,	_, _, _, eau),
	personne(The, _, andre,	_, _, the),
	personne(personne3,	_, _, _, escrime, _),
	personne(personne1,	_, _, cocardeoeil, _, _),
	personne(Qua, quatre, _, _,	_, _),
	personne(Lait, _, _, _,	_, lait),
	personne(Bron, bronze, _, _, _,	_),
	personne(Jean,	_, jean, _, _, _),
	personne(Cocard, _,	_, cocardeoeil,	_, _),
	personne(Rolant, _, rolant,	_, _, _),
	personne(_, _, _, _, box, _),
	personne(_,	argent, _, _, _, _)
	],

	droit(Paul,Rolant),
	cote(Lait,Qua),
	cote(The,Bron),
	cote(The,Bron),
	cote(Jean,Cocard),

	ajuste(Contraintes,Personnes).

%definition des contraintes

droit(personne2,personne1).
droit(personne3,personne2).
droit(personne4,personne3).
droit(personne5,personne4).

cote(H1,H2) :- droit(H1,H2).
cote(H1,H2) :- droit(H2,H1).

ajuste([],_).
ajuste([H|T],List) :-
	member(H,List),
	ajuste(T,List).