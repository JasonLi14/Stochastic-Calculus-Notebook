#import "../base-file.typ": *

#show: dvdtyp.with()

= State Prices
== Change of Measure
So far, we have encountered the actual probabilities and the risk-neutral probabilities. Actual probabilities are useful because they reflect the real world. Risk-neutral probabilities are useful because under this measure, the discounted price of assets are martingales, helping us solve systems of equations. 

#definition("Radon-Nikodym Derivative")[
Let $Omega$ be a finite sample space with probability measures $PP$ and $tilde(PP)$. Assume that in both $PP$ and $tilde(PP)$, every element of $Omega$ has positive probability. Define
$ Z(omega) = (tilde(PP)(omega))/PP(omega) $
Observe that $Z$ is a random variable! We call $Z$ the Radon-Nikodym derivative of $tilde(PP)$ with respect to $PP$. ]

#theorem("Properties of " + $Z$)[ 
  #enum(
    $PP(Z > 0) = 1$,
    $EE Z = 1$,
    $tilde(EE) Y = EE [Z Y]$ + " for any random variable " + $Y$
  )
]

*Proof*: 1. follows from assuming that $tilde(PP)(omega) > 0$ for all $omega$. 2. comes from 
$ EE Z = sum_(omega in Omega) Z(omega) PP(omega) = sum_(omega in Omega) (tilde(PP)(omega))/(PP(omega)) PP(omega) =  sum_(omega in Omega) tilde(PP)(omega) = 1. $
3. comes from 
$ tilde(EE) Y = sum_(omega in Omega) Y(omega) tilde(PP)(omega) = sum_(omega in Omega) Y(omega) (tilde(PP)(omega))/(PP(omega)) PP(omega) =  sum_(omega in Omega) Y(omega) Z(omega) PP(omega) = EE [Z Y]. "    " square $

The main power of the Radon-Nikodym derivative is that we can remove references to risk-neutral probabilities. Using $V_0 = tilde(EE) [V_n / (1+r)^n ]$ for valuations, we can instead write $V_0 = EE [V_n / (1+r)^n ]$. This leads to the idea of state prices.

#definition("State Prices")[
  In the $N$-period binomial model with actual probability measure $PP$ and risk-neutral probability measure $tilde(PP)$, let $Z$ denote the Radon-Nikodym derivative of $tilde(PP)$ with respect to $PP$, i.e. 
  $ Z(flips(n)) = (tilde(PP)(flips(n))) / (PP(flips(n))) = (tilde(p)/p)^(\# H (flips(n))) (tilde(q)/q)^(\# T (flips(n))). $
  The state price density random variable is 
  $ zeta(omega) = Z(omega)/(1+r)^N. $
  The *state price* corresponding to $omega$ is $zeta(omega) PP(omega)$.
]

Let $overline(omega)$ represent a specific sequence of coin flips $overline(omega)_1 dots overline(omega)_n$. Let $V_n (omega) = 1$ if $omega = overline(omega)$ and $0$ otherwise. Using the risk-neutral pricing formula, we get that the value of this derivative is 
$ tilde(EE) V_N/((1+r)^N) = (tilde(PP) (overline(omega)))/((1+r)^N) = (Z (overline(omega)) PP (overline(omega)))/((1+r)^N) = zeta(overline(omega)) PP (overline(omega)). $

The big idea from this equation is that if we did not discount for risk, then $PP(overline(omega))$ is the payoff at time $n$ and we have to discount the price and divide by $(1+r)^N$. But investors care about risk! This is where the $Z(overline(omega))$ term comes in handy: it accounts for risk. 

To represent contracts that pay even with different events, we can just write
$ V_0 = EE[zeta V_N] = sum_(omega in Omega) V_N (omega) zeta(omega) PP(omega) $

== Radon-Nikodym Derivative Process
Now, we want a way to estimate $Z$ based on information at time $n < N$. We first use the following theorem:
#theorem[
  Let $Z$ be a random variable in an $N$-period binomial model. Define 
  $ Z_n = EE_n Z $
  for $n = 0, dots, N$. Then $Z_n$, $n = 0, dots, N$ is a martingale under $PP$.
]
*Proof*: Use iterated conditioning property:
$ EE_n [Z_(n+1)] = EE_n [EE_(n+1) Z ] = EE_n [Z] = Z_n $
as required. $square$

#remark[This is true for the risk-neutral probability measure. ]

#definition("Radon-Nikodym Derivative Process")[
  In the $N$-period binomial model with actual probability measure $PP$ and risk-neutral probability measure $tilde(PP)$ with $PP(omega), tilde(PP)(omega) > 0$ for all $omega$. Let $Z$ denote the Radon-Nikodym derivative of $tilde(PP)$ with respect to $PP$. The *Radon-Nikodym* derivatve process is 
  $ Z_n = EE_n [Z], "   " n = 0, dots, N. $
  For the edge cases, $Z_N = Z$ and $Z_0 = 1$. 
]

#lemma[
  Let $Z_n$ be a Radon-Nikodym derivative process. Let $n$ be a positive integer between $0$ and $N$. Let $Y$ be a random variable depending only on the first $n$ coin tosses. Then $
  tilde(EE) Y = EE [Z_n Y].
  $
]

*Proof*: Use the theorems that $tilde(EE) Y = EE [ Z Y ]$, $EE [ X ] = EE [  EE_n [X] ]$, and $EE[X Y] = Y EE[X]$ for independent $Y$ in the following manipulation:
$ tilde(EE) Y = EE [Z Y] = EE [ EE_n[Z Y]] = EE [Y EE_n [Z]] = EE [Y Z_n]. "   " square $

#example[
  Consider a derivative which pays $1$ at time $N$ if the first $n$ coin tosses are $overline(omega)_1 dots overline(omega)_n$ and $0$ otherwise. Then 
  $
  tilde(EE) Y =  tilde(PP) ("First" n "coin tosses are" overline(omega)_1 dots overline(omega)_n) = tilde(p)^(\# H (overline(omega)_1 dots overline(omega)_n)) tilde(q)^(\# T (overline(omega)_1 dots overline(omega)_n))
  $
  and 
  $ EE[Y Z_n] &= Z_n (overline(omega)_1 dots overline(omega)_n) PP ("First" n "coin tosses are" overline(omega)_1 dots overline(omega)_n) \ &= Z_n (overline(omega)_1 dots overline(omega)_n)p^(\# H (overline(omega)_1 dots overline(omega)_n)) q^(\# T (overline(omega)_1 dots overline(omega)_n)). $
  By our lemma, these two quantities are equal: 
  $ tilde(p)^(\# H (overline(omega)_1 dots overline(omega)_n)) tilde(q)^(\# T (overline(omega)_1 dots overline(omega)_n)) = Z_n (overline(omega)_1 dots overline(omega)_n)p^(\# H (overline(omega)_1 dots overline(omega)_n)) q^(\# T (overline(omega)_1 dots overline(omega)_n)) $
  meaning that
  $ Z_n (overline(omega)_1 dots overline(omega)_n) = (p / tilde(p))^(\# H (overline(omega)_1 dots overline(omega)_n)) (q / tilde(q))^(\# T (overline(omega)_1 dots overline(omega)_n)) $
  We have found a way to calculate $Z_n$!
]
We also want an analogue of our lemma for conditional expectations.
#lemma[
  Let $Z_n$ be a Radon-Nikodym derivative process. Let $n <= m$ be positive integers between $0$ and $N$. Let $Y$ be a random variable depending only on the first $n$ coin tosses. Then $
  tilde(EE)_n Y = 1/Z_n EE_n [Z_m Y].
  $
]

*Proof*: Let $flips(n)$ be given. Compute:
$
  tilde(EE)_n [Y] (flips(n)) &= sum_(omega_(n+1) dots omega_m) Y(flips(m)) tilde(p)^(\# H (omega_(n+1) dots omega_m)) tilde(q)^(\# T (omega_(n+1) dots omega_m)) \
  &= (p / tilde(p))^(\# H (omega_1 dots omega_n)) (q / tilde(q))^(\# T (omega_1 dots omega_n)) \ 
  &" " dot sum_(omega_(n+1) dots omega_m) [ Y(flips(m)) (p / tilde(p))^(\# H (omega_1 dots omega_n)) (q / tilde(q))^(\# T (omega_1 dots omega_n)) \
  &" " dot p ^(\# H (omega_(n+1) dots omega_m)) q ^(\# T (omega_(n+1) dots omega_m)) \
  &= 1/(Z(flips(n))) sum_(omega_(n+1) dots omega_m) Y(flips(m)) Z_m (flips(n)) p ^(\# H (omega_(n+1) dots omega_m)) q ^(\# T (omega_(n+1) dots omega_m)  ] \
  &= 1/(Z(flips(n))) EE_n [Y Z_m] (flips(n))  ] \
$
as required. $square$

We now have different ways of formulating the risk-neutral pricing formula.
#theorem("Different Formulations of Risk-Neutral Valuations")[
  Consider $N$-period binomial model with $0 < d < 1 + r < u$. Let $p$ be the actual probability of a head and $q = 1- p$ the actual probability of a tail. Then set:
  $ tilde(p) = (1+r-d)/(u-d), " " tilde(q) = (u-1-r)/(u-d)  $
  which are both positive. Let $PP$ and $tilde(PP)$ be the actual and risk-neutral probability measures and let $Z$ be the Radon-Nikodym derivative of $tilde(PP)$ with respect to $PP$. Let $Z_n$, $n = 0, dots, N$ be the Radon-Nikodym derivative process. Let $zeta_n$ be the state-price density process, i.e. 
  $ zeta_n = Z_n / (1+r)^n, " " n = 0, dots, N. $

  Consider a derivative security with payoff $V_N$ dependent on possibly all $N$ coin tosses. For $n = 0, dots, N$, the price at time $n$ of this derivative security is
  $ V_n = tilde(EE)_n V_N / ((1+r)^(N-n)) = (1+r)^n / Z_n EE_n (Z_N V_N) / (1+r)^N = 1 / zeta_(n) EE_n [zeta_N V_N]. $
]

*Proof*: The first equality is the risk-neutral pricing formula. The second is from our lemma. The third is from the definition of $zeta_n$. $square$

== Capital Asset Pricing Model
There are two ways of valuing assets. We have thoroughly explored the first method: no arbitrage. The second is the *capital asset pricing model* (CAPM), where we balance supply and demand. This method is not precise quantitatively but has many qualitative insights. CAPM is about balancing supply and demand in the economics sense, modelling investors as having utility functions that convert units of consumption to units of satisfaction.

#definition("Concavity")[
  Afunction $f$ is concave if its values lie above any secant line, i.e. for every $x,y in RR$ and $alpha in (0, 1)$, 
  $ f(alpha x + (1 - alpha) y) >= alpha f(x) + (1 - alpha) f(y). $
  We say $f$ is strictly convex if the inequality is strict everywhere that it is finite.
]

#definition("Utility Function")[
  A *utility function* is a non-decreasing concave function defined on $RR$. It can take the value $-infinity$ but not $+infinity$.
]
 
#example[$ln(x)$ is a common example of a utlity function. ]
#example[For $p < 1$, $p != 0$, and $c in RR$, we can define a utility function
$ U_p = cases(
  1/p (x-c)^p " if " x > c, 
  0 " if " 0 < p < 1 " and " x = c, -infinity " if " p < 0 " and " x = c, -infinity " if " x < c) $
This is known as the HARA (hyperbolic absolute risk aversion) class. 
]
#remark[We require utility functions to be concave because it represents that there is a trade-off between risk and return (this happens as a result of Jensen's inequality, i.e. the expected value of the utility function will be less when the results are more "risky"). For example, a gamble with a $1/2$ probability of obtaining $\$1$ and a $1/2$ probability of obtaining $\$99$ has the same expected value as just getting $50$, but getting $50$ is more desirable because there is less risk. ]

The main idea in CAPM is the following problem: given initial wealth $X_0$ and a Utility function $U(X_N)$, find an adapted portfolio process $Delta_0, dots, Delta_(N-1)$ that maximizes $EE U (X_n)$, subject to $X_(n+1) = Delta_n S_(n+1) + (1+r)(X_n - Delta_n S_n)$ (*Problem CAPM 1*).

#example[Consider the following two-period model with $r = 1/4$. 
  #align(center,
  cetz.canvas({
    import cetz.draw: *
    
    let s = 1.2
    let x0 = 0
    let x1 = 4
    let x2 = 8
    
    let y0 = 0
    let y1h = 1
    let y1t = -1
    let y2hh = 2
    let y2ht = 0
    let y2tt = -2
    
    // Draw tree branches
    line((x0 + s, y0), (x1 - s, y1h))
    line((x0 + s, y0), (x1 - s, y1t))
    
    line((x1 + s, y1h), (x2 - s, y2hh))
    line((x1 + s, y1h), (x2 - s, y2ht+ 0.5))
    
    line((x1 + s, y1t), (x2 - s, y2ht - 0.5))
    line((x1 + s, y1t), (x2 - s, y2tt))
    
    // Node labels
    content((x0, y0), $S_0 = 4$)
    content((x1, y1h), $S_1(H) = 8$)
    content((x1, y1t), $S_1(T) = 2$)
    content((x2, y2hh), $S_2(H H) = 16$)
    content((x2, y2ht), $S_2(H T) = S_2(T H) = 4$)
    content((x2, y2tt), $S_2(T T) = 1$)
  })
)
The risk-free rates are $tilde(PP)(H H) = tilde(PP)(H T) = tilde(PP)(T H) = tilde(PP)(T T) = 1/4$, while the actual probability measures are $tilde(PP)(H H) = 4/9, tilde(PP)(H T) = tilde(PP)(T H) = 2/9, tilde(PP)(T T) = 1/9$. Consider an agent that seeks to maximize $EE ln(X_2)$, i.e. the agent has the utility function $ln$. 

After a few menial calculations, we arrive at 
$ EE ln X_2 &= 4/9 ln(X_2 (H H)) + 2/9 ln(X_2 (H T)) + 2/9 ln(X_2 (T H)) + 1/9 ln(X_2 (T T))\
&= 4/9 ln(6 Delta_1 (H) + 15/4 Delta_0 + 25/4) + 2/9 ln(-6 Delta_1 (H) + 15/4 Delta_0 + 25/4) \
&+ 2/9 ln(3/2 Delta_1 (T) - 15/4 Delta_0 + 25/4) + 1/9 ln(-3/2 Delta_1 (T) - 15/4 Delta_0 + 25/4).
$
This expression expands out $EE U(X_2)$ with our adapted portfolio process. The arguments in each $ln$ function represent $X_2$ down the various paths. To maximize this function w.r.t. our portfolio process (i.e. $Delta_0$, $Delta_1(T)$, and $Delta_2(H)$), we write out $partial / (partial Delta_0) EE ln(X_2)$, $partial / (partial Delta_1(T)) EE ln(X_2)$, and $partial / (partial Delta_2) EE ln(X_2)$ and set them to zero to find the following equations:
$ 4/(X_2 (H H)) + 2/(X_2 (H T)) = 2/(X_2 (T H))+ 1/(X_2 (T T)), \ 2/(X_2 (H H)) = 1/(X_2 (H T)), \ 2/(X_2 (T H)) = 1/(X_2 (T T)). $
Through basic algebra, we arrive at 
$
  X_2 (H H) = 2 X_2 (H T), \ X_2(T H) = 2 X_2 ( T T),\ X_2(H T) = 2 X_2 ( T T)
$
We then solve:
$
  6 Delta_1 (H) + 15/4 Delta_0 + 25/4 &= X_2 (H H) \ 
  -6 Delta_1 (H) + 15/4 Delta_0 + 25/4 &= X_2 (H T) \
  3/2 Delta_1 (T) - 15/4 Delta_0 + 25/4 &= X_2 (T H) \ 
  -3/2 Delta_1 (T) - 15/4 Delta_0 + 25/4 &= X_2 (T T).
$
which yields $Delta_0 = 5/9, Delta_1 (H) = 25/54$, and $Delta_1 (T) = 25/7$. 

We can also do this via $X_0 = tilde(EE) X_N / (1+r)^N$ to quickly obtain the values for $X_2$ and then recursively obtain $Delta_i$. 
]
With the machinery we developed, we can solve a different problem to substitute our original one: given $X_0$, find a random variable that maximizes $EE U (X_N)$ subject to $tilde(EE) X_N / (1+r)^N = X_0$ (*Problem CAPM 2*). 

#lemma[The problems are equivalent, i.e. suppose $Delta_0^ast, Delta_1^ast, dots, Delta_(N-1)^ast$ is an optimal portfolio process for CAPM problem 1 and $X^ast_N$ is the optimal wealth random variable. Then, $X^ast_N$ solves CAPM problem 2. 

Conversely, if $X^ast_N$ solves CAPM problem 2, the corresponding portfolio process $Delta_0^ast, Delta_1^ast, dots, Delta_(N-1)^ast$ that starts with $X_0$ and has value $X_N^*$ at time $N$ solves CAPM problem 1.  ]

*Proof*: Assume that $Delta_0^ast, Delta_1^ast, dots, Delta_(N-1)^ast$ is an optimal portfolio process for CAPM problem 1 and $X^ast_N$ is the corresponding optimal wealth random variable. Let $X_N$ be any random variable that satisfies the $tilde(EE) X_N / (1+r)^N = X_0$ constraint. It suffices to show that $EE U(X_N) <= EE U (X_N^*)$ ($X^*_N$ satsfies the CAPM problem 2 constraint because it is generated by a portfolio with initial wealth $X_0$). Observe that $X_N$ can be regarded as a *derivative security*. We have already shown how to replicate a derivative security with a portfolio process $Delta_1, dots, Delta_(N-1)$. This allows us compare the two processes: we can now use the fact that $X_N^*$ is the optimal wealth random variable to obtain $EE U(X^*_N) >= EE U(X_N)$.

For the other direction, suppose $X^*_N$ satisfies CAPM problem 2. Construct the portfolio process $Delta_0^ast, Delta_1^ast, dots, Delta_(N-1)^ast$ to replicate it. Let $Delta_0, dots, Delta_(N-1)$ be another portfolio process that starts with initial wealth $X_0$ and leads to $X_N$ at time $N$. Because $X_N$ satisfies $tilde(EE) X_N / (1+r)^N = X_0$ amd $X^*_N$ is the solution for CAPM probem 1, we conclude that $EE U(X^*_N) >= EE U (X_N)$ and $X^*_N$ is indeed optimal in CAPM problem 1.

Throughout this chapter, we have also developed machinery to "hide" the risk-neutral easures with the Radon-Nikodym derivative. We can change the constraint of CAPM problem 2 to become 
$ EE (Z_N X_N) / (1+r)^N = X_0 <==> EE zeta_N X_N = X_0 $
where $zeta_N = Z_N / (1+r)^N$. This gives rise to our final reformulation of the CAPM problem:

Let $omega^1, dots, omega^M$ be the possible *full* sequences of coin tosses and let $x_m = X_N (omega_m)$. Observe here that $omega^m$ is a sequence of coin tosses, not a singular one. Given $X_0$, we want to find the vector $(x_1, dots, x_M)$ that maximizes
$ sum_(m=1)^M PP(omega^m) U(x_m) $ 
subject t 
$ sum_(m=1)^M PP(omega^m) x_m zeta_m = X_0 $ 

This formulation is quite powerful because it helps us find $X_N$ more easily. Namely, using Lagrangian multipliers, we have
$ partial / (partial x_m) sum_(n=1)^M PP(omega^n) U (x_n) = lambda PP(omega^m) zeta_m x_m <==> U' (x_m) = lambda zeta_m  $
Because we assume $U$ is strictly concave and everywhere finite, its derivative is a decreasing function and thus has an inverse function $I$. We then get $x_m = I(lambda zeta_m)$, or $X_N (omega^m) = I(lambda zeta_N (omega^m) )$. We can then put this into the constraint of our new problem: 
$ 
  EE [Z/(1+r)^N I (lambda Z / (1+r)^N)] = X_0
$
We can then solve for $lambda$ to obtain $X_N$ and find the optimal portfolio process corresponding to $X_N$.




