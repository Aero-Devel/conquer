# conquer

## Execute  

* Run `stack exec -- conquer-exe` to see "We're inside the application!"
* With `stack exec -- conquer-exe --verbose` you will see the same message, with more logging.

## Run tests

`stack test`

## Purescript / Javascript FFI

### Calling Javascript from Purescript

The simplest version.

```purescript
module Test.URI where
foreign import encodeURIComponent :: String -> String
```
Javascript file with the same name as the purescript file.
```javascript
"use strict";
exports.encodeURIComponent = encodeURIComponent;
```

When the function takes more arguments we need to take the currying into consideration and use a wrapper function.

### Without currying

```javascript
// First we define the function in a javascrit module
exports.diagonalUncurried = function (w, h) {
  return Math.sqrt(w * w + h * h);
};

```


```purescript

-- Then we use foreign import with the Fn2 type (since its a 2arg fun)
foreign import diagonalUncurried :: Fn2 Number Number Number

```

### With currying we have to play with lambdas from the javascript side

```Javascript

foreign import diagonal :: Number -> Number -> Number

exports.diagonalArrow = w => h =>
  Math.sqrt(w * w + h * h);

```
``` Purescript

foreign import diagonalArrow :: Number -> Number -> Number


```

### Calling Purescript from Javascript


```Purescript
module Test where

gcd :: Int -> Int -> Int
gcd 0 m = m
gcd n 0 = n
gcd n m
  | n > m     = gcd (n - m) m
  | otherwise = gcd (m - n) n

```

```Javascript

// import module
var Test = require('Test');

// Apply the arguments one by one 
Test.gcd(15)(20);

```


