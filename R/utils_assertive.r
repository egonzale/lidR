# All that stuff aims to replace the functions needed by lidR that come from the assertive package.
# On 2018-11-20 I received an email from Kurt Hornik to announce that assertive will be removed
# from cran and consequently lidR as well because it has a strong dependency to assertive. This file
# is quick fix that removes the dependency to assertive.

assert_all_are_non_negative = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!all(x >= 0))
    stop(glue::glue("Values of {x.} are not all positive or null."))
}


assert_all_are_positive = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!all(x > 0))
    stop(glue::glue("Values of {x.} are not all positive."))
}


assert_all_are_in_closed_range = function(x, a, b)
{
  x. <- lazyeval::expr_text(x)
  if (!all(x >= a) | !all(x <= b))
    stop(glue::glue("Values of {x.} are not all in range [{a}, {b}]."))
}


assert_all_are_in_open_range = function(x, a, b)
{
  x. <- lazyeval::expr_text(x)
  if (!all(x > a) | !all(x < b))
    stop(glue::glue("Values of {x.} are not all in range ]{a}, {b}[."))
}

assert_all_are_true = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!all(x == TRUE))
    stop(glue::glue("Values of {x.} are not all TRUE."))
}

assert_are_same_length = function(x, y)
{
  x. <- lazyeval::expr_text(x)
  y. <- lazyeval::expr_text(y)
  if (length(x) != length(y))
    stop(glue::glue("{x.} and {y.} have different lengths."))
}

assert_all_are_existing_files = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!all(file.exists(x)))
    stop(glue::glue("File does not exist."))
}

assert_is_a_bool = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.logical(x) | length(x) > 1)
    stop(glue::glue("{x.} is not a boolean."))
}

assert_is_a_number = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.numeric(x) | length(x) > 1)
    stop(glue::glue("{x.} is not a number."))
}

is_a_number = function(x)
{
  return(is.numeric(x) & length(x) == 1)
}

assert_is_a_string = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.character(x) | length(x) > 1)
    stop(glue::glue("{x.} is not a string."))
}


assert_is_numeric = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.numeric(x))
    stop(glue::glue("{x.} is not numeric it is a {class(x)}."))
}

assert_is_vector = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.vector(x))
    stop(glue::glue("{x.} is not a vector it is a {class(x)}."))
}

assert_is_list = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.list(x))
    stop(glue::glue("{x.} is not a list it is a {class(x)}"))
}

assert_is_of_length = function(x, l)
{
  x. <- lazyeval::expr_text(x)
  if (length(x) != l)
    stop(glue::glue("{x.} is not of length {l} it is of length {length(x)}."))
}

assert_is_character = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.character(x))
    stop(glue::glue("{x.} is not character it is a {class(x)}"))
}


assert_is_all_of = function(x, class)
{
  x. <- lazyeval::expr_text(x)
  if (!is(x, class))
    stop(glue::glue("{x.} is not a {class} it is {class(x)}."))
}

assert_is_function = function(x)
{
  x. <- lazyeval::expr_text(x)
  if (!is.function(x))
    stop(glue::glue("{x.} is not a function it is a {class(x)}."))
}

assert_all_are_same_crs = function(x)
{
  if (!sp::identicalCRS(x))
    stop("Different CRS.")
}


stopifnotlas = function(x)
{
  if (!inherits(x, "LAS"))
    stop("Argument is not a LAS object")
}

stopif_forbidden_name = function(name)
{
  if (name %in% LASFIELDS)
    stop(glue::glue("{name} is part of the core attributes and is a forbidden name."))
}

stopif_wrong_context = function(received_context, expected_contexts, func_name)
{
  str = paste0(expected_contexts, collapse  = "' or '")

  if (is.null(received_context))
    stop(glue::glue("The '{func_name}' function has not been called in the correct context. Maybe it has been called alone but it should be used within a lidR function."))
  if (!received_context %in% expected_contexts)
    stop(glue::glue("The '{func_name}' function has not been called in the correct context. It is expected to be used in '{str}'"))
}
