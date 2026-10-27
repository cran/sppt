## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 6,
                      fig.height = 5, dpi = 72)

## -----------------------------------------------------------------------------
library(sppt)

## ----quick--------------------------------------------------------------------
res <- sppt(
  data      = vancouver_ct,
  group_col = "id",
  count_col = c("BNER2003", "BNER2025"),
  B         = 999,
  alpha     = 0.05,
  seed      = 42,
  create_maps = FALSE
)

## -----------------------------------------------------------------------------
summary(res)

## -----------------------------------------------------------------------------
table(res$sig_pvalue_dir, useNA = "ifany")

## ----map----------------------------------------------------------------------
sppt_map(res, "pvalue")

## ----map-custom---------------------------------------------------------------
sppt_map(res, "pvalue", legend_position = "right",
         north_arrow = "tl", scale_bar = "br", title = FALSE)

## ----export, eval = FALSE-----------------------------------------------------
# res <- sppt(vancouver_ct, group_col = "id",
#             count_col = c("BNER2003", "BNER2025"),
#             export_maps = TRUE, export_results = TRUE,
#             export_format = "gpkg", export_dir = "sppt_output")

## ----all-options, eval = FALSE------------------------------------------------
# res <- sppt(
#   data               = vancouver_ct,
#   group_col          = "id",
#   count_col          = c("BNER2003", "BNER2025"), # base, then test
#   B                  = 4999,    # bootstrap replicates; odd avoids ties
#   seed               = NULL,    # set for reproducible results
#   alpha              = 0.05,    # unit-level significance level
#   calculate_pvalues  = TRUE,    # bootstrap p-values
#   sameness_tau       = 0.05,    # significance level of the sameness test
#   arrangement        = TRUE,    # Moran's I on the signed evidence surface
#   nsim_moran         = 999,     # permutations for global Moran's I
#   calculate_ci       = FALSE,   # also compute marginal CI overlap (2009)
#   conf_level         = 0.683,   # CI level; matches alpha = 0.05
#   fix_base           = FALSE,   # TRUE = do not bootstrap the base pattern
#   use_percentages    = TRUE,    # percentages (0-100) rather than proportions
#   verbose            = TRUE,    # print the console report
#   create_maps        = TRUE,    # build, print and store the maps
#   map_crs            = NULL,    # CRS for the maps; NULL keeps that of data
#   export_maps        = FALSE,   # save maps as PNG in export_dir
#   export_dir         = NULL,    # required for any export
#   map_dpi            = 300,     # resolution of exported maps
#   export_results     = FALSE,   # save the result
#   export_format      = "gpkg",  # gpkg, shp, csv, txt or rds
#   export_results_dir = NULL     # defaults to export_dir
# )

