#include <Rcpp.h>
using namespace Rcpp;

int single_db_index(const double ip, const NumericVector ip_from) {
  NumericVector ip_less = ip_from[ip_from <= ip];
  int ip_length         = ip_less.size();
  return ip_length;
}

// [[Rcpp::export]]
IntegerVector db_index(const NumericVector ip, const NumericVector ip_from) {
  IntegerVector result(ip.size());

  for (int i; i < ip.size(); i++) {
    result[i] = single_db_index(ip[i], ip_from);
  }

  return result;
}
