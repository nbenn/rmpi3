
#include <mpi.h>
#include <Rcpp.h>

//' Hello
//'
//' Simple function using Rcpp modules
//'
//' @name init
//' @export
//'
void init() {

  int flag;

  MPI_Initialized(&flag);

  if (flag) {
    Rcpp::warning("mpi has already been initialized.");
  } else {
#ifndef __APPLE__
    if (!dlopen("libmpi.so.1", RTLD_GLOBAL | RTLD_LAZY) &&
        !dlopen("libmpi.so.0", RTLD_GLOBAL | RTLD_LAZY) &&
        !dlopen("libmpi.so", RTLD_GLOBAL | RTLD_LAZY)) {
      Rcpp::stop(dlerror());
    }
#endif
    MPI_Init(NULL, NULL);
  }
}

//' @name finalize
//' @rdname init
//' @export
void finalize() {

  int flag;

  MPI_Finalized(&flag);

  if (flag) {
    Rcpp::warning("mpi has already been finalized.");
  } else {
    MPI_Finalize();    
  }
}

//' @name get_world_size
//' @rdname init
//' @export
int get_world_size() {
  int world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);
  return world_size;
}

//' @name get_world_rank
//' @rdname init
//' @export
int get_world_rank() {
  int world_rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
  return world_rank;
}

RCPP_MODULE(ompi){

    using namespace Rcpp;

    function("init", &init, "documentation for init");
    function("finalize", &finalize, "documentation for finalize");
    function("get_world_size", &get_world_size,
             "documentation for get_world_size");
    function("get_world_rank", &get_world_rank,
             "documentation for get_world_rank");
}


