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
    $PP(Z > 0) - 1$,
    $EE Z = 1$,
    $tilde(EE) Y = EE [Z Y]$ + " for any random variable " + $Y$
  )
]
