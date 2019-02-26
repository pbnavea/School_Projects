
%Paula Navea
%COMP333
%May 5, 2018

%Base Case

listOfa([a]).
%Add more a's
%1a
listOfa([a|T]) :- listOfa(T).

%1b
listOfb([b]).
listOfb([b|T]) :- listOfb(T).

%1c
listOfc([c]).
listOfc([c|T]) :- listOfc(T).

%1d
listOfab(L):-append(X,Y,L),listOfa(X),listOfb(Y).

%1e
listOfabc(L):- append(X,Y,L), listOfab(X), listOfc(Y).

%1f
listOfaStar([]).
listOfaStar([a|T]) :- listOfaStar(T).
regExpr1(L):- append([b,b|X],[b,b,b],L),listOfaStar(X).
%1g
listOfaa(L):- append(X,Y,L), listOfa(X), listOfa(Y).
listOfcc(L):- append(X,Y,L), listOfc(X) , listOfc(Y).
regExpr2(L):- listOfaa(L); listOfcc(L).

%1h
listOfbStar([]).
listOfbStar([b|T]) :- listOfbStar(T).
listOfcStar([]).
listOfcStar([c|T]) :- listOfcStar(T).
regExpr3(L):- append(X,Y,Z,L), listOfaStar([a|X]),listOfbStar([b|Y]),listOfcStar([c|Z]).

%1i
gRule1(L):- append(X,[b],Y,L), listOfaStar([a|X]),listOfaStar([a|Y]).

sudoku(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36):-
%columns
permutation([1,2,3,4,5,6],[X1, X7, X13, X19,X25,X31]),
permutation([1,2,3,4,5,6],[X2, X8, X14, X20,X26,X32]),
permutation([1,2,3,4,5,6],[X3, X9, X15, X21,X27,X33]),
permutation([1,2,3,4,5,6],[X4, X10, X16, X22,X28,X34]),
permutation([1,2,3,4,5,6],[X5, X11, X17, X23,X29,X35]),
permutation([1,2,3,4,5,6],[X6, X12, X18, X24,X30,X36]),

%rows
permutation([1,2,3,4,5,6],[X1, X2, X3, X4, X5, X6]),
permutation([1,2,3,4,5,6],[X7, X8, X9, X10,X11,X12]),
permutation([1,2,3,4,5,6],[X13, X14, X15, X16,X17,X18]),
permutation([1,2,3,4,5,6],[X19, X20, X21, X22,X23,X24]),
permutation([1,2,3,4,5,6],[X25, X26, X27, X28,X29,X30]),
permutation([1,2,3,4,5,6],[X31,X32, X33,X34,X35,X36]),
%blocks
permutation([1,2,3,4,5,6],[X1, X2, X3, X7,X8,X9]),
permutation([1,2,3,4,5,6],[X4, X5, X6, X10,X11,X12]),
permutation([1,2,3,4,5,6],[X13, X14, X15, X19,X20,X21]),
permutation([1,2,3,4,5,6],[X16, X17, X18, X22,X23,X24]),
permutation([1,2,3,4,5,6],[X25, X26, X27, X31,X32,X33]),
permutation([1,2,3,4,5,6],[X28, X29, X30, X34,X35,X36]).
%Number 3
sudokuSolution(L) :- L =[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36],sudoku(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36).


