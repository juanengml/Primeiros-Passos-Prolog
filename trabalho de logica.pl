:- dynamic duda_tem/1.
:- dynamic local_duda/1.

/*DUDA TEM NADA NO COME�O */

duda_tem(not_rede).
duda_tem(not_banho).
duda_tem(not_galinha).

/*sim locais q duda pode se mover*/
local_duda(patio).

/*LOCAIS ACESSIVEIS PARA DUDA ANDAR*/
acessivel(casa,patio).
acessivel(floresta,patio).
acessivel(lagoa,patio).
acessivel(galinheiro,patio).
acessivel(patio,casa).
acessivel(patio,floresta).
acessivel(patio,lagoa).
acessivel(patio,galinheiro).



/* SIM ESSA PARTE E PARA FUNCAO PARA ir_para(X) */
ir_para(X):- local_duda(P), P == patio, acessivel(P,X), X == lagoa,
   write("STATUS Local Duda: lagoa "),
   retract(local_duda(P)) ,assert(local_duda(X)),nl.

ir_para(X):- local_duda(P), P == patio, acessivel(P,X), X == floresta,
   write("STATUS Local Duda: FLORESTA !! "),
   retract(local_duda(P)) ,assert(local_duda(X)),nl.

ir_para(X):- local_duda(P), P == patio, acessivel(P,X), X == galinheiro,
   write("STATUS Local Duda: GALINHEIRO !! "),
   retract(local_duda(P)) ,assert(local_duda(X)),nl.

ir_para(X):- local_duda(P), P \== patio, acessivel(P,X), X == patio,
   write("STATUS Local Duda: PATIO !! "),
   retract(local_duda(P)) ,assert(local_duda(X)),nl.

ir_para(X):- local_duda(P), P == patio, acessivel(P,X), X == casa, duda_tem(Y), Y == banho ,
   retract(local_duda(patio)), assert(local_duda(casa)),
   write("Vc esta de banho tomado, entrou na casa ! pegue a rede e boa sorte na floresta"), nl.

ir_para(X):- local_duda(P), P == patio, acessivel(P,X), X == casa, duda_tem(Y), Y  \== banho ,
   write("N�o pode entrar precisa de banho, va pra lagoa e tome banho"),nl.


/* SIM ESSA PARTE E PARA A FUNCAO pegar(X) */

pegar(X):- local_duda(L), L == lagoa, X  == banho, retract(duda_tem(not_banho)), assert(duda_tem(banho)),
    write("NIVEL DE HIGIENE: BANHO ADQUIRIDO COM SUCESSO ! "),nl.

pegar(X):- local_duda(C), C == casa , X  == rede , retract(duda_tem(not_rede)) , assert(duda_tem(X)),
    write("ITEM ADQUIRIDO: REDE DE CAPTURA !") ,nl.

pegar(X):- local_duda(C), C == casa , X \== rede,
    write("ITEM INEXISTENTE: entre em contato com o suporte para solicitar novos itens !\nsuporte: suporte@suporte.com") ,nl.


pegar(X):- local_duda(F),duda_tem(R), F ==floresta,R==rede, X == bessy,
    write("CAPTURADO ! Bessy capturada com sucesso ! \n Leve para o Galinheiro ! "),
    retract(duda_tem(not_galinha)), assert(duda_tem(bessy)), nl.




pegar(X):- local_duda(F),duda_tem(R), F ==floresta,R \== rede, X == bessy,
    write("n�o CAPTURADO ! Bessy n�o capturada com sucesso ! \n n�o Leve para o Galinheiro ! "),nl.




/* rodar */


/* Finalizar o jogo */

finalizar:- local_duda(G), G == galinheiro, duda_tem(C), C == bessy,write("\t\t OBJETIVO COMPLETO ! PARABENS !"),nl.
finalizar:- local_duda(G), G \== galinheiro, duda_tem(C), C \== bessy,write("N�o esta no galinheiro e n�o tem a bessy"),nl.

rodar:-finalizar.

/*rodar:- finalizar. */




