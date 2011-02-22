/* two-arg factorial; not tail-recursive */
factorial(0, 1).
factorial(N, F) :-
  N > 0,
  N1 is N - 1,
  factorial(N1, F1),
  F is N * F1.

/* three-arg factorial: tail-recursive */
factorial(0, F, F).
factorial(N, A, F) :-
  N > 0,
  A1 is N * A,
  N1 is N - 1,
  factorial(N1, A1, F).

/* factorial/3(3, 1, 6)
   3 > 0     A1 is 3 * 1    N1 is 3 - 1   factorial/3(2, 3, 6)
     t           t              t
     
   2 > 0     A1 is 2 * 3    N1 is 2 - 1   factorial/3(1, 6, 6)
     t           t              t
  
   1 > 0     A1 is 1 * 6    N1 is 1 - 1   factorial/3(0, 6, 6)
     t           t              t             t
*/

/* factorial/2(5, 2)
   5 > 0,   N1 is 5 - 1,    factorial(4, F1),   2 is 5 * F1
   4 > 0,   N1 is 4 - 1,    factorial(3, F2),   F1 is 4 * F2
   3 > 0,   N1 is 3 - 1,    factorial(2, F3),   F2 is 3 * F3
   2 > 0,   N1 is 2 - 1,    factorial(1, F4),   F3 is 2 * F4
   1 > 0,   N1 is 1 - 1,    factorial(0, F5),   F4 is 1 * F5
                                   F5 = 1
   so, F5 = 1, F4 = 1, F3 = 2, F2 = 6, F1 = 24, F = 120 != 2.
*/