%Females
female(paula).
female(amy).
female(ailene).
female(asder).
female(amber).
female(yang).
female(amelia).
female(josefina).
female(aurelia).
female(helen).
female(nanette).
female(purisima).

%males
male(leo).
male(barry).
male(bob).
male(bernardo).
male(simeon).
male(emilio).
male(leopoldo).

%parents
parent(amy,paula).
parent(leo,paula).
parent(amelia,amy).
parent(amelia,bob).
parent(amelia,barry).
parent(amelia,ailene).
parent(amelia,asder).
parent(amelia,amber).
parent(amelia,yang).
parent(bernardo,amy).
parent(bernardo,barry).
parent(bernardo,bob).
parent(bernardo,ailene).
parent(bernardo,asder).
parent(bernardo,amber).
parent(bernardo,yang).
parent(aurelia,bernardo).
parent(emilio,bernardo).
parent(josefina,amelia).
parent(simeon,amelia).
parent(purisima,leo).
parent(purisima,nanette).
parent(purisima,helen).
parent(leopoldo,leo).
parent(leopoldo,nanette).
parent(leopoldo,helen).

%Rules
mother(M,C):- female(M),parent(M,C).
father(F,C):- male(F),parent(F,C).
grandparent(G,Y):-parent(G,C), parent(C,Y).
grandmother(G,Y):- female(G), grandparent(G,Y).
grandfather(G,Y):- male(G), grandparent(G,Y).
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).
sibling(X,Y):- father(Father,X), father(Father,Y); mother(Mother,X), mother(Mother,Y), X\=Y.
uncle(Uncle,N):- male(Uncle), sibling(Uncle,Mother), mother(Mother,N).
uncle(Uncle,N):- male(Uncle), sibling(Uncle,Father), father(Father,N).
aunt(Aunt,N):- female(Aunt), sibling(Aunt,Mother), mother(Mother,N).
aunt(Aunt,N):- female(Aunt), sibling(Aunt,Father), father(Father,N).
sister(X,Y):- female(X), parent(Par,X), parent(Par,Y), X\=Y.
brother(X,Y):- male(X), parent(Par,X), parent(Par,Y), X\=Y.
descendant( X , Y ) :- ancestor( Y , X ).
child(C,P):- parent(P,C).
%findParents
findParents(X,L):- bagof(Z,parent(Z,X),L).

%findGrandparens
findGrandparents(X,L):- bagof(Z,grandparent(Z,X),L).

%findChildren
findChildren(X,L):- bagof(Z,child(Z,X),L).

%findSiblings
findSiblings(X,L):- setof(Z,sibling(Z,X),L).

%findAncestors
findAncestors(X,L):- setof(Z,ancestor(Z,X),L).

%findDescendants
findDescendants(X,L):- setof(Z, descendant(Z,X),L).

%ancestor path
ancestorPath(X,X,[X]).
ancestorPath(X,Y,[X|T]) :- parent(X,Z), ancestorPath(Z,Y,T).







