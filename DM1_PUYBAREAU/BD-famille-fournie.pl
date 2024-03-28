% kate: hl Prolog;

:- use_module(library(clpfd)). % si besoin

% Essai : permet déchouer si un prédicat n existe pas au lieu de stopper.
:- set_prolog_flag(unknwon, fail).

% Fév 2022, 23, 24 : Famille
%------------------------
% enfant(Enfant, Pere)
%-----------------------
enfant(marie, jean).
enfant(pierre, jean).
enfant(jacques, jean).
enfant(eric,  pierre).
enfant(thomas, pierre).
enfant(vincent,jacques).
enfant(loic,jacques).
enfant(michele,jacques).
enfant(david,thomas).
enfant(christine,thomas).

% 2e série
enfant(alex, sylvie).
enfant(sophie, sylvie).
enfant(olivier, jose).
enfant(valentine, jose).
%enfant(loic, kate). ?? Pas dans l'arbre
%enfant(loic, kevine). ?? Pas dans l'arbre

enfant(alex, jean).
enfant(sophie, jean).

enfant(laure, paul).
enfant(mark, paul).

enfant(yves,pedro).
enfant(luc,yannick).
enfant(brigitte, yannick).

%-------------------------
% enfant(Enfant, Mere)
%-------------------------
enfant(mark, marie).
enfant(laure,marie).
enfant(serge,laure).
%enfant(charlotte,laure). ?? Pas dans l'arbre
enfant(juliette, laure).

enfant(jacques, sylvie).
enfant(marie, sylvie).
enfant(pierre, sylvie).

enfant(loic, helene).
%enfant(helene, helene).??????
enfant(michele, helene).
enfant(vincent, helene).

enfant(olivier, bernadette).
enfant(valentine, bernadette).


enfant(yves,brigitte).
enfant(luc,elisabeth).
enfant(pedro,elisabeth).
enfant(pedro, brigitte).

%--------------------
% epouse(Femme,Mari)
%-----------------------
epouse(sylvie, jean).
epouse(marie, paul).
epouse(helene, jacques).

% 2e série
epouse(bernadette, jose).
epouse(velentine, loic).

epouse(brigitte,pedro).
epouse(elisabeth,yannick).
%-----------------------
% hommes(homme)
% ----------------------
homme(jean).
homme(loic).
homme(paul).
homme(pierre).
homme(jacques).
homme(mark).
homme(thomas).
homme(vincent).
homme(eric).
homme(david).
homme(serge).
homme(jose).
homme(alex).
homme(olivier).

homme(pedro).
homme(yves).
homme(yannick).
homme(luc).



femme(X) :- nonvar(X), not(homme(X)). % syntax équivalent : \+homme(X)

epoux(H,F) :- epouse(F,H).

%enfant(E,M) :- enfant(E,P), epouse(M,P).
% enfant(E,P) :- enfant(E,M), epoux(P,M). %On met ça en note parce que
% ça fait des boucles infinies sur les prédicats de la question 5.

pere(Dad, Enf) :- enfant(Enf, Dad), homme(Dad).
mere(Mam, Enf) :- enfant(Enf, Mam), femme(Mam).
parent(Par, Enf) :- pere(Par, Enf); mere(Par, Enf).
fils(Enf, Par) :- enfant(Enf, Par), homme(Enf).
fille(Enf, Par) :- enfant(Enf, Par), femme(Enf).

frere(F,Enf):- %Un frère c'est si les deux parents sont les mêmes sinon c'est demi frère
    homme(F),
    dif(F,Enf),
    pere(Dad,Enf),
    mere(Mam,Enf),
    pere(Dad,F),
    mere(Mam,F).

soeur(S,Enf) :- %Idem
    femme(S),
    dif(S,Enf),
    pere(Dad,Enf),
    mere(Mam,Enf),
    pere(Dad,S),
    mere(Mam,S).
