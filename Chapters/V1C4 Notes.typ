#import "../base-file.typ": *

#show: dvdtyp.with(
    title: "American Options",
    subtitle: [Volume 1, Chapter 4],
    abstract: ""
)


= American Derivatives

== Introduction
An *American option* allows for exercise at any time. This means that it has more (or at least equal) value than European options because there are more rights associated with the option. The problem that we run into with this instrument is that the process of an American option is a supermartingale under the risk-neutral measure. 

#definition("Intrinsic Value")[The intrinsic value of an option is the value from immediately exercising it. ]

To price an European option, we aim to replicate the option but we have to consider when it is best for the owner to exercise the option, or the *optimal exercise time*. 

== Non-Path-Dependent American Derivatives
The risk-neutral pricing formula developed in chapter 2 implies that the value of an American option is:
$ v_N (s) &= max(g(s), 0) \ v_n(s) &= 1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s)], quad n = N-1, N-2, dots, 0 $
I.e. the risk-neutral expected value. The $Delta$ for the replicating portfolio are defined by 
$ Delta_n = (v_(n+1) (u S_n) - v_(n+1) (d S_n))/((u-d)S_n), quad n = 0, dots, N. $

Now, consider when the holder of an American option will exercise the option. They will exercise the option if the payoff, $g(S_n)$,  from the option is higher than its valuation. This gives us the following modification:
$ v_N (s) &= max(g(s), 0) \ v_n (s) &= max(g(s),1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s)]), quad n = N-1, N-2, dots, 0 $

#example[
    Consider the following tree:
    #example_tree_1
    To find the value of an American put option, expiring at time 2, with strike price 5, we have
    $ v_2 (16) = 0, v_2 (4), " and " v_2(1) = 4. $
    Now,
    $ v_1 (8) &= max(5-8, 2/5(0+1)) = 0.40 \ v_1 (2) &= max(5-2, 2/5(1+4)) = 3 \ $
    leading to
    $ v_1 (4) &= max(5-4, 2/5(0.4+3)) = 1.36 \ $
    If we price the corresponding European put option, we will see that the value of the American option is greater. This illustrates that American derivatives are going to form supermartingales under the risk-neutral probability measure. 

    To see how we can hedge optional exercise, suppose the first flip is a tail. If the owner chooses to exercise, then we are hedging. If the owner chooses to keep the option, the risk-neutral pricing formula states that we need a hedging portfolio valued at $2/5 ( v_2 (4) + v_2 ( 1 )) = 2$, but our hedging portfolio is worth $3$. We can use $\$1$ however we like and still have $\$2$ to set up the hedge, where we sell $1$ share and invest $\$2.50$ in the money market.
]

#theorem("Replication of path-independent American derivatives")[
    Consider an $N$-period binomial asset-pricing model with $0 < d < 1 + r < u$ and $tilde(p) = (1+r-d)/(u-d), tilde(q) = (u-1-r)/(u-d)$. Let $g(s)$ be the payoff function. Define 
$ v_N (s) &= max(g(s), 0) \ v_n (s) &= max(g(s),1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s)]), quad n = N-1, N-2, dots, 0 $ and
$
  Delta_n &= (v_(n+1) (u S_n) - v_(n+1) (d S_n))/((u-d)S_n) \
  C_n &= v_(n) (S_n) - 1/(1+r) [tilde(p) v_(n+1) (u S_n) + tilde(q) v_(n+1) (d S_n)] \
$
for $n = 0, dots, N-1$. Then, $C_n >= 0$ for all $n$ and if $X_0 = v_0 (S_0)$ and 
$ X_(n+1) = Delta_n S_(n+1) + (1+r) (X_n - C_n - Delta_n S_n) $
we have $
X_n (flips(n)) = v_n (S_n (flips(n)))          
$
for all $n$ and $flips(n)$. Further, $X_n >= g(S_n)$ for all $n$. 
]
This theorem is very similar to as in chapter 1 but adapted for American derivatives. $C_n >= 0$ because $v_n(s) >= 1/(1+r) [tilde(p) v_(n+1) (u s) + tilde(q) v_(n+1) (d s)]$ by definition. $X_n >= g(S_n)$ because $X_n(flips(n)) = v_n(S(flips(n))) >= g(s)$ by definition. 

== Stopping Times
We now define a new function to represent what time we should exercise given the sequence of events. 
#definition("Stopping Time")[Define the random variable $tau: Omega -> {0, dots, N, infinity}$, where $tau(flips(n))$ denotes when the owner should *exercise the option*. $infinity$ just means that the owner should let the option expire. Additionally, $tau$ must satisfy the following condition:
- If $tau(flips(n)omega_(n+1) dots omega_N)=n$, then $tau(flips(n) omega_(n+1) ' dots omega_N ') = n$ for all $omega_(n+1) ' dots omega_N '$. ] 
#example[
    If $N=2$, $u=2$, $d=1/2$, $r=1/4$, $S_0=4$, and we are valuing an American put option expiring at time $2$ with strike price $5$ (*our earlier example*), $tau(T T) = tau(T H) = 1$, $tau (H T) = 2$, and $tau(H H) = infinity$, i.e. if the first flip is a tails, we should exercise at time 1; if the first flip is a heads but the second flip is a tails, we should exercise at time 2; and if both flips are heads we should not exercise. 
]
#remark[The condition is given to ensure that the Stopping Time random variable does not depend on future information, i.e. once we stop, the variable does not rely on the future flips. ]

We now want a way to adapt our stochastic processes to "incorporate" early exercise and how the value of a process can be frozen after time $tau$, which leads us to the stopped process. 

#definition("Stopped Process")[
    Let $a and b = min(a, b)$. Define the stopped process $Y_(n and tau)$ by $
    Y_(n and tau)(flips(n)) = cases(Y_n (flips(n)) " if " n >= tau(flips(n)), Y_tau (flips(tau))) " if othersise."
    $
]

#remark[
    We like stopped processes because the original process may be a supermartingale while the stopped process is a martingale. For example, the discounted American put price process $Y_n = (4/5)^n v_n (S_n)$ is a supermartingale because of the benefit of early exercise (in particular, $Y_1 (T) = 2.40 >= 1/2 Y_2 (T H) + 1/2 Y_2 (T T) = 1.60$), but the *stopped process is a martingale*:
    $ 2.40 = Y_(1 and tau) (T) = 1/2 Y_(2 and tau) ( T H ) + 1/2 Y_(2 and tau) (T T) = 1/2 dot 2.40 + 1/2 dot 2.40. $
    We have the following theorems to formalize this remark. 
]
#theorem("Optional Sampling Part 1")[
    A martingale stopped at a stopping time is a martingale. A supermartingale [submartingale]  stopped at a stopping time is also a supermartingale [submartingale].
]
*Proof*: Let $Y_1, dots, Y_N$ be a martingale. If $n < tau$, then $Y_(n and tau) = Y_n = EE Y_(n+1) = EE Y_(n+1 and tau)$. If $n >= tau$, then $Y_(n+1 and tau) = Y_(n and tau)$, resulting in $Y_(n and tau) = EE Y_(n+1 and tau)$. The proof for the supermartingale/submartingale process is similar.
#remark[This theorem, which seems like quite a trivial result, does not hold true without the condition given in the definition of stopping times. ]

#theorem("Optional Sampling Part 2")[
    Let $X_n$ for $n = 0, dots, N$ be a submartingale and let $tau$ be a stopping time. Then $EE X_(n and tau) <= EE X_n$. Likewise, if $X_n$ is a supermartingale, then $EE X_(n and tau) >= EE X_n$. If $X_n$ is a martingale, then $EE X_(n and tau) = EE X_n$. 
]

== General Amercian Derivatives
We now consider American derivative securities that may be path-dependent. 

#definition("American Derivative Security with Intrinic Value Process")[
    Let $G_n$ be a random variable depending on the first $n$ flips $flips(n)$. Then, an *American Derivative Security with Intrinsic Value Process* $G_n$ is a contract that can be exercised at any time prior to time $N$ for payoff $G_n$. Define the price process $V_n$ for this contract by the Amercian risk-neutral pricing formula
    $ V_n = max_(tau in cal(S)_n) tilde(EE)_n [II_{tau <= N} 1/(1+r)^(tau-n) G_tau], " " n = 0, dots, N. $
    Here, $cal(S)$ is the set of stopping times with values in ${n, dots, N, infinity}$. $II$ means indicator, i.e. the inside should equal zero if the stopping-time is $infinity$. 
]

#remark[
    This definition forces $V_N = max(G_N, 0)$,. To see this, If $tau in cal(S)_N$, then $tau$ can only take on the values $N$ or $infinity$. Then, $V_N = max_(tau in cal(S)_N) tilde(EE)_N [II_{tau <= N} 1/(1+r)^(tau-N) G_tau]= max_(tau in cal(S)_N) tilde(EE)_N [II_{tau = N} G_N]$. To maximize this, we can choose $tau = N$ if $G_N flips(N) > 0$ and $tau = infinity$ if $G_N flips(N) <= 0$, leading to $max_(tau in cal(S)_N) tilde(EE)_N [II_{tau = N} G_N = max(0, G_N)$. 
]

#example[
    Consider the following tree of intrinsic values of an American put:
    #two_period_tree(1, -3, 3, -11, 1, 4, "G")
    associated with the corresponding stock price process with $u=2$, $d=1/2$, and $r=1/4$.

    Using our remark, we get that
    $ V_2(H H) = 0, V_2(H T) = V_2(T H) = 1, V_2(T T) = 4. $
    For $n=1$ given $omega_1 = H$, we get
    $ V_1 ( H ) = max_(tau in cal(S)_1) tilde(E)_1 [II_{tau <= 2} (4/5)^(tau - 1) G_tau] (H). $ To maximize, take $tau(H H) = infinity$ and $tau(H T) = 2$ to get $ V_1(H) = 1/2 dot 0 + 1/2 dot (4/5)^(2-1) G_2 (H T) = 0.40 $
    To get $V_1(T)$, take $tau(T T) = tau(T H) = 1$ to maximize, obtaining 
    $tilde(EE)_1 [II_{tau <= 2} (4/5)^(tau - 1) G_tau] (T) = G_1 (T) = 3$. We can verify that $tau( T H ) = tau( T T) = 2$ gives us that $tilde(EE)_1 [dots] = 2$. 

    To maximize $V_0$, $tau(T T) = tau (T H) = 1$, $tau( H H) = infinity$, and $tau (H T) = 2$ works and we get 
    $V_0 = 1/4 dot 0 + 1/4 (4/5)^2 G_2(H T) + 1/2 dot 4/5 dot G_1(T) = 1.36$, as expected.
]

#theorem("Properties of American Derivative Security Process")[
    The American derivative security process has the following properties:
+ $V_n >= max{G_n, 0}$ for all $n$.
+ The discounted process $1/(1+r)^n V_n$ is a supermartingale.
+ If $Y_n$ is another process satisfying $Y_n >= max{G_n, 0}$ for all $n$ and $1/(1+r)^n Y_n$ is a supermartingale, then $Y_n >= V_n$ for all $n$. In other words, $V_n$ is the smallest process satisfying 1 and 2.
]

This theorem is important because property 1 guarantees that the hedging portfolio fully hedges the short position in the derivative security, property 2 guarantees that a hedging portfolio can be constructed (hence $V_n$ is an acceptable price for the seller), and property 3 shows that this is the best price for the buyer.

*Proof*: 
