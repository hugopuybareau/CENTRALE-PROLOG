:- use_module(library(clpfd)).

emploi_du_temps(Sessions, Salles) :-
    Sessions = [A, B, C, D, E, F, G, H, I, J, K],
    Sessions ins 1..12,  % 12 créneaux sur 2 jours

    % Contraintes de non chevauchement
    maplist(all_different, [
        [A, J],  % Sessions A et J ne peuvent pas être en même temps
        [J, I],  % etc.
        [I, E],
        [E, C],
        [C, F],
        [F, G],
        [D, H],
        [B, D],
        [K, E]
    ]),

    % Contraintes d'ordre spécifique
    E #< J,
    D #< K,
    F #< K,

    % Prédicat pour la répartition des salles
    repartition_salles(Sessions, Salles),

    % Trouver une solution
    label(Sessions).

salle_unique_par_creneau(Associations) :-
    % Créer une liste de créneaux uniques à partir des associations
    findall(Creneau, member(Creneau-_, Associations), Creneaux),
    sort(Creneaux, CreneauxUniques),
    % Appliquer la contrainte pour chaque créneau
    maplist(creneau_a_salle_unique(Associations), CreneauxUniques).

creneau_a_salle_unique(Associations, Creneau) :-
    % Trouver toutes les salles pour un créneau donné
    findall(Salle, member(Creneau-Salle, Associations), Salles),
    % Appliquer la contrainte all_different pour garantir une salle unique par session pour ce créneau
    all_different(Salles).

repartition_salles(Sessions, Salles) :-
    length(Sessions, Length),
    length(Salles, Length),  % Une salle pour chaque session
    Salles ins 1..3,         % 3 salles disponibles

    % Associer chaque créneau avec une salle
    findall(Creneau-Salle, (nth1(Index, Sessions, Creneau), nth1(Index, Salles, Salle)), Associations),
    % Appliquer la contrainte de salle unique par créneau
    salle_unique_par_creneau(Associations).
