#import "../base-file.typ": *

#show: dvdtyp.with()

= Probability Theory on Coin Toss Space

== Finite Probability Spaces
We use *finite probability spaces* to model situations in a random experiment that permit *finitely many possible outcomes*.

#example[
  If we toss a coin three times, the possble outcomes are 
  $ Omega = {H H H, H H T, H T H, H T T, T H H, T H T, T T H, T T T} $
  If the probability of a head is $p$ (and thus the probability of a tail is $1 - p$), and we assume independent tosses, we get
  $ PP(H H H) = p^3, PP (H H T) = PP(H T H) = PP (T H H) = q p^2,\ PP (H T T) = PP (T H T) = PP (T T H) = q^2 p, PP( T T T) = q^3 $
]

*Events* are subsets of $Omega$. 
#example[
  The event "The first toss is a head" is the subset
  $ {omega in Omega; omega_1 = H} = {H H H, H H T, H T H, H T T} $
  The probability of this event is 
  $ 
  PP({omega in Omega; omega_1 = H}) &= PP(H H H) + PP (H H T) + PP(H T H) + PP(T H H) \ &= p^3 + 2p^2 q + p q^2 \ &= p^2 (p + q) + p q (p + q) \
  &= p^2 + p q \
  &= p 
  $
]
More formally,
#definition("Finite Probability Space, Event")[
  A finite probability space consists of a sample space $Omega$, which is a non-empty finite set, and a probability measure $PP: Omega -> [0, 1]$ such that $sum_(omega in Omega) PP(omega) = 1$. 

  An event is a subset of $Omega$. The probability of an event $A$ is defined as
  $PP(A) = sum_(omega in A) P(omega)$
]
#remark[
  Observe that 
  - $PP(Omega) = 1$.
  - $PP(A union B) = PP(A) + PP(B)$ if $A inter B = emptyset $.
]

== Random Variables
#definition("Random Variables")[
  Let $(Omega, PP)$ be a finite probability space. A random variable is a function $Omega -> RR$. We sometimes permit random variables to take the values $+ infinity$ or $- infinity$.
]
We sometimes use $omega$ to denote the argument of all the random variables, even if $omega$ is a sequence. 

#example[
  Toss a coin three times. Define the random variables $X = "Total number of heads"$ and $Y = "Total number of tails"$. Then,
  $ 
  X(H H H) &= 3 \ 
  X(H H T) = X(T H H) = X(T H H) &= 2 \
  X(H T T) = X(T H T) = X(T T H) &= 1 \
  X(T T T) &= 0
  $
  and
  $ 
  Y(H H H) &= 0 \ 
  Y(H H T) = Y(T H H) = Y(T H H) &= 1 \
  Y(H T T) = Y(T H T) = Y(T T H) &= 2 \
  Y(T T T) &= 3.
  $ 
  If each sequence of coin tosses has probability $1/8$ of occuring, then
  $ 
  PP(X=0) = P(T T T) &= 1/8 \ 
  PP(X=1) = P(T T H) + P(T H T) + P(H T T) &= 3/8 \
  PP(X=2) = P(T H H) + P(H T H) + P(H H T) &= 3/8 \
  PP(X=3) = P(H H H) &= 1/8
  $
  We write $X = j$ as shorthand for ${omega in Omega: X(omega) = j}$. We refer to the table of probabilities that $X$ takes various values as the *distribution* of $X$. Distributions and random variables are different!
]

#definition("Expected Values")[
  Let $X$ be a random variable defined on finite probabiltiy space $(Omega, PP)$. The expectation/expected value of $X$ is
  $ EE X = sum_(omega in Omega) X(omega) PP(omega) $
  When we use risk-neutral probabilities, we use the following notation:
  $ tilde(EE) X = sum_(omega in Omega) X(omega) tilde(PP)(omega) $
]

#definition("Variance")[
  The variance of $X$ is
  $ "Var"(X) = EE [ (X - EE X)^2]$
]

#remark[
  Expectation is linear, i.e. $EE[a X + b Y] = a EE X + b EE Y $
]

#theorem("Jensen's Inequality")[
  Let $X$ be a random variable on a finite probability space and let $phi (x)$ bea convex function of a dummy variable $x$. Then
  $ EE [phi(X)] >= phi (EE X). $
]
*Proof*: We first argue that
$ phi(x) = max {ell (x); ell " is linear and " ell(y) <= phi(y)) "for all" y in RR} $
I.e. $phi(x)$ is the maximum value attained at $x$ of all linear functions that lie below it. It is clear that $phi(x) >= max(dots)$ because we only consider linear functions that lie below $phi$. To see that $phi(x) <= max(dots)$, fix $x$ and consider the linear function $ell$ that lies below $phi$ but $ell(x) = phi(x)$, which exists because $phi$ is convex. 

Let $ell$ be a linear function below $phi$. Then,
$ EE [phi(X)] >= EE [ell(X)] = ell [E X] $
by linearity of expectation. Because this is true for all $ell$, we get 
$ EE [phi(X)] >= max{ell (EE X); ell " is linear and " ell(y) <= phi(y) "for all" y in RR} = phi(EE x) $
as required. $square$

#example[
  Because $phi(x) = x^2$ is convex, $E[X^2] >= EE [X]^2$. 
] 

== Conditional Expectations
#definition($"Conditional Expectation based on Information at Time " n $)[
  Let $n$ satisfy $1 <= n <= N$ and let $omega_1 dots omega_n$ be given and fixed. Let $\# H(omega_(n+1) dots omega_N)$ be the number of heads in $omega_(n+1) dots omega_N$ and let $\# T(omega_(n+1) dots omega_N)$ be the number of tails in $omega_(n+1) dots omega_N$. Define
  $
  tilde(EE)_n[X](omega_1 dots omega_n) = sum_(omega_(n+1) dots omega_N) tilde(p)^(\# H(omega_(n+1) dots omega_N)) tilde(q)^(\# T(omega_(n+1) dots omega_N))X(omega_1 dots omega_N).
  $
  We call $tilde(EE)_n[X]$ the conditional expectation of $X$ based on the information at time $n$.

  For the extreme cases, define $tilde(EE)_0[X] = tilde(EE) X$ and $tilde(EE)_N [X] = X$.
]
#remark[The conditional expectation is basically the value at a single node of our binomial tree. For example, if $omega_1 = H$, then $tilde(E)_1[X](omega_1)$ is the value assuming that we took an up action in our tree at the very start. ]

#theorem("Fundamental properties of conditional expectations")[
  Let $N in ZZ_+$. Let $X$ and $Y$ be random variables dependent on the first $N$ coin tosses. Let $0 <= n <= N$ be given. The following properties hold.
  1. *Linearity of conditional expectations*. For all constants $c_1$ and $c_2$, 
  $ EE_n [c_1 X + c_2 Y] = c_1 EE_n [X] + c_2 EE_n [Y]. $
  2. *Taking out what is known*. If $X$ only depends on the first $n$ coin tosses,
  $ EE_n [X Y] = X EE_n [Y] $
  3. *Iterated conditioning*. If $0 <= n <= m <= N$, then 
  $ EE_n [EE_m [X] ] = EE_n [X]. $
  This also implies that $EE[EE_m [X]] = EE X$
  4. *Independence*. If $X$ only depends on coin tosses $n+1$ to $N$, then
  $ EE_n [X] = EE X $
  5. *Conditional Jensen's inequality*. If $phi(x)$ is convex, then 
  $ EE_n [phi(X)] >= phi(EE_n [X]). $
]

== Martingales
We have so far used risk-neutral probabilities so that for every coin toss sequence, we have that $S_n (omega_1 dots omega_n) = 1/(1+r) [tilde(p) S_(n+1) (omega_1 dots omega_n H) + tilde(q) S_(n+1) (omega_1 dots omega_n T)] = 1/(1+r) tilde(EE)_n [ S_(n+1)]$. We can divide by $(1+r)^n$ to get
$ S_n/(1+r)^n = tilde(EE)_n [S_(n+1) / (1+r)^(n+1)] = 1/(1+r)^n tilde(EE)_n [S_(n+1)] $
under the assumption that interest rates are non-random. This equation shows that the optimal forecast of the discounted stock price at time $n+1$ is the discounted stock price at time $n$. This quirk motivates the definition of a martingale
#definition("Martingale")[
  Consider the binomial asset-pricing model. Let $M_0, M_1, dots, M_N$ be a sequence of random variables, with each $M_n$ only depending on the first $n$ coin tosses (observe that $M_0$ is a constant). Such a sequence of random variables is called an *adapted stochastic process*.
  1. If 
  $ M_n = EE_n [M_(n+1)] $
  for $n = 0, dots, N-1$, this process is a *martingale*.
  2. If 
  $ M_n <= EE_n [M_(n+1)] $
  for $n = 0, dots, N-1$, this process is a *submartingale*.
  3. 2. If 
  $ M_n >= EE_n [M_(n+1)] $
  for $n = 0, dots, N-1$, this process is a *supermartingale*.
]
#remark[
  If $M_0, dots, M_N$ is a martingale and $n <= N - 2$, then we have
  $ M_(n+1) = EE_(n + 1) [M_(n+2)] $
  Using the iterated conditioning probability,
  $ EE_n [M_(n+1)] = EE_n [ EE_(n + 1) [M_(n+2)] ] =  EE_n [ M_(n+2) ] .$
  We can iterate this to show that 
  $ M_n = EE_n [M_m]. $
  In fact, because $EE M_n = EE [EE_n [M_(n+1)]] = EE[M_(n+1)]$, we get
  $ EE M_0 = dots = EE M_N = M_0. $
]
The main idea of a martingale is that given a sequence of events, the value of the state is equal to the expected value of the next state. Thus, the value of the martingale has *no tendency to rise or fall*. We find that stock prices with their actual probabilities for future prices are *submartingales*, i.e. their expected discounted prices at a future time are higher than their current prices, which makes sense given that investors usually enforce a risk premium. 

#theorem("Risk-Neutral Probabilities create Martingales")[
  Let 
  $ tilde(p) = (1 + r - d)/(u - d), "   " tilde(q) = (u-1-r)/(u-d) $
  with $0 < d < 1 + r < u$. Under these risk-neutral probabilities, the discounted stock price is a martingale. 
]
*Proof*: Make the observation that $S_(n+1)/S_n$ depends only on the (n+1)st coin toss (it is either equal to $u$ or $d$ depending on the toss). With conditional probability properties, we get that
$ 
tilde(EE)_n [S_(n+1)/(1+r)^(n+1)] &= tilde(EE)_n [S_(n)/(1+r)^(n+1) dot S_(n+1) / S_(n) ] \
&= S_n / (1+r)^(n+1) tilde(EE)_n [S_(n+1) / S_(n) ] &"Taking Out What is Known" \
&= S_n / (1+r)^(n+1) tilde(EE) [S_(n+1) / S_(n) ] &"Independence" \
&= S_n / (1+r)^(n+1) (tilde(p) u + tilde(q) d) \
&= S_n / (1+r)^(n) &square
$

Recalling our replicating portfolio idea, we see that $Delta_0, dots, Delta_(N-1)$ and $X_0, dots, X_(N-1)$ are both adapted stochastic process! In fact, there is something deeper about the wealth process:

#theorem("Discounted Wealth Process is a Martingale")[
  Consider the binomal model with $N$ periods. Let $Delta_0, dots, Delta_(N-1)$ b an adapted portfolio process. Let $X_0 in RR$ and let $X_1, dots, X_(N)$ be generated by 
  $ X_(n+1) = Delta_n S_(n+1) + (1+r)(X_n - Delta_n S_n). $
  Then $X_n/(1+r)^n$ for $n = 0, dots N$ is a martingale under the risk-neutral measure.
]
*Proof*: Observe
$
  tilde(EE)_n [ X_(n+1) / (1+r)^(n+1) ] &= tilde(EE)_n [ (Delta_n S_(n+1))/ (1+r)^(n+1) + (X_n - Delta_n S_n)/ (1+r)^n  ] \
  &= tilde(EE)_n [ (Delta_n S_(n+1))/ (1+r)^(n+1) ] + tilde(EE)_n [(X_n - Delta_n S_n)/ (1+r)^n  ] &"Linearity" \
  &= Delta_n tilde(EE)_n [ (S_(n+1))/ (1+r)^(n+1) ] + (X_n - Delta_n S_n)/ (1+r)^n &"Taking out what is known" \
  &= (Delta_n S_(n))/ (1+r)^(n) + (X_n - Delta_n S_n)/ (1+r)^n &"Theorem 2.4.1" \
  &= X_n/ (1+r)^n &square
$

#corollary[
  $ tilde(EE) [X_n / (1+r)^n] = X_0 $ ]
*Proof*: Follows from Remark 2.4.1 as $X_n / (1+r)^n$ is a martingale.

#remark[
  Our corollary shows that there is no arbitrage in the binomial model! Otherwise, suppose we have a portfolio with $X_0 = 0$. If there was an arbitrage opportunity, $tilde(EE) [X_n / (1+r)^n] > 0 = X_0$, a contradiction with our corollary. 
]

#remark[
  These ideas lead to the *First Fundamental Theorem of Asset Pricing*, which states that if there exists a risk-neutral measure in a model, i.e. a measure that agrees with the actual probabilities about the paths that have zero probability and where the risk-neutral discounted prices are martingales, then there is *no arbitrage.*
]

#theorem("Risk-neutral pricing formula")[ Consider $N$-period binomial asset-pricing model with $0 < d < 1 + r < u$ and risk-neutral probability measure $tilde(PP)$. Let $V_n$ be a random variable (the value of a derivative security with payoff at time $N$) dependent on the coin tosses. The price of the derivative security is then given by
$ V_n = tilde(EE)_n [V_N / (1+r)^(N-n)] $
and the discounted price of the derivative security is a martingale under $tilde(PP)$, i.e.
$ V_n / (1+r)^n = tilde(EE)_n [V_(n+1) / (1+r)^(n+1)], n = 0, dots, N. $
We define $V_n$ here identically as in Theorem 1.3.1. 
]
*Proof*: Exercise 8

#theorem("Cash flow valuation")[ Consider $N$-period binomial asset-pricing model with $0 < d < 1 + r < u$ and risk-neutral probability measure $tilde(PP)$. Let $C_0, dots, C_N$ be a sequence of random variables such that $C_n$ depends only on $omega_1 dots omega_n$. The price of a security at time $n$ that pays $C_n, dots, C_N$ at times $n, dots, N$ respectively is
$ V_n = tilde(EE)_n [sum_(k=n)^N C_k / (1+r)^(k-n) ], " " n = 0, dots, N. $
The price process $V_n, n = 0, dots, N$ satisfies
$ C_n(omega_1 dots omega_n) = V_n(omega_1 dots omega_n) - 1/(1+r)[tilde(p) V_(n+1) (omega_1 dots omega_n H) + tilde(q) V_(n+1) (omega_1 dots omega_n T)] $
Define 
$ Delta_n (omega_1 dots omega_n) = (V_(n+1) (omega_1 dots omega_n H) - V_(n+1) (omega_1 dots omega_n T))/(S_(n+1) (omega_1 dots omega_n H) - S_(n+1) (omega_1 dots omega_n T)) $
for $n = 0, dots N - 1$. If we set $X_0 = V_0$ and recursively define $X_1, dots, X_N$ by 
$ X_(n+1) = Delta_n S_(n+1) + (1+r)(X_n - C_n - Delta_n S_n) $
we get 
$ X_n (omega_1 dots omega_n) = V_n (omega_1 dots omega_n) $
for all $n$ and $omega_1 dots omega_n$
]
#remark[
  To finance practitioners, $V_n$ is known as the *net present value* (NPV) of the sequence of payments $C_n, dots, C_N$. Note that we include the payment at time $n$. 
]

*Proof*: By induction on $n$. The base case is true by definition of $X_0$. Suppose that $X_n(omega_1 dots omega_n) = V_n(omega_1 dots omega_n)$ for some $n = 0, dots, N - 1$. We show that $X_(n+1) (omega_1 dots omega_n H) = V_(n+1) (omega_1 dots omega_n H)$ and a similar argument demonstrates that $X_(n+1) (omega_1 dots omega_n T) = V_(n+1) (omega_1 dots omega_n T)$, which in turn proves our theorem.

Because $C_n$ depends on the first $n$ coin tosses only, we can modify the equation for $V_n$:
$ 
V_n &= tilde(EE)_n [sum_(k=n)^N C_k / (1+r)^(k-n) ] \
&= C_n + tilde(EE)_n [1/(1+r) sum_(k=n+1)^N C_k / (1+r)^(k-(n+1)) ] \
&= C_n + tilde(EE)_n [1/(1+r) tilde(EE)_(n+1) [ sum_(k=n+1)^N C_k / (1+r)^(k-(n+1)) ]] \
&= C_n + tilde(EE)_n [1/(1+r) V_(n+1)] \
 $
This leads to the following:
$ V_n - C_n &= tilde(EE)_n [1/(1+r) V_(n+1)] \ 
&= (tilde(p)V_(n+1) (omega_1 dots omega_n H) + tilde(q) V_(n+1) (omega_1 dots omega_n T))/(1+r) \
 $
For the rest of the proof, we suppress $omega_1 dots omega_n$ for ease of writing. Observe that
$ 
  X_(n+1) (H) &= Delta_n S_(n+1) (H) + (1+r) (X_n - C_n - Delta_n S_n)   \
  &=  (V_(n+1) (H) - V_(n+1) (T))/(S_(n+1) (H) - S_(n+1) (T)) (S_(n+1)(H) - (1+r)S_n) + (1+r) (V_n - C_n )   \
  &=  (V_(n+1) (H) - V_(n+1) (T))/(S_n (u-d)) (S_(n))(u - 1 - r) + tilde(p)V_(n+1) (H) + tilde(q) V_(n+1) (T)  \
  &=  (V_(n+1) (H) - V_(n+1) (T)) tilde(q) + tilde(p)V_(n+1) (H) + tilde(q) V_(n+1) (T)  \
  &=  V_(n+1) (H)
$
as required. $square$

== Markov Processes
Markov processes are a way to simplify calculations by determining what is relevant and what is not, akin to the computational "shortcuts" discussed in #link(<comp_considerations_binomial>, "1.4"). 

#definition("Markov Process")[
  Consider the binomial asset-pricing model. Let $X_0, dots, X_N$ be an adapted process. If, for every $n in {0, dots, N-1}$ and function $f(x)$, there is another function $g(x)$ (which we get given $n$ and $f$), such that 
  $ EE_n [f(X_(n+1))] = g(X_n) $
  we say that $X_0, dots, X_N$ is a Markov process. 
]

In a bit, we prove that if such a $g$ exists, then the payoff of a derivative security is random only through its dependence on $X_N$, then we can create a pricing algorithm that does not need to store path information.

#example[
  In the binomial model, where $ 
  S_(n+1)(flips(n+1)) = cases(u S_n (flips(n)) "if " omega_(n+1) = H, d S_n (flips(n)) "if " omega_(n+1) = T)
  $
  we get that
  $
  EE_n [f(S_(n+1))](flips(n)) = p f (u S_n (flips(n))) + q f (u S_n (flips(n))).
  $
  The function $g(x) = p f (u x) + q f (d x)$ shows that this process is Markov. 

  To see why Markov processes are nice, consider the valuation of a derivative security with a payoff at time $N$ is $v_N(S_N)$ for some function $v_N$. Then, the price at time $n$ is given by 
  $ V_n = 1/(1+r) rnEE(n) [V_(n+1)], n = 0, dots, N - 1 . $
  But $V_N = v_N (S_N)$ and the stock price process is Markov, so
  $ V_(N-1) = 1/(1+r) rnEE(N-1) [v_N (s_N)] = v_(N-1)(S_(N-1)) $
  for some function $v_(N-1)$. We can continue generating such $v_n$ to get $V_n = v_n (S_n)$. Using the definition of $tilde(EE)$, we get 
  $ v_n (s) = 1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s)] $
  for $n = 0, dots, N - 1$!
]

#remark[Martingales are not necessarily Markov processes and Markov processes are not necessarily Martingales. For example, non-discounted stock prices are Markov processes but they are not Martingales, unless $p u + q d = 1 $. ]

#lemma("Independence")[
  Consider the $N$-period binomial asset pricing model with $n in {0, dots, N}$. Suppose the random variables $X^1, dots, X^K$ depend only on coin tosses $1$ through $n$ and the random variables $Y^1, dots, Y^L$ depend only on coin tosses $n+1, dots, N$. Let $f(x^1, dots, x^K, y^1, dots, y^L)$ be a function of dummy variables $x^1, dots, x^K$ and $y^1, dots, y^L$, and define
  $ g(x^1, dots, x^K) = EE f(x^1, dots, x^K, Y^1, dots, Y^L). $
  Then, 
  $ EE_(n) [f(X^1, dots, X^K, Y^1, dots, Y^L)] = g(X^1, dots, X^K). $
]
If $K = L = 1$, this means if we set $g(x) = EE f(x, Y)$, then $EE_(n) [f(X, Y)] = g(X) $. This is the analog of "taking out what is known". 

*Proof*: Let $flips(n)$ be fixed but arbitrary. By the definition of conditional expectation,
$ EE_n [f(X, Y)](flips(n)) = sum_(omega_(n+1) dots omega_N) f(X(flips(n)), Y(omega_(n+1)dots omega_N)) p^(\# H (omega_(n+1) dots omega_N))q^(\# T (omega_(n+1) dots omega_N)). $
On the other hand,
$ g(x) = EE_n [f(x, Y)](flips(n)) = sum_(omega_(n+1) dots omega_N) f(x, Y(omega_(n+1)dots omega_N)) p^(\# H (omega_(n+1) dots omega_N))q^(\# T (omega_(n+1) dots omega_N)). $
Which shows that
$ EE_n [f(X, Y)](flips(n)) = g(X(flips(n))). $
#example[The maximum-to-date derivative is not a Markov process! $M_2 (T H) = M_2 (T T)$ but $M_3 (T T H) = 4 != M_3 ( T H H) = 8$ (which leads us to the discovery that $EE_3 [M_3](T H))$ cannot equal $EE_3 [M_3](T T))$. ]

Markov processes are much easier to compute. Is it possible to turn non-Markov processes Markov? The general idea is to add "state variables" to recover the Markov property.

#definition("Multi-dimensional Markov")[
  Consider binomial asset-pricing model. Let ${(X_n^1, dots, X_n^K); n = 0, dots, N}$ be a $K$-dimensional adapted process; i.e., $K$ one-dimensional adapted processes. If, for every $n$ between $0$ and $N-1$ and for every function $f(x^1, dots, x^K)$, there is another function $g(x^1, dots, x^K)$ such that
  $ EE_n [f(X_n^1, dots, X_n^K)] = g(X_n^1, dots, X_n^K), $
  we say that ${(X_n^1, dots, X_n^K); n = 0, dots, N}$ is a $K$-dimensional Markov process.
]

#example[
  We can now turn the maximm-to-date derivative process Markov. Consider the two-dimensional adapted process ${(S_n, M_n); n = 0, dots, N}$ where $S_n$ is the stock price and $M_n$ is the stock price maximum-to-date. 

  Let $Y = S_(n+1)/S_n$, only dependent on the $(n+1)$st coin flip. We want to compute
  $ EE_n [f(S_(n+1), M_(n+1))] = EE_n [f(S_n Y, max(M_n, (S_n, Y)))]. $

  If we let 
  $ g(s, m) = p f (u s, max(m, u s)) + q f (d s, max(m, d s)) $
  We have found a $g$ so that $g(s,m)=EE [ f(S_(n+1), M_(n+1))]$.
]

#remark[
  The Markov property is a "one-step-ahead" property. I.e. the Markov property implies that if $n <= N - 2$, then for every function $h$ there exists a function $f$ so that
  $ EE_(n+1) [h (X_(n+2))] = f(X_(n+1)). $
  This leads us to
  $ EE_n [h(X_(n+2))] = EE_n [ EE_(n+1) [ h (X_(n+2))] ] = EE_n [ f(X_(n+1)) ] $
  or $ EE_n [h(X_(n+2))] = g(X_n). $
  The upshot is that if $0 <= n <= m <= N$ and $h(x^1, dots, x^K)$ is a function, there exists another function $g(x^1, dots, x^K)$ so that
  $ EE_n [h(X_m^1, dots, X_m^K)] = g(X_m^1, dots, X_m^K) $
]
Using the "one-step-ahead" property, we can simplify calculations for the valuation of derivatives. The idea is that we are guaranteed to have a function $v_n$ such that
$ tilde(EE)_n [V_N/(1+r)^(N-n)](flips(n)) = v_n (X_n (flips(n))) " for all " flips(n), $
meaning that
$ V_n = v_n ( X_n ) $
i.e. there exists a function to calculate the value of the derivative. This is summarized in the following theorem:

#theorem("Markov Valuation")[
Let $X_0, dots, X_N$ be a Markov process under risk-neutral probability measure $tilde(PP)$ in the binomial model. Let $v_N (x)$ be a function and consider a security whose payoff at time $N$ is $v_N (X_N)$. Then, for each $n = 0, dots, N$, there exists a function $v_n$ of $X_n$ such that
$ V_n = v_n ( X_n ) , n =0, dots, N . $
There is a recursive algorithm to compute such $v_n$.
]

#example[
  Going back to the max-lookback stock option, we have
  $ V_n = 1/(1+r) tilde(EE)_n [v_(n+1) (S_(n+1), M_(n+1)) ] = 1/(1+r) tilde(EE)_n [v_(n+1) (S_n dot (S_(n+1))/S_n, max ( M_n, S_n dot (S_(n+1))/S_n )) ]. $
  Then,
  $ v_n (s, m) = 1/(1+r) tilde(EE)_n [v_(n+1) (S_n dot (S_(n+1))/S_n, max ( M_n, S_n dot (S_(n+1))/S_n )) ] $
  by the Markov property of the max-lookback stock option. We get
  $ v_n (s, m) = 1/(1+r) [tilde(p) v_(n+1) ( u s, max ( m, u s)) + tilde(q) v_(n+1) ( d s, m) ] $
  Because $d s < m$ if $d <= 1$ (usually assumed), giving us a recursive formula for $v_n$.
]


