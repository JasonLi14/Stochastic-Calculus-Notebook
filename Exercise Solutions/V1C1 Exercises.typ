#import "../base-file.typ": *

#show: dvdtyp.with()

= Binomial Asset Pricing Model
#problem[
  Assurne in the one-period binomial market  that both $H$ and $T$ have positive probability of occurring. Show that the condition that $0 < d < 1 + r < u$ precludes arbitrage. In other words, show that if $X_0 = 0$ and 
  $ X_1 = Delta_0 S_1 + (1+r) (X_0 - Delta_0 S_0) $
  then we cannot have $X_1$ strictly positive with positive probability unless $X_1$ is strictly negative with positive probability as well, and this is the case regardless of the choice of the number $Delta_0$.
]
Observe that
$ X_1 (H) = (u - 1 - r) Delta_0 S_0 + (1+r)X_0 = (u - 1 - r) Delta_0 S_0 $ and likewise
$ X_1 (T) = (d - 1 - r) Delta_0 S_0 .$ Suppose towards contradiction that $X_1(H)$ is positive and $X_1 (T)$ is non-negative. Then, if $Delta_0 > 0$, it must be that $Delta_0 S_0 > 0$ and thus $d >= 1 - r$, violating the condition. $Delta_0 != 0$ because then $X_1(H) = 0 = X_1 (T)$. If $Delta_0 < 0$, then it must be that $u - 1 - r < 0$, also violating the condition. $square$

#problem[
  In the one-period binomial model of Section 1.1, suppose we want to determine the price at time zero of the derivative security $V_1 = S_1$ (i.e., the derivative security pays off the stock price.) (This can be regarded as a European call with strike price K = 0). What is the time-zero price $V_0$ given by the risk-neutral pricing formula (1.1.10)?
]
Observe that 
$ V_0 = 1/(1+r)[tilde(p)V_1(H) + tilde(q)V_1(T)] = 1/(1+r)[tilde(p)S_1(T) + tilde(q)S_1(H)] = S_0 $
as $tilde(p)$ and $tilde(q)$ are the solutions to
$ S_0 = 1/(1+r)[tilde(p)S_1(T) + tilde(q)S_1(H)]. $


