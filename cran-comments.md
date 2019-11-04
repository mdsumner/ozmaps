## Test environments
* local ubuntu install, R 3.6.1
* ubuntu 14.04 (on travis-ci), R 3.6.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 2 notes

* This is a new release.

* The installed size is 5.3Mb, this has been set by simplifying the three inbuilt
 Australian Bureau of Statistics layers (abs_ced, abs_lga, abs_ste) to 4% of
 their original size. I want the detail to be reasonable for any local government
 area in Australia and so I hope this installed size is acceptable. The package 
 itself is under 3.5Mb.  
 
