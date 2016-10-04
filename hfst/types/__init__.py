"""
transducer implementation types


Attributes:

  SFST_TYPE:               SFST type, unweighted
  TROPICAL_OPENFST_TYPE:   OpenFst type with tropical weights
  LOG_OPENFST_TYPE:        OpenFst type with logarithmic weights (limited support)
  FOMA_TYPE:               FOMA type, unweighted
  XFSM_TYPE:               XFST type, unweighted (limited support)
  HFST_OL_TYPE:            HFST optimized-lookup type, unweighted
  HFST_OLW_TYPE:           HFST optimized-lookup type, weighted
  HFST2_TYPE:              HFST version 2 legacy type
  UNSPECIFIED_TYPE:        type not specified
  ERROR_TYPE:              (something went wrong)

"""

from libhfst import ERROR_TYPE, FOMA_TYPE, HFST2_TYPE, \
HFST_OLW_TYPE, HFST_OL_TYPE, LOG_OPENFST_TYPE, SFST_TYPE, \
TROPICAL_OPENFST_TYPE, UNSPECIFIED_TYPE, XFSM_TYPE
