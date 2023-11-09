# Session (24.10.23)

## References

1. [soocaml](https://cdltools.cs.uni-saarland.de/soocaml/)
2. [OCaml Corenell](https://cs3110.github.io/textbook/cover.html)
3. [OCaml](https://www.youtube.com/playlist?list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU)

## Organization

1.

## Notes

1.  Functional Programming
    1. Functions
    2. Types
    3. Equations
    4. Mathematical Perspective
    5. Provide abstractions we need in order to do that
2.  Structure of Programming Languages
    1. Syntax
    2. Semantics
    3. Algorithms
    4. Correctness
        1. Bugs / Errors
        2. sometimes they don't do what they are supposed to do
    5. Specifications
        1. specifies what a program is supposed to do
        2. come up with techniques to mathematically proove code we are writing actually is correct respective to specficications
    6. Proofs
    7. Recursion
        1. Recursive Programs
        2. Lend themselves
    8. Induction
3.  Programming
    1. Algorithmic Idea how to solve a problem
    2. Algorithmic Thinking
    3. Come up with a way to solve this problem
    4. proove mathematically what you've done solves problem in a correct way
4.  Coding
    1. Put the idea in this specific programming language
5.  Program
    1. Sequence of declarations
    2. ```ocaml
        let a = 2 * 3 + 2 (* 1st Delaration *)
        let b = 5 * a (* 2nd Delaration *)
       ```
    3. a, b : identifiers
        1. Names stands for Computer Values
    4. 5 \* a : Expression
        1. Expression is a piece of code that computes a value
    5. 2 \* 3 + 2 : Expression
        1. Expression is a piece of code that computes a value
        2. Expressions denote Computations
    6. let a = 2 \* 3 + 2 : Declaration
        1. Declaration is a piece of code that introduces a new name and binds it to a value
    7. \* : Multiplication Operator
        1. Operator is a piece of code that computes a value from other values
    8. PROGRAM IS SEQUENCE OF DECLARATIONS
    9. we write declarations one after another and they declare identifiers and bind them to result of expressions
    10. what happens when we execute a program?
        1. these lines / declarations are executed one after another
        2. right hand side of declarations are evaluated
        3. Notion of Evaluating such a expression
        4. Taking Expression and reducing it to a value / single value / number
        5. then assigning or binding the identifier to this particular value
        6. rest of program identifier stands for the value that has been computed on the right hand side
        7. bind the value to identifier/variable a
    11. ![Screenshot 1](../Images/2-%20Session%20-%20Program.jpg)
    12. Program
        1. Sequence of Declarations
    13. Expressions
        1. represent Computations
    14. Expressions have a TYPE
        1. TYPE : Set of Values / Possible Values that can be result of evaluating this expression
        2. 2 \* 3 + 2
            1. result can not be YES / NO --> BOOLEAN
            2. result can not be have a good day --> TEXT
            3. RESULT is a NUMBER
        3. Result is a Number represented by a type and in OCaml, this type is called int
        4. int : Integer : Ganze Zahl
        5. Element of Z
        6. ![Screenshot 2](../Images/3-%20Session%20-%20Program.jpg)
        7. from -infinity to +infinity
            1. No Fractional Numbers
            2. No Real Numbers
        8. In practice computer RAM / Memory can not handle more than it's capacity and number of bits
        9. Min-Int
            1. -2^31
        10. Max-Int
            1. 2^31 - 1
            2. why? 0 is also a number
        11. 32 Bits
            1. 2^32 = 4,294,967,296 different numbers
        12. restricted to small number range
            1. because we want to execut it on a computer
    15. EVERY Expression has a TYPE
        1. Types are inferred by the OCaml Runtime
        2. Type Inferring
            1. deduce / conclude /
            2. استنتاج، استنباط، نتیجه گیری، برداشت
        3. sometimes it is not possible to unambiguously infer the type of an expression
        4. so we annotate them
            1. this variable / expression, i want to have the type int
        5. Typically OCaml is able to do this automatically
    16. OCaml not just infer these Types, but given set of Rules, ensures Program doesn't make trivial mistakes
        1. i don't want to multiply a number with a Text
        1. i don't want to multiply a number with a Boolean Value
    17. Types come with consistency rules
        1. OCaml automatically checks for you
        2. discards a lot of programming errors
    18. ![Screenshot 3](../Images/4-%20Session%20-%20Program.jpg)
6.  Shadowing
    1. what happens if i redclare a variable?
    2. ```ocaml
        let a = 2 * 3 + 2 (* 1st Delaration / a = 8 *)
        let b = 5 * a (* 2nd Delaration / b = 40 *)
        let a = 3 (* 3rd Delaration / a = 3 *)
        let c = a + 1 (* 4th Delaration / c = 4 and not 9 *)
       ```
    3. identifier / variable
    4. 2nd declaration shadows the previous declaration
    5. shadow : previous declaration above is no longer accessible to us
    6. from let a = 3
    7. whenever we refer to a, we mean 3 which is declared in the 3rd declaration
    8. we get the value bound to last declaration
    9. shadow the thing we declared before, no longer accessible
    10. whenever shadowing appears / whenever we use an identifier, it always refers to closest binding that we've seen
    11. Last Binding --> Closest Binding --> let a = 3
    12. closest Binding / NOT Binding above
        1. this definition shadows the prior one
7.  Interpreter
    1. is a way to run a computer program
    2. simulates the semantics / meaning of the program on another machine
8.  Compile a Program
    1. translate program from one language (OCaml) to another language (Machine Code)
    2. Hardware built into Computer, also has a Programming Language
        1. Assembly Language
        2. ISA : Instruction Set Architecture
        3. undrestands very very primitive instructions
            1. Primitive : بنیادی، اصلی، ابتدایی، اولیه
    3. Compiler
        1. somebody who translates a higher level language like OCaml into something that Computer can undrestand
        2. way of executing programs
        3. translating program into something the Computer undrestands
9.  Interpreter
    1. NOT SO FAST
    2. Software that mimic / interprete / simulate the execution of Computer Programs in specific environment
    3. ![Screenshot 4](../Images/5-%20Session%20-%20Program.jpg)
    4. ```ocaml
        let a  = 2 * 3 + 2
       ```
    5. we declare a new variable a that has the type int
    6. type of variable is said with
        1. :
        2. colon
        3. inferred the type int for variable a
        4. variable a is bound to the value of 8
        5. ![Screenshot 5](../Images/6-%20Session%20-%20Program.jpg)
        6. ![Screenshot 6](../Images/7-%20Session%20-%20Program.jpg)
10. Semicolons
    1.
11. Type Inferring
    1. ```ocaml
       let a = 2 * 3 + 2
       let b = 5 * a
       ```
    2. 5 is an Integer Constant
    3. a is an Identifier, has been inferred the TYPE INT
    4. result of computation 5 \* a is also INTEGER
    5. identifier b has TYPE INT
12. Shadowing

    1. ![alt](../Images/8-%20Session%20-%20Program.jpg)
    2. a is rebound to this value 3
    3. ```ocaml
        let a = 2 * 3 + 2
        let b = 5 * a
        let a = 3

        (*
        * > val b : int = 40
        val a : int = 3
        *)
       ```

    4. ![alt](../Images/9-%20Session%20-%20Program.jpg)

13. Functions

    1.  ![alt](../Images/10-%20Session%20-%20Program.jpg)
    2.  ```ocaml
         let square = (fun x -> x * x)
         let a = square 2

         let square2 x = x * x
         let b = square2 3

         let square3 = fun x -> x * x
         let c = square3 4
        ```

    3.  ![alt](../Images/11-%20Session%20-%20Program.jpg)
    4.  ![alt](../Images/12-%20Session%20-%20Program.jpg)
    5.  ![alt](../Images/13-%20Session%20-%20Program.jpg)
    6.  Type definition using colon (:)
        1. val a : int
        2. val square : int -> int
    7.  ![alt](../Images/14-%20Session%20-%20Program.jpg)
    8.  ```ocaml
                         (* x aval parameter hast *)
         let square = fun x -> x * x
         square 2 (* 2 : argument *)

        ```

    9.  let square = fun x -> x \* x
    10.                  x : parameter
    11. square 2
    12.        2 : argument
    13. ![alt](../Images/15-%20Session%20-%20Program.jpg)
    14. ```ocaml
        let square x = x * x
        let square2 = fun x -> x * x
        ```
    15. ![alt](../Images/16-%20Session%20-%20Program.jpg)
    16. Local Declaration Function
        1.  ```ocaml
            let pow8 x = let square x = x * x in square (square x)
            let pow82 x = let a = x * x in let b = a * a in b * b
            let pow83 x = let x = x * x in let x = x * x in x * x
            ```
    17. Global Declarations
        1.  without in keyword
    18. Local Declarations
        1.  with in keyword
