concatenate([], List, List). /* add zero elements */
/*
concatenate([Head|[]], List, [Head|List]). /* add one element
concatenate([Head1|[Head2|[]]], List, [Head1, Head2|List]). /* add two-element list
*/
concatenate([Head|Tail1], List, [Head|Tail2]) :-
  concatenate(Tail1, List, Tail2). /* general case */

/* reverse: accum version */
accum_reverse([X|Y], Z, W) :- accum_reverse(Y,[X|Z],W).
accum_reverse([], X, X).
my_reverse(X, XR) :- accum_reverse(X, [], XR).

/*
ar([1, 2, 3], [], A)
      |
ar([2, 3], [1], A)
      |
ar([3], [2, 1], A)
      |
ar([], [3, 2, 1], A)
      |
    true if A = [3, 2, 1]
*/
