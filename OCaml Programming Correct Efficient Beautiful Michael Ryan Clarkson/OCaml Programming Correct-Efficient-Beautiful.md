# OCaml Programming: Correct + Efficient + Beautiful (Michael Ryan Clarkson)

## Resources

1. [Youtube Playlist](https://www.youtube.com/playlist?list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU)

## Notes

1. 5 Aspects of learning PL (Programming Language)
    1. Syntax
        1. How do you write language constructs?
        2. what are the keywords
        3. how do you use punctuations
        4. what kinds of parantheses have to go there and where do they go
    2. Semantics
        1. What do programs mean?
            1. Type checking
                1. Which Programs do have a meaning
            2. Evaluation Rules
                1. what the meaning of the program is
            3. we write a piece of code, how is it going to be undrestood by the computer?
2. Expressions
    1. Syntax
        1. Keywords, Punctuation that we use
    2. Semantics
        1. it's meaning
        2. Type-Checking Rules
            1. Static Semantics : produce a type, or fail with error msg
        3. Evaluation Rules
            1. Dynamic Semantics : produce a value, or exception or infinite loop
            2. get an expression and evaluate it to / produce a value
3. Value
    1. Expression that doesn't need further evaluation
4. Double Semicolon

    1. we are done entering expression and we want OCaml evaluate the expression down to a value
    2. ![alt](../Images/17-%20Session%20-%20Program.jpg)
    3. ```ocaml
        # 3110;;
        - : int = 3110
       ```
    4. value : 3110
        1. for value we use equal sign
    5. type : int
        1. for type we use colon
    6. Boolean Values

        1. ```ocaml
            true;;
            - : bool = true

            false;;
            - : bool = false
           ```

        2. Type : bool
        3. Values : true, false

    7. String Values
        1. ```ocaml
             "Hello World";;
             - : string = "Hello World"
           ```
        2. inside Double Quotations
        3. Type : string
    8. String Concatenation
        1. ```ocaml
             "Hello" ^ "World";;
             - : string = "Hello World"
           ```
        2. ^ : caret
        3. Type : string
    9. Float Values

        1. ```ocaml
             3.14;;
             - : float = 3.14

             2.0 *. 3.14;;
            - : float = 6.28
           ```

        2. Type : float
        3. Floating Point Multiplication : \*.
        4. Integer Multiplication : \*

    10. Int, Floating point numbers have different set of operators for Arithmetic

5. Type Inference (OCaml interpreter infers Types)
    1. Compilation fails with Type Error if it can't
6. Type Annotation

    1. manually annotate types
    2. replace e with (e : t)
    3. ```ocaml
        (3.14 : float);;
        - : float = 3.14

        (3.14 : int);;
        Error: This expression has type float but an expression was expected of type
             int
       ```

    4. ![alt](../Images/18-%20Session%20-%20Program.jpg)
    5. Type Annotation, to ask Type Checker to verify that for us

7. Conditions
    1. if Guard then else
    2. ```ocaml
        if 2 > 1 then 3 else 4;;
        - : int = 3
       ```
    3. ![alt](../Images/19-%20Session%20-%20Program.jpg)
    4. Guard is going to be a boolean expression
        1. evaluates to true / false
    5. true
        1. then branch evaluated
        2. else branch not evaluated
    6. false
        1. skip the then branch
        2. else branch evaluated
    7. things to NOTE
        1. ```ocaml
            if true then "yay" else 1;;
           ```
        2. both should have same Type
        3. so throws an Error
        4. ```ocaml
            if 1 then "yay" else "nay";;
           ```
        5. 1 is not a boolean expression
        6. so throws an Error
    8. if e1 then e2 else e3
        1. e : expression
    9. ![alt](../Images/20-%20Session%20-%20Program.jpg)
    10. ![alt](../Images/21-%20Session%20-%20Program.jpg)
    11. ![alt](../Images/22-%20Session%20-%20Program.jpg)
8. let keyword

    1. ```ocaml
        let x = 3;;
        val x : int = 3
        (* value 3 type integer bound to identifier x *)

        x;;
        - : int = 3

        let (y : int) = 3110;;
        val y : int = 3110

        let z : int = 3110;;
        val z : int = 3110

        y + z;;
        - : int = 6220
       ```

    2. definition
        1. giving a name to a value
        2. not expressions
        3. definitions contain expressions
    3. ![alt](../Images/23-%20Session%20-%20Program.jpg)
