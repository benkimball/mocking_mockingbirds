/* a bird has a name, which is a single lowercase letter. */
bird(i).
bird(j).
bird(k).
bird(m).

/* a forest has many birds. */
forest([]).
forest([Head|Tail]) :- bird(Head), forest(Tail).

/* a bird has a response function, which takes the name of a bird and returns the name of a bird. */
/* here are some example birds. */
/* properties:
    j composes j with j
    k composes k with j
    k composes m with j
    m is a mockingbird
*/
response(i, i, j). response(i, j, k). response(i, k, i). response(i, m, j).
response(j, i, i). response(j, j, k). response(j, k, k). response(j, m, m).
response(k, i, j). response(k, j, i). response(k, k, i). response(k, m, m).
response(m, i, j). response(m, j, k). response(m, k, i). response(m, m, m).

/* A mockingbird is meant a bird M such that for any bird x in Forest, Mx = xx. */
is_mockingbird(Bird, []) :- bird(Bird).
is_mockingbird(Bird, [Head|Tail]) :- response(Bird, Head, R1),
                                     response(Head, Head, R1),
                                     is_mockingbird(Bird, Tail).

/* A bird C composes birds A and B if for every bird x in Forest, Cx = A(Bx). */
composes(C, _, _, []) :- bird(C).
composes(C, A, B, [Head|Tail]) :- response(B, Head, R1),
                                  response(A, R1, R2),
                                  response(C, Head, R2),
                                  composes(C, A, B, Tail).
