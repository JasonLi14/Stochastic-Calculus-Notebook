#import "../base-file.typ": *

#show: dvdtyp.with()

= Probability Theory


#problem[Using Definition 2.1.1, show the following.

+ If $A$ is an event and $A^c$ denotes its complement, then $bb(P)(A^c) = 1 - bb(P)(A)$.

+ If $A_1, A_2, dots, A_N$ is a finite set of events, then
$
  bb(P) (union.big_(n=1)^N A_n) <= sum_(n=1)^N bb(P)(A_n)
$

If the events $A_1, A_2, dots, A_N$ are disjoint, then equality holds.
]

1. *Solution*: Because $Omega = A union A^c$, we have $PP(A union A^c) = PP(Omega)= 1$. Because $A union A^c = emptyset$, $PP(A union A^c) = PP(A) + PP(A^c)$. Therefore, $PP(A^c) = PP(A union A^c) - PP(A) = 1 - PP(A)$. $square$
2. *Solution*: Define $B_1 = A_1$, $B_n = A_2 \\ (union.big_(m=1)^(n-1) A_m)$. Observe that $union.big_(n=1)^(N) A_n = union.big_(n=1)^(N) B_n$ and $PP(B_n) <= PP(A_n)$ as $B_n subset.eq A_n$. Therefore, 
$ 
  bb(P) (union.big_(n=1)^N A_n) = PP(union.big_(n=1)^N B_n) = sum_(n=1)^N bb(P)(B_n) <= sum_(n=1)^N bb(P)(A_n). quad square
$

#problem[ Consider the stock price $S_3$ in Figure 2.3.1.

(i) What is the distribution of $S_3$ under the risk-neutral probabilities $tilde(p) = 1/2$, $tilde(q) = 1/2$.

(ii) Compute $tilde(bb(E)) S_1$, $tilde(bb(E)) S_2$, and $tilde(bb(E)) S_3$. What is the average rate of growth of the stock price under $tilde(bb(P))$?

(iii) Answer (i) and (ii) again under the actual probabilities $p = 2/3$, $q = 1/3$.
]

#problem[
  Exercise 2.8 in the text!
]
