# star-wars-droid-namer
A very simple gem wrapping up the process of generating random star wars droid names based on various flags and options.

Example output from basic command
```
  > star_wars_droid_namer generate R2
  R2-E0 serial: R2-N8N3UJFP-C2-L2-1FFI-67PU22EU-NN-9LK2-CJ-9OEALBPH-N4-A2-TB4Q-E0

  > star_wars_droid_namer generate R2 -number_to_generate=5
  R2-E0 serial: R2-N8N3UJFP-C2-L2-1FFI-67PU22EU-NN-9LK2-CJ-9OEALBPH-N4-A2-TB4Q-E0
  R2-HQ serial: R2-JE4YHMAS-KS-FV-3TJ3-H2FADSKO-GQ-WIHP-BA-U8AF2IBN-1F-3S-A74O-HQ
  R2-9W serial: R2-RHKGQ6M2-5Q-WE-LZJL-4RZ975MZ-AL-9ID5-SF-76HXAZWC-D8-OL-3JTD-9W
  R2-7E serial: R2-O8JPOEGH-1M-UU-K81Z-TWISDQQL-UO-AOV6-U1-SPBOZADU-VP-W1-QZQE-7E
  R2-NK serial: R2-0LKF8Q1L-PB-CV-1313-KS02CCH8-LL-V3NB-66-UOABRPSO-3A-A1-0B98-NK

  > star_wars_droid_namer generate HK --use_pattern="XXXXXXXX-XXXXXXXX"
  R2-E0 serial: R2-N8N3UJFP-67PU22EU-E0

  > star_wars_droid_namer generate LOM --treat_as_droid_manufacturer --number_to_generate=1
  4-LOM serial: 4-LOM-N8N3UJFP-C2-L2-1FFI-67PU22EU-NN-9LK2-CJ-9OEALBPH-N4-A2-TB4Q-E0
```
It makes sense for droids to have much longer serial numbers which explains why sometimes a Droid may have a different short name (think nickname) which doesn't match their actual model type. Owners of a droid will see patterns in the emitted output which will point them to a more distinctive personal nick name.

As an example from the above output
```
   R2-NK serial: R2-0LKF8Q1L-PB-CV-1313-GR3GOCH8-LL-V3NB-66-UCANTESO-3A-A1-0B98-NK
```
The owner might refer to this droid as  "grego" or "canty"


## Installation
```
gem install star_wars_droid_namer
```
or add to your Gemfile
```
gem 'star_wars_droid_namer'
```

## Command Line usage examples
```
star_wars_droid_namer generate R2
```
will generate a droid name for the R2 family of droids that conforms to the R2-[alphanumeric][alphanumeric] pattern and includes the fuller droid serial number.

```
star_wars_droid_namer generate LOM --treat_as_droid_manufacturer
```
will generate a LOM droid name conforming to the [alphanumeric]-LOM pattern and includes the fuller droid serial number.

```
star_wars_droid_namer generate LOM --treat_as_droid_manufacturer --number_to_generate=5
```
will generate 5 LOM droid names

```
star_wars_droid_namer generate R2 --use_pattern="XXXXXXXX-XXXXXXXX" --number_to_generate=2
```
will generate 2 R2 droid names conforming to the R2-XXXXXXXX-XXXXXXXX-[alphanumeric][alphanumeric] pattern

Example non manufacturer droid prefixes: R1, R2, R3, R4, R5, G8, C2, BB, K, HK, RA, C1, U9, M5, etc...
Example manufacturer droid postfixes: 3PO (C-3PO) , LOM (4-LOM)  (use the --treat_as_droid_manufacturer flag)
```

Or use the api directly
```
require "star_wars_droid_namer"
swdn = StarWarsDroidNamer::Api.new
droid_name = swdn.generate_droid_name( "R2", {:treat_as_droid_manufacturer => false } )
puts droid_name
```

## Building / testing / installing this gem from source
```
rake  (runs specs)
rdoc  (builds docs)
gem build star_wars_droid_namer.gemspec          (update version before build)
gem install ./star_wars_droid_namer-1.0.0.gem    (update version before install)
irb
> require "star_wars_droid_namer"
> swdn = StarWarsDroidNamer::Api.new
> droid_name = swdn.generate_droid_name( "R2", {:treat_as_droid_manufacturer => false } )
> puts droid_name
> droid_name = swdn.generate_droid_name( "R2", {:treat_as_droid_manufacturer => false, :use_pattern => 'XXXX-XXXX-XXXX'} )
> puts droid_name
gem uninstall star_wars_droid_namer
```

## Pushing gem
```
gem signin
gem push star_wars_droid_namer-1.0.0.gem         (update version)
gem list -r star_wars_droid_namer
```
