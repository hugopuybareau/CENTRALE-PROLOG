:- use_module(library(clpfd)).

edt(Cours) :-
    Cours = [Extr_Conn , Sys_info , Res_telecom, Big_Data, Stat_Inge, Tr_Anal_MM,
Rech_op, Repr_data, Res_Info, Inge_Objet, Sys_BD, Meth_EDP],
    Cours ins 1..6,

    %On renseigne les contraintes
    Extr_Conn #> 1,
    Tr_Anal_MM #> 1,
    Big_Data #> 1,

    all_different([Extr_Conn, Stat_Inge, Meth_EDP]),
    all_different([Extr_Conn, Rech_op]),
    all_different([Sys_info, Rech_op]),
    all_different([Extr_Conn, Big_Data, Sys_BD]),
    all_different([Sys_info , Big_Data, Sys_BD]),
    all_different([Res_Info, Res_telecom, Repr_data, Sys_info]),

    Stat_Inge = 3,
    Meth_EDP = 6,
    Inge_Objet=5,
    Rech_op=4,
    Extr_Conn=2,

    label(Cours).
