:- dynamic(inventori/5).
:- dynamic(legendaryTokemon/5).
:- dynamic(maxInventori/1).

currentInventoryLength(Length) :-
	findall(A, inventori(A, _, _, _, _), ListLength),
	length(ListLength, Length).

init_game :-
	asserta(legendaryTokemon('Rinalmon', 'IRK', 1000, 13518005, 'Legendary')),
	asserta(legendaryTokemon('Sangemon', 'Sister', 6969, 13517101, 'Legendary')),
	asserta(inventori('Pikachu', 'Listrik', 1, 100, 'Normal')),
	asserta(maxInventori(6)),!.

addInventori(A,B,C,D,E) :-
	currentInventoryLength(Panjang),
	maxInventori(Max),
	Panjang + 1 > Max, !, fail.

addInventori(Nama, Tipe, Level, Nyawa, Rarity) :-
	asserta(inventori(Nama, Tipe, Level, Nyawa, Rarity)),!.

delInventori(Nama) :-
	retract(inventori(Nama, _, _, _, _)),!.

printStatus :-
	write('Kisama no Tokemon :'),nl,nl,
	forall(inventori(A,B,C,D,E), printTokemon(A,B,C,D,E)),
	write('================================='), nl,
	nl, write('Lejenderi Tokemon :'), nl,nl,
	forall(legendaryTokemon(F,G,H,I,J), printTokemon(F,G,H,I,J)).

printTokemon(Nama, Tipe, _, Nyawa, _) :-
	write(''), write(Nama), nl,
	write('Health : '), write(Nyawa), nl,
	write('Tipe : '), write(Tipe), nl, nl.
