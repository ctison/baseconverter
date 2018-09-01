# Golang package baseconverter

[![GoDoc](https://godoc.org/github.com/chtison/baseconverter?status.svg)](https://godoc.org/github.com/chtison/baseconverter)

Package baseconverter is a set of functions which perform numerical base conversion.

## Install this package + the cli frontend of this package: [bconv](cmd/bconv)
```
$ go get -v github.com/chtison/libgo/baseconverter/...
```

## Documentation

A number is represented as a \*math/big.Int in decimal base or as a string
(interpreted as UTF-8 encoded) in any base.
```go
var number *big.Int = big.NewInt(0) // decimal base (base 10)
var number string = "0"             // any base, even decimal one
```

A base is represented as a string (interpreted as UTF-8 encoded), and must own
at least two different runes.
```go
var base string
len([]rune(base)) >= 2
base[i] != base[j] with i != j
```

#### For example, you can convert a decimal number to base 16:
```go
package main

import (
	"fmt"

	bc "github.com/chtison/libgo/baseconverter"
)

func main() {
	nbrInBase16, _ := bc.UInt64ToBase(51966, "0123456789abcdef")
	fmt.Println(nbrInBase16)
}
```

#### Or convert back a number in base "01" (base 2) to base 10:
```go
package main

import (
	"fmt"

	bc "github.com/chtison/libgo/baseconverter"
)

func main() {
	nbr, _ := bc.BaseToDecimal("101010", "01")
	fmt.Println(nbr)
}
```

#### Or convert a number from any base to any other:
```go
package main

import (
	"fmt"

	bc "github.com/chtison/libgo/baseconverter"
)

func main() {
	var number string = "🌴🐭🌞🌝🍀💎💎🌝🐱🍀💜🍀🐵🐱🐭🌴🐼🌵🍀🐱💎🐼"
	var inBase string = "🌵🐱🚗🌍🌞🍀💎💰🐼🍋🐵🌴💜🐭🌝"
	var toBase string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !"
	converted, _, _ := bc.BaseToBase(number, inBase, toBase)
	fmt.Println(converted)
}
```
