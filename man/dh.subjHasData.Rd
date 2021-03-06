% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subj-has-data.R
\name{dh.subjHasData}
\alias{dh.subjHasData}
\title{Indicate whether subject has any non-missing values in a set of variables}
\usage{
dh.subjHasData(conns = opals, df, vars, new_label)
}
\arguments{
\item{conns}{connection object for DataSHIELD backends}

\item{df}{datashield dataframe}

\item{vars}{= vector of variable names in dataframe}

\item{new_label}{= label which forms the suffix for the two created variables}
}
\value{
None. Two new variables are variables created within the opal
        environment. The first indicates how many of the variables each
        subject has a non-missing value on. The second indicates whether
        subjects have non-missing values on at least one of these variables.
}
\description{
At some point in the analysis you will want to subset your dataset to contain
only subjects meeting some criteria, e.g. data on at least one exposure and
one outcome. This function speeds things up by indicating whether a subject
has any non-missing values for a given set of variables.
}
