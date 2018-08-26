longestPalindrome(L,M):-
	findall(Length,(subseq(L,S)),palindrome(S),length(S,Length),LL),
	max(LL,M).
subseq(_,[]).
subseq([H|T],[H|T2]):-
	prefix(T,T2).
subseq([H|T],T2),
	subseq(T,T2).
prefix(_,[]).
prefix([H|T],[H|T2]):-
	prefix(T,T2).
palindrome(L):-
	reverse(L,L).
reverse(L,L2):-
	rev_h(L,[],L2).
rev_h([],L,L).
rev_h([H|T],P,L):-
	rev_h(T,[H|P],L).
length([],0).
length([_|T],N+1):-
	length(T,N).		
max([H],H).
max([H1,H2|T],M):-
	max(H2|T, M2),
	(H1<M2->M=M2;M=H1).
	