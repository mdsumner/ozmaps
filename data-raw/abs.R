## ozmaps.data version 0.0.1
##these are simplified versions of a core set, see ozmaps.data for details
file.copy(list.files("../ozmaps.data/data", pattern = "^abs.*\\.rda$", full.names = TRUE),
          "data")
