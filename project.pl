%Project - CSC429/629 Fall 2022 - Points: 10
%Due: Nov. 16, 2:00 PM (CLASS TIME)
%Name: Kristin Cattell

%% HW2&3 Directives (must be at top of SWI Prolog program)
:- dynamic fact/1.
:- dynamic p/2.
:- dynamic p/3.

:- op(800,fx,if).
:- op(700,xfx,then).
:- op(300,xfy,or).
:- op(200,xfy,and).

% Step 1:  Define your BN graph HERE using the syntax for the
% BN interpreter used in HW3.
parent(house_broken_in, child_kidnapped).
parent(house_broken_in, front_door_open).
parent(child_kidnapped, toy_on_lawn).
parent(child_kidnapped, child_missing).
parent(child_play_at_neighbors, child_wentto_neighbors).
parent(child_play_at_neighbors, kids_heard_laughing).
parent(child_wentto_neighbors, child_missing).
parent(child_wentto_neighbors, written_note).

% Step 2: Define the BN prior probabilities HERE.
p(house_broken_in, 0.45).
p(child_play_at_neighbors, 0.65).

% Step 3: Define BN conditional probability tables HERE.
p(child_kidnapped, [house_broken_in], 0.85).
p(child_kidnapped, [not(house_broken_in)], 0.30).
p(front_door_open, [house_broken_in], 0.65).
p(front_door_open, [not(house_broken_in)], 0.20).
p(toy_on_lawn, [child_kidnapped], 0.75).
p(toy_on_lawn, [not(child_kidnapped)], 0.40).
p(child_wentto_neighbors, [child_play_at_neighbors], 0.80).
p(child_wentto_neighbors, [not(child_play_at_neighbors)], 0.35).
p(kids_heard_laughing, [child_play_at_neighbors], 0.60).
p(kids_heard_laughing, [not(child_play_at_neighbors)], 0.45).
p(written_note, [child_play_at_neighbors], 0.70).
p(written_note, [not(child_play_at_neighbors)], 0.20).
p(child_missing, [child_kidnapped, child_wentto_neighbors], 0.10).
p(child_missing, [child_kidnapped, not(child_wentto_neighbors)], 0.40).
p(child_missing, [not(child_kidnapped), child_wentto_neighbors], 0.65).
p(child_missing, [not(child_kidnapped), not(child_wentto_neighbors)], 0.20).

% Step 4:  Define FC rules HERE.
if child_was_kidnapped and good_neighbor and good_ending and good_parents then
'The neighbor helps to find the child.'.
if child_was_kidnapped and good_neighbor and good_ending and good_parents then
'The child is found and the kidnapper is arrested.'.
if child_was_kidnapped and good_neighbor and good_ending and good_parents then
'The parents reward the neighbor $2,000.'.
if child_was_kidnapped and good_neighbor and good_ending and good_parents then
'The parents celebrate and live happily with the child.'.

if child_was_kidnapped and bad_neighbor and good_ending and good_parents then
'The neighbor refuses to help find the child.'.
if child_was_kidnapped and bad_neighbor and good_ending and good_parents then
'The parents find the child themselves and the kidnapper is arrested.'.
if child_was_kidnapped and bad_neighbor and good_ending and good_parents then
'The family moves away from the terrible neighbors.'.
if child_was_kidnapped and bad_neighbor and good_ending and good_parents then
'The parents celebrate and live happily with the child in their new house.'.

if child_was_kidnapped and bad_neighbor and bad_ending and good_parents then
'The neighbor reveals they kidnapped the child and are holding them for ransom.'.
if child_was_kidnapped and bad_neighbor and bad_ending and good_parents then
'The parents cannot pay the ransom and the child is killed.'.
if child_was_kidnapped and bad_neighbor and bad_ending and good_parents then
'The neighbor escapes from the police.'.
if child_was_kidnapped and bad_neighbor and bad_ending and good_parents then
'The parents mourn the loss of their child for years.'.

if child_was_kidnapped and good_neighbor and bad_ending and good_parents then
'The neighbor helps to find the child.'.
if child_was_kidnapped and good_neighbor and bad_ending and good_parents then
'The kidnapper and child are found, but the child is killed and the kidnapper escapes.'.
if child_was_kidnapped and good_neighbor and bad_ending and good_parents then
'The neighbor supports and comforts the parents.'.
if child_was_kidnapped and good_neighbor and bad_ending and good_parents then
'The parents mourn the loss of their child for years.'.

if child_was_kidnapped and bad_neighbor and bad_ending and bad_parents then
'The neighbor reveals they kidnapped the child and are holding them for ransom.'.
if child_was_kidnapped and bad_neighbor and bad_ending and bad_parents then
'The parents don\'t care and refuse to pay the ransom.'.
if child_was_kidnapped and bad_neighbor and bad_ending and bad_parents then
'The child is killed.'.
if child_was_kidnapped and bad_neighbor and bad_ending and bad_parents then
'The neighbor escapes and the parents just go on living happily with an adopted child.'.

if child_was_kidnapped and good_neighbor and bad_ending and bad_parents then
'The neighbor helps to find the child.'.
if child_was_kidnapped and good_neighbor and bad_ending and bad_parents then
'The parents don\'t help in finding the child and the child is later found dead.'.
if child_was_kidnapped and good_neighbor and bad_ending and bad_parents then
'The neighbor mourns the loss of the child while the kidnapper is still on the run.'.
if child_was_kidnapped and good_neighbor and bad_ending and bad_parents then
'The parents go on living with an adopted child.'.

if child_was_kidnapped and good_neighbor and good_ending and bad_parents then
'The neighbor helps to find the child.'.
if child_was_kidnapped and good_neighbor and good_ending and bad_parents then
'The child is found and the kidnapper is arrested.'.
if child_was_kidnapped and good_neighbor and good_ending and bad_parents then
'The parents are mean to the child and blames them for not being careful enough.'.
if child_was_kidnapped and good_neighbor and good_ending and bad_parents then
'The neighbor takes the child from the parents and they live happily together.'.

if child_was_kidnapped and bad_neighbor and good_ending and bad_parents then
'The neighbor refuses to help find the child.'.
if child_was_kidnapped and bad_neighbor and good_ending and bad_parents then
'The child is found by the police and the kidnapper is arrested.'.
if child_was_kidnapped and bad_neighbor and good_ending and bad_parents then
'The parents are mean to the child in front of the police.'.
if child_was_kidnapped and bad_neighbor and good_ending and bad_parents then
'Child protective services take the child and the child is adopted later by loving parents.'.

if child_playing_at_neighbors then 'The child is found playing with the neighbor\'s child.'.
if child_playing_at_neighbors and bad_parents then
'The parents scold and yell at the child for leaving the house without permission.'.

if child_playing_at_neighbors and good_neighbor and good_ending and good_parents then
'The parents calmly instruct the child to never go out without permission again.'.
if child_playing_at_neighbors and good_neighbor and good_ending and good_parents then
'The toy, still fully intact, is given back to the child.'.
if child_playing_at_neighbors and good_neighbor and good_ending and good_parents then
'The family continues living happily together.'.

if child_playing_at_neighbors and bad_neighbor and good_ending and good_parents then
'The parents see that the child is being bullied by the neighbor\'s child.'.
if child_playing_at_neighbors and bad_neighbor and good_ending and good_parents then
'The parents scold the neighbor\'s child and takes their child back home.'.
if child_playing_at_neighbors and bad_neighbor and good_ending and good_parents then
'The family continues living happily together and the child finds a better new friend.'.

if child_playing_at_neighbors and bad_neighbor and bad_ending and good_parents then
'The neighbor\'s child randomly gets mad at the child and starts beating them up.'.
if child_playing_at_neighbors and bad_neighbor and bad_ending and good_parents then
'The child dies from their injuries.'.
if child_playing_at_neighbors and bad_neighbor and bad_ending and good_parents then
'The parents mourn the loss of their child for years.'.

if child_playing_at_neighbors and good_neighbor and bad_ending and good_parents then
'The parents take the child back home and scold the child.'.
if child_playing_at_neighbors and good_neighbor and bad_ending and good_parents then
'The child is grounded and their tablet is taken away.'.
if child_playing_at_neighbors and good_neighbor and bad_ending and good_parents then
'The child sulks around the house for the next few days.'.

if child_playing_at_neighbors and bad_neighbor and bad_ending and bad_parents then
'The parents drag the child back home while the neighbor\'s child laughs.'.
if child_playing_at_neighbors and bad_neighbor and bad_ending and bad_parents then
'The child continues to bear the abuse of their parents for years.'.

if child_playing_at_neighbors and good_neighbor and bad_ending and bad_parents then
'The parents drag the child back home. The neighbor tries to intervene, but to no avail.'.
if child_playing_at_neighbors and good_neighbor and bad_ending and bad_parents then
'The child continues to bear the abuse of their parents for years.'.

if child_playing_at_neighbors and good_neighbor and good_ending and bad_parents then
'The parents get too aggressive and the neighbor intervenes.'.
if child_playing_at_neighbors and good_neighbor and good_ending and bad_parents then
'The child is taken away from their parents and is adopted into a new loving family.'.

if child_playing_at_neighbors and bad_neighbor and good_ending and bad_parents then
'The neighbors also start to scold the child, so the child just runs away.'.
if child_playing_at_neighbors and bad_neighbor and good_ending and bad_parents then
'The child finds a new family and they live happily ever after together.'.

% Step 5:  Implement the rest of your program here.
story :- solve_mystery, finish_story, forward.

% Implement solve_mystery HERE.
solve_mystery :- write('Answer these questions to figure out what happened to the missing child.'),
	nl, get_observations(Front_Door, Toy_Lawn, Note, Kids_Laughing),
	prob(child_kidnapped, [Front_Door, Toy_Lawn, Note, Kids_Laughing], Pkidnapped),
	prob(child_wentto_neighbors, [Front_Door, Toy_Lawn, Note, Kids_Laughing], Pplaying),
	write_ans(Pkidnapped, Pplaying).

door_open('y', 'front_door_open').
door_open('n', 'not(front_door_open)').
toy_lawn('y', 'toy_on_lawn').
toy_lawn('n', 'not(toy_on_lawn)').
note('y', 'written_note').
note('n', 'not(written_note)').
kids_laughing('y', 'kids_heard_laughing').
kids_laughing('n', 'not(kids_heard_laughing)').

get_observations(Front_Door, Toy_Lawn, Note, Kids_Laughing) :-
	write('Was the front door left open? (y or n): '),
	read(A), door_open(A, Front_Door),
	write('Did you find the child\'s toy dropped on the front lawn? (y or n): '),
	read(B), toy_lawn(B, Toy_Lawn),
	write('Was there a poorly written note left about going out to play? (y or n): '),
	read(R), note(R, Note),
	write('Did you hear children laughing from the neighbor\'s house? (y or n): '),
	read(S), kids_laughing(S, Kids_Laughing).

write_ans(Pkidnapped, Pplaying) :-
	write('The probability that the child was kidnapped is '), write(Pkidnapped), write('.'), nl,
	write('The probability that the child went to the neighbor\'s house to play is '),
	write(Pplaying), write('.'), nl, write('Therefore, '), compareActs(Pkidnapped, Pplaying),
	write(' is the most likely event that occurred.'), nl, nl.

compareActs(Pkidnapped, Pplaying) :- Pkidnapped >= Pplaying, !, write('the child being kidnapped'),
	assert(fact(child_was_kidnapped)).
compareActs(Pkidnapped, Pplaying) :- write('the child going to the neighbor\'s house to play'),
	assert(fact(child_playing_at_neighbors)).

% Implement finish_story HERE.
finish_story :- write('Answer these questions about your story preferences.'), nl,
	write('Do you think the parents are good parents? (y or n):'), read(D), parent(D),
	write('Do you think the neighbors are good people? (y or n):'), read(E), neighbor(E),
	write('Do you like good endings? (y or n):'), read(F), ending(F).

parent(y) :- assert(fact(good_parents)).
parent(n) :- assert(fact(bad_parents)).
neighbor(y) :- assert(fact(good_neighbor)).
neighbor(n) :- assert(fact(bad_neighbor)).
ending(y) :- assert(fact(good_ending)).
ending(n) :- assert(fact(bad_ending)).



























