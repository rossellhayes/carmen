#include <Rcpp.h>
using namespace Rcpp;

int single_db_index(const double ip, const NumericVector ip_from) {
  if (ip_from[ip_from.size() - 1] <= ip) {return ip_from.size();}

  int p = floor(ip_from.size() / 49);

  int i = p * (
    (ip_from[48 * p] < ip) + (ip_from[47 * p] < ip) + (ip_from[46 * p] < ip) +
    (ip_from[45 * p] < ip) + (ip_from[44 * p] < ip) + (ip_from[43 * p] < ip) +
    (ip_from[42 * p] < ip) + (ip_from[41 * p] < ip) + (ip_from[40 * p] < ip) +
    (ip_from[39 * p] < ip) + (ip_from[38 * p] < ip) + (ip_from[37 * p] < ip) +
    (ip_from[36 * p] < ip) + (ip_from[35 * p] < ip) + (ip_from[34 * p] < ip) +
    (ip_from[33 * p] < ip) + (ip_from[32 * p] < ip) + (ip_from[31 * p] < ip) +
    (ip_from[30 * p] < ip) + (ip_from[29 * p] < ip) + (ip_from[28 * p] < ip) +
    (ip_from[27 * p] < ip) + (ip_from[26 * p] < ip) + (ip_from[25 * p] < ip) +
    (ip_from[24 * p] < ip) + (ip_from[23 * p] < ip) + (ip_from[22 * p] < ip) +
    (ip_from[21 * p] < ip) + (ip_from[20 * p] < ip) + (ip_from[19 * p] < ip) +
    (ip_from[18 * p] < ip) + (ip_from[17 * p] < ip) + (ip_from[16 * p] < ip) +
    (ip_from[15 * p] < ip) + (ip_from[14 * p] < ip) + (ip_from[13 * p] < ip) +
    (ip_from[12 * p] < ip) + (ip_from[11 * p] < ip) + (ip_from[10 * p] < ip) +
    (ip_from[ 9 * p] < ip) + (ip_from[ 8 * p] < ip) + (ip_from[ 7 * p] < ip) +
    (ip_from[ 6 * p] < ip) + (ip_from[ 5 * p] < ip) + (ip_from[ 4 * p] < ip) +
    (ip_from[ 3 * p] < ip) + (ip_from[ 2 * p] < ip) + (ip_from[     p] < ip)
  );

  do {i++;} while (ip_from[i] <= ip);

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
