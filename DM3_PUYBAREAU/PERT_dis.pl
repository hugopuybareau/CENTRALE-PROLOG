:- use_module(library(clpfd)).

pert(Taches, StartJ) :-
    Taches = [A, B, C, D, E, F, G, H, I, J],
    Taches ins 0..20, % Définir le domaine des dates de démarrage

    % Contraintes de précédence avec les durées des tâches
    B #>= A + 5,
    C #>= A + 5,
    D #>= A + 5,
    E #>= B + 4,
    F #>= C + 3,
    G #>= C + 3,
    H #>= D + 2,
    I #>= F + 5,
    I #>= G + 4,
    J #>= H + 3,
    J #>= I + 2,

    (   G+4 #=< E; E+1 #=< G),
    (   E+1 #=< F; F+5 #=< E),
    (   F+5 #=< G; G+4 #=< F),

    % Labelliser les variables pour trouver une solution
    labeling([], Taches),

    % J est la dernière tâche, donc sa date de début est la date de début la plus tôt pour terminer toutes les tâches
    StartJ = J.

