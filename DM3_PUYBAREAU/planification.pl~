:- use_module(library(clpfd)).

planification(Taches, Budget15):-
    % Variables
    Taches = [DM, DC, DT, DPLO, DPLA, DFE, DFA, DJ, DPE, DE],

    % Domaines
    Taches ins 1..29,

    % Durées des tâches
    LM = 7, LC = 3, LT = 1, LPLO = 8, LPLA = 3, LFE = 1, LFA = 2, LJ = 1, LPE = 2, LE = 1,

    % Contraintes date
    DM = 1,
    DC #>= DM + LM,
    DT #>= DC + LC,
    DFE #>= DT + LT,
    DFA #>= DT + LT,
    DJ #>= DT + LT,
    DPLO #>= DM + LM,
    DFA #>= DPLO + LPLO,
    DJ #>= DPLO + LPLO,
    DPLA #>= DM + LM,
    DPE #>= DPLA + LPLA,
    DE #>= DFE + LFE,
    DE #>= DFA + LFA,
    DE #>= DJ + LJ,
    DE #>= DPE + LPE,

    % Limite de budget
    Limite = 15,
    DM #=< Limite #<==> BDM #=1,
    DC #=< Limite #<==> BDC,
    DT #=< Limite #<==> BDT,
    DPLO #=< Limite #<==> BDPLO,
    DPLA #=< Limite #<==> BDPLA,
    DFE #=< Limite #<==> BDFE,
    DFA #=< Limite #<==> BDFA,
    DJ #=< Limite #<==> BDJ,
    DPE #=< Limite #<==> BDPE,
    DE #=< Limite #<==> BDE,

    % Variables de budget qui sont soit 0 soit la durée si la tâche commence avant la limite
    Budget15 #= LM*BDM + LC*BDC + LT*BDT + LPLO*BDPLO + LPLA*BDPLA + LFE*BDFE + LFA*BDFA + LJ*BDJ + LPE*BDPE + LE*BDE,
    Budget15 #=< 20,

    % Instanciation
    label(Taches).





