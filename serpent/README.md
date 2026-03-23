# Serpent:

The Serpent docs are [here](https://serpent.vtt.fi/docs/index.html).  

- `xsdata-tutorial.pdf` gives a tutorial on how to convert MCNP xsdir library
files into the xsdata format used by Serpent.
- `append_data.py` has one function, which is for aggregating decay, spontaneous
fission yield, and neutron-induced fission yield data into `.dec`, `.sfy`, and
`.nfy` libraries.  ENDF publishes this data publically.  For example, ENDFVIII.0 can be found [here](https://www.nndc.bnl.gov/endf-b8.0/download.html)
