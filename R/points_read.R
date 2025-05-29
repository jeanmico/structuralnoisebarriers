#' Read user-supplied file of points
#'
#' @param points_file path to an sf object file
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' \dontrun{
#' points_read("path/to/my/file")
#' }
points_read <- function(points_file) {
  sf::read_sf(points_file)
}
