#' Create bounding box based on buffer size
#'
#' @param points_shape points to be buffered (must be sf object)
#' @param buffer_radius distance in meters
#' @param pjctn_crs projection with meters unit
#'
#' @return returns a bounding box
#' @export
#'
#' @examples
#' \dontrun{
#' boundary_create(my_points, 750, 102039)
#' }
boundary_create = function(points_shape, buffer_radius, pjctn_crs){
  if (is.null(sf::st_crs(pjctn_crs)$units)) {
    stop("CRS must have units")
  }

  points_pjctn = sf::st_transform(points_shape, pjctn_crs)  # reproject
  buffer_pjctn = sf::st_buffer(points_pjctn, buffer_radius)
  bounds_default = sf::st_bbox(sf::st_transform(buffer_pjctn, sf::st_crs(points_shape)))
  return(bounds_default)
}
