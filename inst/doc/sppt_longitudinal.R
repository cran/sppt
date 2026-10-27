## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 6,
                      fig.height = 5, dpi = 72)

## -----------------------------------------------------------------------------
library(sppt)

## ----quick--------------------------------------------------------------------
res <- sppt_longitudinal(
  data             = vancouver_ct,
  group_col        = "id",
  count_col        = paste0("BNER", 2003:2025),
  B                = 999,
  alpha            = 0.05,
  seed             = 171717,
  verbose          = FALSE,
  create_maps      = FALSE
)

## -----------------------------------------------------------------------------
# Share of units with no significant change in any period
attr(res, "si_overlap_p")

# Trend classes on the p-value results:
#  2 / -2 significant increase / decrease, 1 / -1 not significant, 0 stable
table(res$BNER_Trend_p)

## -----------------------------------------------------------------------------
attr(res, "interval_table_p_linear")

## ----map----------------------------------------------------------------------
sppt_map(res, "p_trend")

## ----map-custom---------------------------------------------------------------
sppt_map(res, "p_trend", legend_position = "bottom",
         north_arrow = "tl", scale_bar = "br")

## ----export, eval = FALSE-----------------------------------------------------
# res <- sppt_longitudinal(
#   vancouver_ct, group_col = "id", count_col = paste0("BNER", 2003:2025),
#   export_dir       = "sppt_output",
#   export_maps      = TRUE,    # every map
#   map_format       = "tif",   # png, tif, eps, svg or pdf
#   map_dpi          = 600,
#   include_title    = FALSE,   # journals usually set their own captions
#   figure_prefix    = "AndresenFigure",  # AndresenFigure1.tif, ...
#   export_time_plot = TRUE,    # time plot as PNG
#   export_tables    = TRUE,    # S indices and Jenks tables as CSV
#   export_results   = TRUE,    # the result itself
#   export_format    = "gpkg"
# )

## ----all-options, eval = FALSE------------------------------------------------
# res <- sppt_longitudinal(
#   data                = vancouver_ct,
#   group_col           = "id",
#   count_col           = paste0("BNER", 2003:2025), # first = base period
#   B                   = 4999,       # bootstrap replicates; odd avoids ties
#   seed                = NULL,       # set for reproducible results
#   alpha               = 0.05,       # unit-level significance level
#   calculate_pvalues   = TRUE,       # p-value results alongside envelopes
#   conf_level          = 0.683,      # envelope level; matches alpha = 0.05
#   fix_base            = FALSE,      # TRUE = do not bootstrap the base period
#   use_percentages     = TRUE,       # shares (0-100) rather than counts
#   prefix              = NULL,       # output prefix; NULL derives "BNER_"
#   min_zero_streak     = 3,          # final zero periods for sustained zero
#   trend_type          = "linear",   # or "quadratic" (4+ periods)
#   trend_alpha         = 0.05,       # significance level of trend fits
#   jenks               = "optimal",  # or a fixed number of classes
#   jenks_gvf_threshold = 0.05,       # GVF stopping rule for "optimal"
#   verbose             = TRUE,       # print the console report
#   create_maps         = TRUE,       # build, print and store the maps
#   create_time_plot    = TRUE,       # plot totals and envelopes over time
#   export_dir          = NULL,       # required for any export
#   export_maps         = FALSE,
#   map_format          = "png",
#   map_dpi             = 300,
#   map_width_in        = 7,
#   map_height_in       = 5.5,
#   include_title       = TRUE,
#   figure_prefix       = NULL,
#   export_time_plot    = FALSE,
#   export_tables       = FALSE,
#   export_results      = FALSE,
#   export_format       = "gpkg"      # gpkg, shp, csv, txt or rds
# )

