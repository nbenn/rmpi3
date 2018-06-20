### SHELL> mpirun -np 2 Rscript --vanilla demo/hello_world.R

library(rmpi3)

init()

world <- get_world_size()
rank <- get_world_rank()

message("hello world from rank ", rank, " of ", world, ".")

finalize()
