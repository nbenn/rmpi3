
#include <Rcpp.h>
#include <mpi.h>

//' Hello
//'
//' Simple function using Rcpp modules
//'
//' @name init
//' @export
//'
int init() {

  int flag;

  MPI_Initialized(&flag);

  if (flag) {
    return 1;
  }

  MPI_Init(NULL, NULL);

  return 1;
}

//' @name finalize
//' @export
int finalize() {
  MPI_Finalize();
  return 1;
}

//' @name get_world_size
//' @export
int get_world_size() {
  int world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);
  return world_size;
}

//' @name get_world_rank
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


