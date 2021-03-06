\encoding{UTF-8}
\name{influence}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{influence}
\alias{zoi.inf}
\alias{tass.inf}
\alias{gates.inf}
\alias{gnomon.inf}
\title{
%%  ~~function to do ... ~~
Influence Functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Compute influence values depending on distance and plant marks, for use in \code{\link{assimilation}}.
}
\usage{
zoi.inf(dx, dy, marks, par = list(k = 0.2, smark = 1))

tass.inf(dx, dy, marks, par = list(b = 3.52 * 0.975, c = 6.1,
    smark = 1))

gates.inf(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))

gnomon.inf(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dx}{
%%     ~~Describe \code{dx} here~~
Vector of x-distances. Points x-coordinates minus plant x-coordinate.
}
  \item{dy}{
%%     ~~Describe \code{dy} here~~
Vector of y-distances. Points y-coordinates minus plant y-coordinate.
}
  \item{marks}{
%%     ~~Describe \code{marks} here~~
Plant mark information.
}
  \item{par}{
%%     ~~Describe \code{par} here~~
List of parameters.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The values of \code{par} must be given in the argument \code{infpar} of \code{assimilation}, they are shown here as examples.

\code{smark} in \code{par} indicates the location of the plant size variable in \code{marks}. It can be a data frame column number, or a string id like "height".

Let \eqn{S} be the plant size, and \eqn{R} be the Euclidean plant-to-point distance \eqn{R = \sqrt{\mathrm{dx}^2 + \mathrm{dy}^2}}{R = sqrt(dx^2 + dy^2)}. Then the influence functions are:
\describe{
\item{\code{zoi.inf}:}{1 if \eqn{R < k S}, 0 otherwise}

\item{\code{tass.inf}:}{\eqn{\max\{0, \, S - c[\exp(R/b) - 1]\}}{max{0, S - c[exp(R/b) - 1]}}}

\item{\code{gates.inf}:}{\eqn{\max\{0, \, [(S/b)^a - R^a]^{1/a}\}}{max{0, [(S/b)^a - R^a]^(1/a)}}}

\item{\code{gnomon.inf}:}{\eqn{\max\{0, \, S - b R^a\}}{max{0, S - b R^a}}}
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Vector of influence values, of length equal to the length of dx and dy.
}
\references{
%% ~put references to the literature/web site here ~
\url{http://forestgrowth.unbc.ca/siplab}

\enc{García}{Garcia}, O. \dQuote{A generic approach to spatial individual-based modelling and simulation of plant communities}. Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6(1), 36-47. 2014.
}
\author{
%%  ~~who you are~~
Oscar \enc{García}{Garcia}.
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{assimilation}}
}

\examples{
# Example multi-species influence function (spruce/hardwoods)
multi.inf <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon.inf(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon.inf(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
