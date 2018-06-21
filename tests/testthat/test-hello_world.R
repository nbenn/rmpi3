context("hello_world")

test_that("init and finalization", {
  expect_equal(init(), 1L)
  expect_equal(get_world_size(), 1L)
  expect_equal(get_world_rank(), 0L)
  expect_equal(finalize(), 1L)
})
