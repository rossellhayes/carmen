#include <Rcpp.h>
using namespace Rcpp;

int single_db_index(const double ip, const NumericVector ip_from) {
  int p = floor(ip_from.size() / 9);

  int i = p * (
    (ip_from[8 * p] < ip) + (ip_from[7 * p] < ip) + (ip_from[6 * p] < ip) +
    (ip_from[5 * p] < ip) + (ip_from[4 * p] < ip) + (ip_from[3 * p] < ip) +
    (ip_from[2 * p] < ip) + (ip_from[p] < ip)
  );

  do {i++;} while ((ip_from[i] < ip) && i < ip_from.size());

  return i;
}

// [[Rcpp::export]]
IntegerVector db_index(const NumericVector ip, const NumericVector ip_from) {
  IntegerVector result(ip.size());

  for (int i; i < ip.size(); i++) {
    result[i] = single_db_index(ip[i], ip_from);
  }

  return result;
}
