%
% CS 430 P5 (Prolog 1)
%
% Name: Jacob Hitzges
%

parent(X,Y) :- parents(X,Y,Z) ; parents(X,Z,Y).

step_parent(X,Y) :- spouse(Z,Y), parent(X,Z) ; spouse(Z,Y), parent(X,Z).

sibling(X,Y) :- parent(X,Z), parent(Y,Z).

aunt_uncle(X,Y) :- parent(X,A), sibling(A,Y).

grandparent(X,Y) :- parent(X,A), parent(A,Y).

ancestor(X,Y) :- parent(X,Y) ; parent(X,Z), ancestor(Z, Y).

relative(X,Y) :- ancestor(X,Y) ; parent(X,Y) ; grandparent(X,Y) ; aunt_uncle(X,Y) ; sibling(X,Y).

in_law(X,Y) :- spouse(X,A), relative(A,Y), not(relative(X,Y)).

