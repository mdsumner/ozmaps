# ozmaps dev

* Avoid sf messages, update projection format. Thanks Edzer Pebesma https://github.com/mdsumner/ozmaps/issues/13 .


# ozmaps 0.4.0

* Now using LazyDataCompression xz. 

* Removed names from abs layer geometries see #3, thanks to @AltfunsMA 

# ozmaps 0.3.6

* Fixed large pdf artefact in tests. 

* ozmaps now imports sf because changes in tibble 3.0.0 require that
`vec_proxy.sfc()` be available (introduced to sf in November 2019). Thanks to @krlmlr. 

If sf causes
you problems or you can't work with it get in touch and I will help you. 

* README improvement thanks to Darío Hereñú (@kant). 

# ozmaps 0.3.0

* Updated examples to work with paletteer 1.0.0
