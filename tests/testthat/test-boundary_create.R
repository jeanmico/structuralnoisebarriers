test_that("CRS no units error", {
  tstpts = data.frame(lon = c(-71.778246, -71.776622),
                      lat = c(42.254431, 42.251837))
  tstpts = sf::st_as_sf(tstpts, coords = c("lon", "lat"), crs=4326)
  sf::st_crs(tstpts) = 4326
  expect_error(boundary_create(tstpts, 750, 4326), "CRS must have units")
})

test_that("boundary accurate", {
  tstpts = data.frame(lon = c(-71.778246, -71.776622),
                      lat = c(42.254431, 42.251837))
  tstpts = sf::st_as_sf(tstpts, coords = c("lon", "lat"), crs=4326)
  sf::st_crs(tstpts) = 4326
  expect_equal(round(boundary_create(tstpts, 750, "ESRI:102039"), 5),
               sf::st_bbox(c(xmin = -71.78740, xmax = -71.76747,
                             ymax = 42.26114, ymin = 42.24513),
                           crs = sf::st_crs(4326)))
})
