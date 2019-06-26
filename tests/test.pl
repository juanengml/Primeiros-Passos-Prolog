

:- dynamic duda_tem/1.
:- dynamic duda_pode/2.


duda_tem(not_rede).
duda_tem(not_banho).
local_duda(patio).

acessivel(patio,casa).
acessivel(patio,floresta).
acessivel(patio,lagoa).
acessivel(patio,galinheiro).
acessivel(casa,patio).
acessivel(floresta,patio).
acessivel(lagoa,patio).
acessivel(patio,galinheiro).

rodar:-read(X),call(X).

ir_para(X):- local_duda(Z), Z == patio, retract(local_duda(patio)) ,assert(local_duda(X)),nl.

pegar(X):- local_duda(W), W == lagoa, retract(duda_tem(not_banho)), assert(duda_tem(X)),nl.
pegar(X):- local_duda(W), W == casa,  retract(duda_tem(not_rede)) , assert(duda_tem(X)),nl.
