---
title: "Basics and Data Structures"
subtitle: "Statistical Computing with R"
author: "Waseem Medhat"
date: "2020-09-05"
logo: "content/r-logo.svg"
output:
  ioslides_presentation:
    wide: true
    mathjax: local
    self_contained: false
---

What does a computer do?
========================

Arithmetic
----------

<div class="red2">
"How does R calculate?"
</div>

- Addition: `1 + 1`
- Subtraction: `5 - 3`
- Multiplication: `2 * 5`
- Division: `10 / 2`
- Exponentiation: `2 ^ 3` _or_ `2 ** 3`
- Integer division: `10 %/% 3`
- Remainder (modulo): `10 %% 3`
- Parentheses: `(2 + 10) %% 3`

Arithmetic
----------

- Try to make a linear regression prediction.
    + $b_{0} = 37.22727$
    + $b_{1} = -3.87783, x_{1} = 3.325$
    + $b_{2} = -0.03177, x_{2} = 123$

$y = b_{0} + b_{1} x_{1} + b_{2} x_{2}$


```r
37.22727 + (-3.87783 * 3.325) + (-0.03177 * 123)
```

```
## [1] 20.42578
```

Assignment
----------

<div class="red2">
"How does R store calculations?"
</div>

<div class="red2">
"How can I save results for later use?"
</div>

_The assignment operator:_ `<-` 

- A "less than" sign followed by a dash

`age <- 38`

- 38 is _assigned_ to a _variable_ (object) named `age`.
- You can read it "age gets 38"

Assignment
----------

Back to the prediction example...


```r
b0 <- 37.22727

b1 <- -3.87783
x1 <- 3.325

b2 <- -0.03177
x2 <- 123

y <- b0 + b1*x1 + b2*x2
y
```

```
## [1] 20.42578
```

Assignment
----------


```r
# LHS        RHS
  y     <-   b0 + b1*x1 + b2*x2
```

- Assignment produces no output.
- The calculation in the right-hand side (RHS) is processed _first._ Then the
  resulting _value_ is assigned to the variable name in the left-hand side
  (LHS).
    + This is why an assignment expression like `x <- x + 1` is perfectly valid.
- Writing the name of the variable returns its value as output.
- The stored variable contains the value but not how this value is calculated.

Assignment
----------

- Steps:

```
y <- b0 + b1*x1 + b2*x2

y <- 37.22727 + (-3.87783 * 3.325) + (-0.03177 * 123)

y <- 20.42578
```

- How would this work?

```
y <- y + 1
```

Vectors
-------

<div class="red2">
"How does R support (dependent/independent) variables?"
</div>

- A vector is a set of data of some type (e.g. continuous, nominal, etc.)
- Built with `c()`


```r
age <- c(50, 36, 61, 40, 28, 32)
age
```

```
## [1] 50 36 61 40 28 32
```

Vectors
-------

- A handy shortcut - all numbers from x to y: `x:y`.
- We don't need `c()` in this case.


```r
course_id <- 1721701:1721712
course_id
```

```
##  [1] 1721701 1721702 1721703 1721704 1721705 1721706 1721707 1721708 1721709
## [10] 1721710 1721711 1721712
```

_Notice the numbers between square brackets, [1] and [10], represent the index
of the output vector._

Indexing
--------

<div class="red2">
"Given a vector of ages, how can I get the first three ages?"
</div>

- Indexing is simply extracting a value by its _index_.
- Done with the syntax `vector[i]` where `i` is the desired index/indices.


```r
computer_course_id <- course_id[5]
computer_course_id
```

```
## [1] 1721705
```


```r
first_3_ages <- age[1:3]
first_3_ages
```

```
## [1] 50 36 61
```

Vector operations
-----------------

<div class="red2">
"Can I do arithmetic operations on whole vectors?
</div>

<div class="red2">
"Can I _compute new variables_ out of the existing ones?"
</div>

- Ages have a mean of 41.17 and a standard deviation of
  12.3. Convert them to Z-scores.


```r
age_z <- (age - 41.17) / 12.3
age_z
```

```
## [1]  0.71788618 -0.42032520  1.61219512 -0.09512195 -1.07073171 -0.74552846
```

Vector operations
-----------------

- In the last example, we used a vector and single numbers as operands (i.e. we
  subtracted a single number from all ages, then divided all these numbers by a
  single number as well).

- If both operands are vectors **of equal length**, the operation is done
  element-wise.
    + In `v1 + v2`: the 1^st^ element in `v1` is added to the 1^st^ element in
      `v2`, the 2^nd^ to the 2^nd^, and so on...


```r
weight <- c(70,   89,   103,  67,   100)
height <- c(1.80, 1.56, 1.70, 1.90, 1.66)
bmi <- weight / (height ^ 2)
bmi
```

```
## [1] 21.60494 36.57133 35.64014 18.55956 36.28974
```


Comments
--------

<div class="red2">
"How can I document my code?"
</div>

- Comments can be written with code with a hash/pound symbol `#`.
- Everything after the `#` is "commented out" and is not run in R.
- They only serve the programmer for clarifying or separating code.
- They can also be used to "disable" code.


```r
# get the unique digit(s) of course id
short_id <- course_id - 1721700
short_id   # prints short_id (don't do this)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
```

Data types
----------

<div class="red2">
"How can I represent other variable types?"
</div>

R supports the statistical data types, and more...

- `numeric`: what we were working with so far.
- `character`: for "strings" of text.
- `logical`: takes exactly one of two values, `TRUE` and `FALSE`. It is used for
  comparison tests.
- `factor`: a special type of vector for categorical variables with specific
  levels

Data types
----------


```r
# character
name <- c("Cohen", "Pearson", "Neymann",
          "Fisher", "Wilcoxon", "Wallis")
name
```

```
## [1] "Cohen"    "Pearson"  "Neymann"  "Fisher"   "Wilcoxon" "Wallis"
```

- Factors can be created from character vectors by wrapping them into
  `factor()`.


```r
disease <- factor(c("normal", "diseased", "diseased",
                    "diseased", "normal", "normal"))
disease
```

```
## [1] normal   diseased diseased diseased normal   normal  
## Levels: diseased normal
```

Comparison tests
----------------

Used to compare values or vectors and return a `logical` (aka boolean) object.

- Greater: `>`
- Greater or equal: `>=`
- Less: `<`
- Less or equal: `<=`
- Equal: `==` (expect a lot of errors)
- Not equal: `!=`
- Negation: `!`
- Value present in a vector: `value %in% vector`

Comparison tests
----------------


```r
# remember age: 50 36 61 40 28 32
older_than_50 <- age >= 50
older_than_50
```

```
## [1]  TRUE FALSE  TRUE FALSE FALSE FALSE
```


```r
not_older_than_50 <- ! older_than_50
not_older_than_50
```

```
## [1] FALSE  TRUE FALSE  TRUE  TRUE  TRUE
```


```r
# is there at least one 40-year old patient?
40 %in% age
```

```
## [1] TRUE
```

Boolean operators
-----------------

Combine multiple comparison tests to make AND/OR logic.

- The AND operator is `&`, and the OR operator is `|`.


```r
# age:      50     36       61       40       28     32
# diseased: normal diseased diseased diseased normal normal

(age >= 30) & (age <= 50) # ages between 30 and 50, inclusive
```

```
## [1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
```


```r
(age > 40) | (disease == "diseased") # older than 50 or diseased individuals
```

```
## [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE
```

Matrices
--------

- Simply two-dimensional vectors.
- Indexed with two numbers.


```r
mat <- matrix(c(1:10), nrow = 2, ncol = 5)
mat
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```

```r
mat[2,1]
```

```
## [1] 2
```


Data frames
-----------

<div class="red2">
"How does R represent tabular data with multiple variables?"
</div>

- The most important data structure for statistics.
- Like tables, it has rows/observations, and columns/variables.


```r
statisticians <- data.frame(name, age, disease, older_than_50)
statisticians
```

```
##       name age  disease older_than_50
## 1    Cohen  50   normal          TRUE
## 2  Pearson  36 diseased         FALSE
## 3  Neymann  61 diseased          TRUE
## 4   Fisher  40 diseased         FALSE
## 5 Wilcoxon  28   normal         FALSE
## 6   Wallis  32   normal         FALSE
```

Data frames
-----------

<div class="red2">
"How to work on individual variables from data frames?"
</div>

- If you import a table as the data frame, the indivudial variables are _not_
  readily availabe to R as vectors. You have to point R to the data frame
  _then_ the variable inside it with the syntax `data_frame$variable`.


```r
# the data frame `mtcars` is built into R
# one of the variables in `mtcars` is `cyl`
mtcars$cyl
```

```
##  [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
```

```r
# writing `cyl` only results in an error
```

Recap
-----

- The whole lesson so far was about working with R's _data structures_ (forms
  and methods of storing, organizing, and accessing data).

- Individual variables are stored in vectors.

- Data types include `numeric`, `character`, `logical`, and `factor`.

- Data frames are the direct equivalent to tables in statistical data, and each
  variable/column in the data frame can be thought of as a vector.

Functions
---------

<div class="red2">
"How to do anything with the data?"
</div>

Functions are the main way to do any operation (statistical or otherwise) in R.

- To do an operation we _call_ the corresponding function using the syntax
  `function(some_input)`.

- Function inputs are called _arguments_.

- R provides a lot of functions. Some are statistical and others manipulate the
  data in some way.

Functions
---------


```r
mean(statisticians$age)
```

```
## [1] 41.16667
```

-  Here, I called the function `mean()`, which takes a single vector
  (`statisticians$age`) as an argument and _returns_ a mean of the values in
  that vector.
- Each function expects a certain type of input. Do you think `mean()` would
  accept a character vector?

Functions
---------

- Functions can take multiple arguments.


```r
seq(2, 10)
```

```
## [1]  2  3  4  5  6  7  8  9 10
```

- Function arguments are actually named, but these names can be ignored if the
  inputs are in the correct order. Each argument has a `=` between its name and
  value.


```r
seq(from = 2, to = 10, by = 2)
```

```
## [1]  2  4  6  8 10
```

Functions
---------

- Functions can be nested, and are evaluated inside out.


```r
# root mean squared error (RMSE)
errors <- c(1, 2, -1, 0, -3)
rmse <- sqrt(mean(errors ^ 2))
rmse
```

```
## [1] 1.732051
```
- "Square root of the mean of the squared errors."

```
  sqrt( mean( errors^2 ) )
= sqrt( mean( c(1, 2, -1, 0, -3) ^ 2 ) )
= sqrt( mean( c(1, 4, 1, 0, 9) ) )
= sqrt( 3 )
= 1.730521
```

Example functions
-----------------

- Statistics:

`mean()`, `median()`, `sd()`, `IQR()`, `t.test()`, `chisq.test()`

- Working with data:

`class()`, `str()`, `summary()`, `names()`, `data.frame()`, `c()`

- Math:

`sqrt()`, `exp()`, `log()`, `sum()`

Packages
--------

<div class="red2">
"What if I want to do something not available in base R?"
</div>

- A package is a collection of functions, data, documents, and/or other things.

- Packages are written by independent developers other than the R Core Team.

- At the time of writing this, 16066 packages are available on CRAN and much
  more on other repositories.

- We will study two very popular packages.
    + `dplyr` for data manipulation.
    + `ggplot2` for data visualization.

A step back
===========

Your library
------------

<div class="red2">
"How can I code without memorizing anything?"
</div>

- Build a resource library.
- Keep copies of code you wrote, and document it with comments.
- Look for cheatsheets:
    + RStudio's website has a good collection of cheatsheets
      https://rstudio.com/resources/cheatsheets/
    + Most of this lecture is covered in the base R cheatsheet
      http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf
- Google anything.
