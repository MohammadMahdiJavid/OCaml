# Session (09.11.23)

## Table of Contents

-   [Session (09.11.23)](#session-091123)
    -   [Table of Contents](#table-of-contents)
    -   [Resources](#resources)
    -   [Notes](#notes)
    -   [Higher Order Functions](#higher-order-functions)
    -   [Polymorphism](#polymorphism)

## Resources

## Notes

## Higher Order Functions

1. Functions that take functions as arguments
2. Functional Programming Languages
    1. Functions are ordinary values that can be passed as arguments
    2. Functions can be bound to identifiers
3. i can bind a value to an identifier
4. i can bind a function to identifier
5. passing function like a value
6. function : ordinary values
7. functions can be passed as values to other functions
8. Higher Order Function : function of a type that can receive a function as a value is called a higher order function
9. First Order Function : function that doesn't take a function as an argument : but just ordinary values
10. ```ocaml
    let rec first f k = if f k then k else first f (k + 1);;
    (*
    * > val first : (int -> bool) -> int -> int = <fun>
    * performing linear search through numbers, applying the function f
    * which takes f as an argument to each number
    * when function f returns true for the first time, it will return the number
    * for which function f has returned true for the first time
    * function f : (int -> bool)
    * argument k : int
    * why? because we have written k + 1, which means k must be an int
    * how do we know that f is a function? because we are applying it to k
    * and we are checking if it returns true or false
    *)
    ```
11. if condition always excpects a boolean value
12. so function f returns a boolean value
13. f k : means calling function f with argument k
14. implement function half which takes an integer num and returns it's lower half
15. ```ocaml
    let rec first f k = if f k then k else first f (k + 1);;
    (*
    * > val first : (int -> bool) -> int -> int = <fun>
    * it starts from k and goes on until f k returns true
    * and returns the number for which f k returns true
    * if f k never returns true, it will go on forever
    * so we need to make sure that f k returns true at some point
    *)

    let half num = first (fun x -> x * 2 > num) 0;;
    (*
    * > val half : int -> int = <fun>
    * half 42;;
    * > - : int = 22
    * half 43;;
    * > - : int = 22
    *)

    ```

16. ```ocaml
        let rec first f k = if f k then k else first f (k + 1);;
        let half num = first (fun x -> x * 2 > num) 0;;

        half 2;;
        half 3;;
        (*
        * > - : int = 2
        * > - : int = 2
        *)

        half 4;;
        half 5;;
        (*
        * > - : int = 3
        * > - : int = 3
        *)
    ```

## Polymorphism

1. programming independent of type
2. generalizing a function to work on any type
3. generalizing over types
