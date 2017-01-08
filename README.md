# Convert Rabobank CSV exports to QIF files

The rabocsv2qif package, written in [Haskell](https://www.haskell.org/),
exposes a library, Rabobank, and an executable tool named `rabocsv2qif`. With
the executable you can quickly create a timestamped QIF file from a Rabobank
CSV file with transactions. The library exposes a method, `toQif`, that can be
used to create QIF data in code. It simply takes a `String` and returns a `String`.

This is a package I wrote years ago, and recently have reworked a bit to make
it build again. When I wrote this, I was still a beginner in Haskell, and
I think the API (and performance) can be greatly improved if I used
`ByteString` or `Data.Text` as the data types for the `toQif` function, instead
of the problematic default `String` type.

## Documentation

The Haskell documentation for the module can be 
[found here](https://hackage.haskell.org/package/rabocsv2qif).

## How to use

Once built/installed, it should be as simple as:

    $ rabocsv2qif <input file here>

where the input file is a Rabobank CSV file. It outputs a timestamped file in
the current working directory with the transactions in QIF format.

## License

This work is GPL3-licensed. See the LICENSE file for more information.
