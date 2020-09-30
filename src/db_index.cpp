#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
long single_db_index(const double ip, const NumericVector ip_from) {
  if (ip_from[ip_from.size() - 1] <= ip) {return ip_from.size();}

  long start = 0;
  long end   = ip_from.size();
  long mid   = 0;
  long ans   = 0;

  while (start <= end) {
    mid = floor((start + end) / 2);

    if (ip_from[mid] <= ip) {
      start = mid + 1;
    } else {
      ans = mid;
      end = mid - 1;
    }
  }

  return ans;
}

// [[Rcpp::export]]
IntegerVector db_index(const NumericVector ip, const NumericVector ip_from) {
  IntegerVector result(ip.size());

  for (int i = 0; i < ip.size(); i++) {
    result[i] = single_db_index(ip[i], ip_from);
  }

  return result;
}
