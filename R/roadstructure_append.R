#' Title
#'
#' @param roads_shp roads (sf object)
#' @param structure_shp structures (such as buildings and walls) (sf object)
#'
#' @return sf object containing all structures and roads
#' @export
#'
road_structure_append = function(roads_shp, structure_shp){
  if (sf::st_crs(roads_shp) != sf::st_crs(structure_shp)){
    stop("Road and structures CRS differ.")
  }
  # synchronize up columns
  cols_add_builds = setdiff(colnames(roads_shp), colnames(structure_shp))
  cols_add_roads = setdiff(colnames(structure_shp), colnames(roads_shp))

  roads_shp[cols_add_roads] <- NA
  structure_shp[cols_add_builds] <- NA
  structure_shp = structure_shp[, colnames(roads_shp)]

  fulldf = rbind(structure_shp, roads_shp)
  return(fulldf)
}
