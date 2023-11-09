# Tutorial (25.10.23)

## Resources

1. https://v2.ocaml.org/manual/index.html
2. https://v2.ocaml.org/api/index.html
3. https://try.ocamlpro.com/
4. https://v2.ocaml.org/manual/lex.html#sec84

## Notes

1. 15 mins / mini test
    1. 8th of Nov
    2. 16:15
        1. start of tutorial
2. ```ocaml
   let x = 42
   let f y = x + y
   let g x = x * f 1
   ```

    1. let : keyword
    2. x : identifier : variable
    3. ```ocaml
           let  x = 42
       ```
        1. let : keyword
        2. x : identifier
        3. = : keyword
        4. 42 : constant
    4. ```ocaml
        let f y = x + y
       ```
        1. let : keyword
        2. f : identifier
        3. y : identifier
        4. = : keyword
        5. x + y : expression
        6. x : identifier
        7. \+ : operator
        8. y : identifier
    5. ```ocaml
        let f = fun y -> x + y

        let f y = x + y
       ```

        1. fun : keyword
        2. -> : keyword
        3. let : keyword
        4. f : identifier
        5. = : keyword
        6. y : identifier
        7. x : identifier
        8. \+ : operator
        9. y : identifier

    6. ```ocaml
        let g x = x * f 1;;
       ```
        1. let : keyword
        2. g : identifier
        3. x : identifier
        4. = : keyword
        5. x \* f 1 : expression
        6. x : identifier
        7. \- : operator
        8. f 1 : expression
        9. f : identifier
        10. 1 : constant

3. Types

    1. keyword (kw)
    2. identifier (id)
    3. operator (op)
    4. constant (c)

4. identify words and their lexical class

    1. ```ocaml
        let x = 5

        fun arg -> arg * arg

        let foo var = let foo2 var2 = var * var2 in foo2 var
       ```

    2. let : keyword
    3. x : identifier
    4. = : keyword
    5. 5 : constant
    6. fun : keyword
    7. arg : identifier
    8. -> : keyword
    9. arg \* arg : expression
    10. arg : identifier
    11. \* : operator
    12. arg : identifier
    13. let : keyword
    14. foo : identifier
    15. var : identifier
    16. = : keyword
    17. let : keyword
    18. foo2 : identifier
    19. var2 : identifier
    20. = : keyword
    21. var \* var2 : expression
    22. var : identifier
    23. \* : operator
    24. var2 : identifier
    25. in : keyword
    26. foo2 var : expression
    27. foo2 : identifier
    28. var : identifier

5. List of Keywords
    1. let
    2. in
    3. fun
    4. ->
    5. =
        1. as an assignment operator
6. ```ocaml
    let f y = x + y
    let f = fun y -> x + y
   ```
7. ![First Code](Images/1-%20Code.jpg)
8. ```ocaml
    let darkness = fun x -> fun x ->
        let y =
        fun x ->
            let y = fun x -> x * x in
            y (x+1)
        in
        y x + x
   ```
    1. ```ocaml
        let darkness = fun x -> fun x ->
            let y =
                fun x ->
                let y = fun x -> x * x in
                y (x+1)
            in
            y x + x ;;
            val darkness : 'a -> int -> int = <fun>
       ```
9.
