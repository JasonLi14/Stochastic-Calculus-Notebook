#import "../base-file.typ": *


#show: dvdtyp.with(
    title: "Binomial Asset Pricing Model",
    subtitle: [Volume 1, Chapter 1],
    abstract: ""
)

= Binomial Asset Pricing Model 

== Notation
- *Time 0*: Very start of the period. *Time 1*: End of the first period.
- *$S_0$*: Stock price at time 0. *$S_1(H)$* is price at time 1 if coin flip is heads, *$S_1(H)$* is price at time 1 if coin flip i tails.
- *$p$* is probability of heads, *$q$* $ = 1-p$ is probability of tails.
- *$r$* is the interest rate, where $1$ dollar invested at time zero yields $1 + r$ at time one.
- *$K$* is the strike price for European call options.

== One-Period Binomial Model
*Main Idea*: Consider the following diagram.

#set align(center)

#figure(
    cetz.canvas({
  import cetz.draw: *
  // Branches
  line((0.5, 0), (3, 1.5))
  line((0.5, 0), (3, -1.5))

  // Labels
  content((0, 0), [$S_0$], anchor: "west")
  content((3.3, 1.5), [$S_1(H)=u S_0$], anchor: "west")
  content((3.3, -1.5), [$S_1(T) = d S_0$], anchor: "west")

  // Time labels
  content((0, -2.5), [$t = 0$])
  content((3.5, -2.5), [$t = 1$])

}), caption: "One-period binomial model")

#set align(left)
We know the outcome of the coin toss at time 1, but not time 0. Define 
$ u = (S_1(H))/S_0, " " d = (S_1(T))/S_0. $ 
with $d < u$. 

#definition("Arbitrage")[A trading strategy that begins with no money, has zero probability of losing money, and positive probability of making money. ]
#remark[We assume that there is no arbitrage in our analysis. Otherwise, we get contradictions because we can basically get infinite wealth generation. ]

#remark[To prevent arbitrage, we must have $0 < d < 1 + r < u$. 

Otherwise, If $d >= 1 + r$, borrow money and buy the stock with the borrowed money, and the stock will always earn enough to pay off the borrowed money. If $u <= 1 + r$, short the stock and use the proceeds in the money market, which will earn enough interest to buy back the stock at time 1. The converse is true. ]

Stock prices obviously do not move like this, but given a sufficient number of periods, this helps approximate continuous-time models. 

#definition("European Call Option")[A European call option gives its owner the right, but not the obligation, to buy one share of the stock at time one for strike price $K$ at a certain point in time. ]
We consider the case where $S_1(T) < K < S_1(H)$. Observe that if we flip tails, the option expires worthless, but if we flip heads, the option has a payoff of $S_1(H) - K$. 

#definition("Arbitrage Pricing Theory")[Pricing options by replicating the option by trading in the stock and money markets. ]
#remark[If we can get the same returns using the stock and money markets as we get from the option, then they should be valued at the same price. ]

#example[Consider the following: 

#set align(center)

#figure(
    cetz.canvas({
  import cetz.draw: *
  // Branches
  line((0.5, 0), (3, 1.5))
  line((0.5, 0), (3, -1.5))

  // Labels
  content((0, 0), [$S_0 = 4$], anchor: "east")
  content((3.3, 1.5), [$S_1(H)=8$], anchor: "west")
  content((3.3, -1.5), [$S_1(T) = 2$], anchor: "west")

  // Time labels
  content((0, -2.5), [$t = 0$])
  content((3.5, -2.5), [$t = 1$])

}), caption: "Example one-period binomial model")

#set align(left)
With $r = 1/4$ and $K = 5$. Observe that if we have an initial wealth of $X_0 = 1.20$, borrow $0.80$ to spend $2.00$ on $1/2$ shares at time zero, then
$ X_1(H) = 1/2S_1(H) - (1+r)(0.80) = 3 $
and
$ X_1(T) = 1/2S_1(T) - (1+r)(0.80) = 0 $
which match the payoffs of the option! We have replicated the European call option, meaning that the option *must be worth the initial wealth* of $1.20$. 

If the option was worth more than $1.20$, we could short the option and buy the replicating portfolio (i.e. buy $1/2$ shares and borrow $0.80$). If the option was worth less than $1.20$, we could buy the option and short the replicating portfolio (i.e. short sell $1/2$ shares and invest $0.80$ in the money market). Both cases result in an *arbitrage opportunity*.
]

There are a few assumptions made:
- We can buy fractional shares.
- Interest rate for investing is the interest rate for borrowing.
- Purchase price of stock is the same as its selling price.
- Stock prices can be only one of two values in the next period.

#definition("Derivative Security")[A derivative security is a security that pays, at time 1, $V_1(H)$ if the coin toss is heads and $V_1(T)$ if the coin toss is tails ]

To get the price of a derivative security at time 0, we replicate the security. We can derive a formula for this. Let $X_0$ be the value of the replicating portfolio, and hence, the *value of the option*. Let $Delta_0$ be the number of shares of stock we buy at time 0. The value of the replicating portfolio at time 1 is
$ X_1 = underbrace(Delta_0 S_1, "Position in stocks") + underbrace((1+r)(X_0 - Delta_0 S_0), "Amount due on borrowed") = Delta_0(S_1 - (1+r)S_0) + (1+r)X_0 $
We want to find $X_0$ and $Delta_0$ so that $X_1(T) = V_1(T)$ and $X_2(H) = V_2(H)$.

Define $tilde(p)$ and $tilde(q) = 1 - tilde(p)$ to be the values satisfying
$ S_0 = 1/(1+r) [tilde(p) S_1(H) + tilde(q) S_1(T)] $
This is similar to calculating the expected value for $S_0$. Equating $X_1(H) = V_1(H)$ and $X_1(T) = V_1(T)$, we have
#named_equations($X_0 + Delta_0 (1/(1+r) S_1(H) - S_0) &= 1/(1+r)V_1(H)  \ X_0 + Delta_0 (1/(1+r) S_1(T) - S_0) &= 1/(1+r)V_1(T)$, $ast$) 
We can add these equations together, multiplied by $tilde(p)$ and $tilde(q)$, to get
$ X_0 + Delta_0(1/(1+r)[tilde(p)S_1(H) + tilde(q) S_1(T)] - S_0) = 1/(1+r)[tilde(p) V_1(H) + tilde(q) V_1(T)]. $
Because of how we defined $tilde(p)$ and $tilde(q)$, we get 
$ X_0 = X_0 + Delta_0 (S_0 - S_0) = 1/(1+r)[tilde(p)V_1(H) + tilde(q)V_1(T)]. $
To solve for $tilde(p)$, we have
$ S_0 &= 1/(1+r)(tilde(p)u S_0 + (1- tilde(p) d S_0) \
1 + r &= tilde(p)u + (1- tilde(p)) d $
Which gives us
$ tilde(p) &= (1+r-d)/(u-d). $ <eq:rn-u>
Hence, we obtain 
$ tilde(q) = (u - 1 - r)/(u - d). $ <eq:rn-d>
To solve for $Delta_0$, we subtract the equalities in $ast$ to obtain
$ Delta_0 = (v_1(H)-V_1(T))/(S_1(H)-S_1(T)) $
Therefore, we should value the security at
$ V_0 = 1/(1+r)[tilde(p)V_1(H) + tilde(q)V_1(T)] $

#definition("Risk Neutral Probabilities")[We call $tilde(p)$ and $tilde(q)$ the risk-neutral probabilities.]
#remark[$tilde(p)$ and $tilde(q)$ are indeed probabilities as they sum to $1$ and are non-negative. They represent the probabilities of the coin flip so that the *expected* growth rate of the stock is equal to $r$. In fact, because investors compensate for risk, if $p$ and $q$ represent the actual probabilities of the coin toss, 
$ S_0 &< 1/(1+r)[p S_1(H) + q S_1(T)] \
1/(1+r)[tilde(p) S_1(H) + tilde(q) S_1(T)] &< 1/(1+r)[p S_1(H) + q S_1(T)]
$ ]
#remark[We do not worry about the actual probabilities for valuation! We have constructed a replicating portfolio for the option, so the probabilities of up and down are irrelevant. Our replicating portfolio must earn the risk-free return. ]

== Multiperiod Binomial Model
What happens if we have multiple periods?
#figure(
    cetz.canvas({
  import cetz.draw: *
  // Branches
  line((0.5, 0), (1.5, .5))
  line((0.5, 0), (1.5, -.5))
  line((4, .5), (5, 1.2))
  line((4, .5), (5, 0))
  line((4, -.5), (5, 0))
  line((4, -.5), (5, -1.2))
  line((8.8, 1.2), (9.8, 2))
  line((8.8, 1.2), (9.8, .6))
  line((8.8, 0), (9.8, .6))
  line((8.8, 0), (9.8, -.6))
  line((8.8, -1.2), (9.8, -.6))
  line((8.8, -1.2), (9.8, -2))

  // Labels
  content((0, 0), [$S_0$], anchor: "west")
  content((1.6, .5), [$S_1(H)=u S_0$], anchor: "west")
  content((1.6, -.5), [$S_1(T) = d S_0$], anchor: "west")
  content((5.2, 1.2), [$S_2(H H) = u^2 S_0$], anchor: "west")
  content((5.2, 0), [$S_2(H T) &= S_1(T H) \ &= d u S_0 $], anchor: "west")
  content((5.2, -1.2), [$S_2(H H) = d^2 S_0$], anchor: "west")
  content((10, 2), [$S_3(H H H) = u^3 S_0$], anchor: "west")
  content((10, 0.4), [$S_3(H H T) &= S_3(H T H) = \ S_3(T H H) &=  u^2 d S_0$], anchor: "west")
  content((10, -0.9), [$S_3(H T T) &= S_3(T H T) = \ S_3(T T H) &=  u d^2 S_0$], anchor: "west")
  content((10, -2), [$S_3(T T T) = d^3 S_0$], anchor: "west")

  // Time labels
  content((0, -3), [$t = 0$], anchor: "west")
  content((1.6, -3), [$t = 1$], anchor: "west")
  content((5.2, -3), [$t = 2$], anchor: "west")
  content((10, -3), [$t = 3$], anchor: "west")

}), caption: "Three-period binomial model")

To get the price using an $N$-period binomial model, we can work backwards. The idea is that at each time, we readjust the replicating portfolio/hedge to get risk-free returns. We can therefore extend the one-period case recursively. 

More precisely, the wealth equation gives us the value of the replicating portfolio starting at time $t = 0$:
$ X_(n+1) = underbrace(Delta_n S_(n+1), "Value of shares held since" t = n "at new price") + underbrace((1+r)(X_n - Delta_n S_n), "Money market investment"). $
To replicate a derivative with value $V_n$, we want to find the corresponding $Delta_i$ (for all nodes of the tree) and value of $X_i$ so that 
$ X_n (omega_1 dots omega_n) = V_n (omega_1 dots omega_n) $
for any outcomes $omega_i$. In other words, we look for a hedging strategy so that in the case of any outcome of up and down movements (the coin flips), *the value of the replicating portfolio is equal to the value of the derivative*. We get the following theorem by applying the one-period model:

#theorem("Replication in the multiperiod binomial model")[
Consider an $N$-period binomial asset-pricing model, with $0 < d < 1 + r < u$ (to prevent arbitrage), and define
$ tilde(p) = (1+r-d)/(u-d), " " tilde(q) = (u - 1 - r)/(u-d). $

Let $V_N$ be a random variable (representing the value of a derivative security's payoff at time $N$) which is dependent on the first $N$ coin tosses $omega_1 omega_2 dots omega_n$. For $i = 0, 1, dots, N-1$, define
$ V_i (omega_1 dots omega_i) = 1/(1+r) [tilde(p) V_(n+1) (omega_1 ... omega_i H) + tilde(q) V_(n+1) (omega_1 ... omega_i T)] $
and also set 
$ Delta_i (omega_1 dots omega_i) = frac(V_(n+1)(omega_1 dots omega_i H) - V_(n+1)(omega_1 dots omega_i T), S_(n+1)(omega_1 dots omega_i H) - S_(n+1)(omega_1 dots omega_i T)). $
Forward recursively define 
$ X_(i+1) = Delta_i S_(i+1) + (1+r)(V_i - Delta_i S_i) $
Then, 
$ X_N (omega_1 dots omega_N) = V_N(omega_1 dots omega_N) $
for all $omega_1 dots omega_N$.
]
#definition("Price of Derivative")[Given that the first $n$ tosses are $omega_1 dots omega_n$, define the price of the derivative security at time $n$ to be $V_n (omega_1 ... omega_n)$. Therefore, the price of the derivative security at time zero is $V_0$. ]

#example[
  Let $u = 2$, $d = 1/2$, $N=3$, $S_0=4$, and $r = 1/4$. Then, $tilde(p) = tilde(q) = 1/2$. Consider a lookback option that pays $V_3 = max_(0 <= n <= 3) S_n - S_3$. Then,
  $ V_3(H H H) &= S_3 (H H H) - S_3 (H H H) &= 32 - 32 &= 0 \
  V_3(H H T) &= S_3 (H H) - S_3 (H H T) &= 16 - 8 &= 8 \
  V_3(H T H) &= S_3 (H) - S_3 (H H T) &= 8 - 8 &= 0 \
  V_3(H T T) &= S_3 (H) - S_3 (H T H) &= 8 - 2 &= 6 \
  V_3(T H H) &= S_3 (T H H) - S_3 (H T T) &= 8-8 &= 0 \
  V_3(T H T) &= S_3 (T H) - S_3 (T H T) &= 4 - 2 &= 2 \
  V_3(T T H) &= S_0 - S_3 (T T H) &= 4 - 2 &= 2 \
  V_3(T T T) &= S_0 - S_3 (H H T) &= 4 - 0.50 &= 3.50 \
  $
  We get
  $ V_2 (H H) &= 4/5 [1/2 V_3(H H H) + 1/2 V_3 ( H H T)] &= 3.20 \
  V_2 (H T) &= 4/5 [1/2 V_3(H T H) + 1/2 V_3 ( H T T)] &= 2.40 \
  V_2 (T H) &= 4/5 [1/2 V_3(T H H) + 1/2 V_3 ( T H T)] &= 0.80 \
  V_2 (T T) &= 4/5 [1/2 V_3(T T H) + 1/2 V_3 ( T T T)] &= 2.20 $ 
  and 
  $ V_1 (H) &= 4/5 [1/2 V_3(H H) + 1/2 V_3 (H T)] &= 2.24 \
  V_1 (T) &= 4/5 [1/2 V_3(T H) + 1/2 V_3 ( T T)] &= 1.20 $ 
  giving us an option value of 
  $ V_0 = 4/5 [1/2 V_1(H) + 1/2 V_1(T)] = 1.376. $
]
*Proof of Theorem*: We prove by induction on $n$ that $X_n (omega_1 dots omega_n) = V_n (omega_1 dots omega_n)$. The base case, $n =0$, is true because we defined $X_0 = V_0$. 

For the induction step, assume that our hypothesis holds true for some $n < N$. We show that it holds for $n + 1$. Fix a sequence of coin flips $Omega = omega_1 dots omega_(n+1)$. If $omega_(n+1) = H$, then
#named_equations($ X_(n+1) (Omega H) = (1+r)X_n(Omega) - Delta_n (Omega) S_n (Omega)(u - (1+r)) .$, $ast$) Our formula for $Delta_n$ gives
$ Delta_n = (V_(n+1)(Omega H) -V_(n+1)(Omega T))/(S_(n+1)(Omega H) - S_(n+1) (Omega T)) = (V_(n+1)(Omega H) -V_(n+1)(Omega T))/(u S_n (Omega) - d S_n (Omega)) $
Substituting this into $(ast)$, we get
$ X_(n+1)(Omega H) &= (1+r)X_n (Omega)  + Delta_n S_n (Omega) (u - (1+r)) \ 
&= (1+r)V_n (Omega)  + Delta_n S_n (Omega) (u - (1+r)) "                             " &"Induction Hypothesis"\ 
&= (1+r)V_n (Omega) + (V_(n+1)(Omega H) - V_(n+1)(Omega T))/((u - d)S_n (Omega)) S_n (Omega) (u - (1+r)) &"Substitution" \ 
&= (1+r)V_n (Omega) + (V_(n+1)(Omega H) - V_(n+1)(Omega T))(tilde(q)) &tilde(q) = (u - 1 - r)/(u-d) \ 
&= tilde(p)V_(n+1) (Omega H) + tilde(q) V_(n+1) (Omega T) + (V_(n+1)(Omega H) - V_(n+1)(Omega T))(tilde(q)) &"Recursion for" V_n  \
&= tilde(p)V_(n+1) (Omega H) + tilde(q) V_(n+1)(Omega H) = V_(n+1)(Omega H) & \ $
as required. $square$

== Computational Considerations <comp_considerations_binomial>
- If we compute naively for $V_0$, where we do the full recursion for each node, the computational complexity is $in O(2^N)$. 
- Observe that at time $n$, there are only $n+1$ possible stock prices. Therefore, it is reasonable to store intermediate results, reducing computational complexity. 
- The idea is that for each time, starting from the back, we compute the valuation given a price, i.e. we find $v_n(s)$ for time $n$ and stock price $s$, which should yield
$ v_n(s) = 1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s) ]. $ 


