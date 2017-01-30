<img src="https://raw.githubusercontent.com/alizain/ulid/master/logo.png" heigth="200" width="100">

Universally Unique Lexicographically Sortable Identifier implementation for Delphi (Object Pascal)

A Delphi/Object Pascal port of [alizain/ulid](https://github.com/alizain/ulid).

## Why ULID?

* 128-bit compatibility with UUID
* 1.21e+24 unique ULIDs per millisecond
* Lexicographically sortable!
* Canonically encoded as a 26 character string, as opposed to the 36 character UUID
* Uses Crockford's base32 for better efficiency and readability (5 bits per character)
* Case insensitive
* No special characters (URL safe)
* [Delphi] Is faster than CreateGUID

For more information, check out [ULID's README](https://github.com/alizain/ulid/blob/master/README.md).

## Usage

`uses ULID`

```Delphi
CreateULID; // 01ARZ3NDEKTSV4RRFFQ69G5FAV
```
## How to contribute

Just make changes and submit a pull request (No Test No :beers:).
