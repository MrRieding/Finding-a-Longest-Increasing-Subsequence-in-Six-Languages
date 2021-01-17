
:- set_prolog_flag(answer_write_options,[max_depth(0)]).

lis(Seq, L) :-
	aggregate(max(A,B), (lis_def(Seq, [], B), length(B, A)), max(_, Temp)), %Fact for finding a longest subsequence
	%findall(max(A, B), (lis_def(In, [], B), length(B, A)), max(_,Temp)),
	reverse(Temp, L). %Otherwise list found is backwards


lis_def([], P1, P1). %base fact for recursion

lis_def([H|T], P1, Pf) :- %Recursive definition of what an increasing subsequence is.
	(P1 = [], lis_def(T, [H], Pf));
	(P1 = [H2|_], H2 < H,   lis_def(T, [H|P1], Pf));
	lis_def(T, P1, Pf).

