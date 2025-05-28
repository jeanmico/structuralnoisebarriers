#' Read user-supplied file of points
#'
#' @param points_file path to an sf object file
#'
#' @return a dataframe
#' @export
#'
#' @examples
points_read <- function(points_file) {
  sf::read_sf(points_file)
}
