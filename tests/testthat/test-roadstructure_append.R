test_that("adding column", {
  fname <- system.file("shape/nc.shp", package="sf")
  nc <- sf::st_read(fname)
  nc_1 <- nc[1, ]
  nc_1$extra_column = 'mycounty'
  nc_2 = nc[2:3, ]
  nc_new = nc[1:3, ]
  nc_new$extra_column = ifelse(nc_new$CNTY_ID == 1825, 'mycounty', NA)
  nc_new = ncnew[, colnames(nc_1)]
  tstresult = road_structure_append(nc_1, nc_2)

  expect_equal(tstresult, nc_new[1:3, colnames(tstresult)])
})
