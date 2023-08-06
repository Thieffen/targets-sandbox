library(targets)

# execute ETL -------------------------------------------------------------
Sys.setenv(TAR_PROJECT = "project_etl")
tar_make()


# produce rapport A -------------------------------------------------------
Sys.setenv(TAR_PROJECT = "project_rapport_A")
tar_make()