\encoding{UTF-8}
\name{kernel}
\alias{kernel}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{powers.ker}
\alias{spurr.ker}
\alias{staebler.ker}
\title{
%%  ~~function to do ... ~~
Competition Kernel Functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Functions representing the effect of a competitor on a subject plant, depending on distance and plant marks. For use in \code{\link{pairwise}}.
}
\usage{
powers.ker(imarks, jmarks, dists, dranks, par = list(pi=1, pj=1,
    pr=1, smark = 1))

staebler.ker(imarks, jmarks, dists, dranks, par = list(k=0.1, p=1,
    smark=1))

spurr.ker(imarks, jmarks, dists, dranks, par = list(type=1,
    smark=1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{imarks}{
%%     ~~Describe \code{imarks} here~~
Marks for the subject plant, a 1-row data frame.}
  \item{jmarks}{
%%     ~~Describe \code{jmarks} here~~
Data frame with marks for competitors}
  \item{dists}{
%%     ~~Describe \code{dists} here~~
Vector of distances between the subject plant and the competitors.}
  \item{dranks}{
%%     ~~Describe \code{dranks} here~~
Distance ranks.}
  \item{par}{
%%     ~~Describe \code{par} here~~
List of parameters.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The values of \code{par} must be given in the argument \code{kerpar} of \code{pairwise}, they are shown here as examples.

\code{smark} in \code{par} indicates the location of the plant size variable in \code{marks}. It can be a data frame column number, or a string id like "dbh".

Competition kernels seem to be limited only by the researchers imagination.
\code{powers.ker} is a general form that includes many examples from the literature. If \eqn{S_i}{Si} is the size of the subject plant, \eqn{S_j}{Sj} the size of the competitor, and \eqn{R} is the distance between them, then this kernel is \eqn{(S_j^{p_j} / S_i^{p_i}) / R^{p_r}}{(Sj^pj / Si^pi) / R^pr}. For instance, the popular Hegyi's index corresponds to \code{pi=1, pj=1, pr=1}.
This and other examples could be coded directly if computational efficiency is important, see the  example below.

\code{staebler.ker} is the width of the overlap of zones of influence (ZOI), used by Staebler in 1951. Assumes that the ZOI radius is \eqn{k S^p}, where \eqn{S} is size.

\code{spurr.ker} is an example of an index that depends on distance ranks: equations (9.5a), (9.5b) of Burkhart and \enc{Tomé}{Tome} (2012).
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Vector of length equal to the length of \code{dists}.
}
\references{
%% ~put references to the literature/web site here ~
\url{http://forestgrowth.unbc.ca/siplab}

Burkhart, H. E. and \enc{Tomé}{Tome}, M. (2012) \emph{Modeling Forest Trees and Stands}. Springer.

\enc{García}{Garcia}, O. \dQuote{Siplab, a spatial individual-based plant modelling system}. Computational Ecology and Software 4(4), 215-222. 2014.
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
\code{\link{pairwise}}
}
\examples{
# Originally Hegyi added one foot to the distance:
hegyi.orig <- function(imarks, jmarks, dists, dranks, par) {
# Assume coordinates in meters, and that dbh is labeled 'dbh'
    (jmarks$dbh / imarks$dbh) / (dists + 0.30481)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
