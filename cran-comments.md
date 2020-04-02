## ozmaps 0.3.5

* Fix for new tibble.  

(CRAN problem results below for the records).

Thank you very much. 

### CRAN problems 2020-04-02 

NOTE: about the size of the package 

```
Version: 0.3.0
Check: installed package size
Result: NOTE
     installed size is 6.8Mb
     sub-directories of 1Mb or more:
     data 5.7Mb
```

WARN: new requirement for tibble 3.0.0

```
Version: 0.3.0
Check: re-building of vignette outputs
Result: WARN
    Error(s) in re-building vignettes:
     ...
    --- re-building 'ozmaps.Rmd' using rmarkdown
    Quitting from lines 52-55 (ozmaps.Rmd)
    Error: processing vignette 'ozmaps.Rmd' failed with diagnostics:
    All columns in a tibble must be vectors.
    x Column `geometry` is a `sfc_MULTIPOLYGON/sfc` object.
    --- failed re-building 'ozmaps.Rmd'
    
    SUMMARY: processing the following file failed:
     'ozmaps.Rmd'
    
    Error: Vignette re-building failed.
    Execution halted
```

Affects

```
Last updated on 2020-04-01 20:48:32 CEST.

r-devel-linux-x86_64-debian-clang	0.3.0	4.67	41.96	46.63	WARN	
r-devel-linux-x86_64-debian-gcc	0.3.0	4.22	32.63	36.85	WARN	
r-devel-linux-x86_64-fedora-clang	0.3.0			55.74	WARN	
r-devel-linux-x86_64-fedora-gcc	0.3.0			56.65	WARN	
r-devel-windows-ix86+x86_64	0.3.0	11.00	51.00	62.00	NOTE	
r-devel-windows-ix86+x86_64-gcc8	0.3.0	10.00	53.00	63.00	NOTE	
r-patched-linux-x86_64	0.3.0	4.75	40.24	44.99	WARN	
r-patched-solaris-x86	0.3.0			84.20	WARN	
r-release-linux-x86_64	0.3.0	4.36	37.97	42.33	WARN	
r-release-windows-ix86+x86_64	0.3.0	8.00	54.00	62.00	NOTE	
r-release-osx-x86_64	0.3.0				NOTE	
r-oldrel-windows-ix86+x86_64	0.3.0	10.00	78.00	88.00	NOTE	
r-oldrel-osx-x86_64	0.3.0				NOTE	
```

## Test environments
* local ubuntu install, R 3.6.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* Size of package harmless note. 

