% Base de données pour les recettes.
% Mars 2017

%predicat disponible(ingrédient)
%disponible(eau).
disponible(sucre).
disponible(sel).
disponible(vinaigre).
disponible(huile).
disponible(beurre).
disponible(sachet_de_the).
disponible(cafe).
disponible(chocolat).
disponible(lait).
disponible(farine).
disponible(oeufs).
disponible(pate_a_crepes).
disponible(pates_nouilles).
disponible(laitue).
disponible(pommes_dt).
disponible(oignon).
disponible(tomates).
disponible(creme).
disponible(fromage).	% toutes sortes. Pour une fondue, pour une tartiflette, raclette...
disponible(lardons).	% pour tester pates_a_la_carbonara


%prédicat recette(mets, liste des ingrédients)
recette(expresso, [cafe, eau, sucre ]).
recette(gateau, [lait, farine, oeufs, sucre, beurre ]).
recette(the, [sachet_de_the, eau, sucre ]).
recette(crepes, [pate_a_crepes, sucre, beurre ]).
recette(salade, [laitue, vinaigre, huile,  oignon]).
recette(puree, [lait, pommes_dt, beurre,  sel ]).
recette(frites, [pommes_dt, huile,  sel]).
recette(pates_a_la_carbonara, [pates_nouilles,  oeufs,  lardons, sel, oignon, creme]).
recette(carbona, [pates_nouilles,  oeufs,  lardons,  sel, oignon ]).
recette(pitza, [farine,  oeufs,  lardons,  sel, oignon, tomates]).
recette(tartiflette, [pommes_dt,  lardons,  sel, fromage]).

%peut_preparer

% Vérifie si on peut préparer un mets R en vérifiant si tous les ingrédients nécessaires sont disponibles.
peut_preparer(R) :-
    recette(R, Ingredients),
    tous_disponibles(Ingredients).

% Vérifie si tous les ingrédients d'une liste sont disponibles
tous_disponibles([]). % Condition de base : si la liste est vide, c'est vrai.
tous_disponibles([Tete|Reste]) :- % Décompose la liste en tête et reste
    disponible(Tete), % Vérifie si la tête est disponible
    tous_disponibles(Reste). % Récursion sur le reste


%a_besoin_de

membre(Element, [Element|_]). % Cas de base : Element est la tête de la liste
membre(Element, [_|Reste]) :- % Récursion : on ignore la tête et on continue avec le reste de la liste
    membre(Element, Reste).

a_besoin_de(Recette, Ingredient) :-
    recette(Recette, Liste),
    membre(Ingredient, Liste).



