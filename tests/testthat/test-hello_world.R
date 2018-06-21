context("hello_world")

test_that("init and finalization", {
  expect_silent(val <- init())
  expect_equal(val, NULL)
  expect_warning(init(), "mpi has already been initialized")
  expect_equal(get_world_size(), 1L)
  expect_equal(get_world_rank(), 0L)
  expect_silent(val <- finalize())
  expect_equal(val, NULL)
  expect_warning(finalize(), "mpi has already been finalized")
})
