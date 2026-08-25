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
