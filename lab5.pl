%
% CS 430 Module 5 Lab Solution (Dr. Mike Lam)
%

% facts
direct_ancestor(scheme,lisp).
direct_ancestor(commonlisp,lisp).
direct_ancestor(haskell,scheme).
direct_ancestor(java,smalltalk).
direct_ancestor(java,cpp).
direct_ancestor(cpp,c).
direct_ancestor(cpp,smalltalk).
direct_ancestor(smalltalk,simula).
direct_ancestor(simula,algol).
direct_ancestor(csharp,java).
direct_ancestor(c,algol).
direct_ancestor(pascal,algol).
direct_ancestor(ada,pascal).
direct_ancestor(algol,fortran).

% A has ancestor C if A has direct ancestor C ...
ancestor(A,C) :- direct_ancestor(A,C).
% ... or if A has direct ancestor B and B has ancestor C (transitivity)
ancestor(A,C) :- direct_ancestor(A,B), ancestor(B,C).

% X and Y are cousins if they have an ancestor A in common and are unique
cousins(X,Y) :- ancestor(X,A), ancestor(Y,A), X\==Y.

% true if X and Y have common ancestor Z
common_ancestor(X,Y,Z) :- ancestor(X,Z), ancestor(Y,Z).

% X is a progenitor if it has no ancestors but at least one descendent
% (i.e., some other language has ancestor X)
progenitor(X) :- ancestor(_,X), \+ancestor(X,_).


%
% test routines
%

test_cousins :-
    cousins(java,cpp),
    \+cousins(java,lisp).

test_common_ancestor :-
    common_ancestor(java,cpp,_),
    \+common_ancestor(scheme,cpp,_).

test_progenitor :-
    progenitor(fortran),
    \+progenitor(cpp).

test :- test_cousins,
        test_common_ancestor,
        test_progenitor, !.

