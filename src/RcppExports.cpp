// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// single_db_index
int single_db_index(const double ip, const NumericVector ip_from);
RcppExport SEXP _carmen_single_db_index(SEXP ipSEXP, SEXP ip_fromSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const double >::type ip(ipSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type ip_from(ip_fromSEXP);
    rcpp_result_gen = Rcpp::wrap(single_db_index(ip, ip_from));
    return rcpp_result_gen;
END_RCPP
}
// db_index
IntegerVector db_index(const NumericVector ip, const NumericVector ip_from);
RcppExport SEXP _carmen_db_index(SEXP ipSEXP, SEXP ip_fromSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector >::type ip(ipSEXP);
    Rcpp::traits::input_parameter< const NumericVector >::type ip_from(ip_fromSEXP);
    rcpp_result_gen = Rcpp::wrap(db_index(ip, ip_from));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_carmen_single_db_index", (DL_FUNC) &_carmen_single_db_index, 2},
    {"_carmen_db_index", (DL_FUNC) &_carmen_db_index, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_carmen(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
