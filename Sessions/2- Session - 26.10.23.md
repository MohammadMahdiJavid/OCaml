# Session (26.10.23)

## Resources

## Notes

1. ```ocaml

   ```

2. arguments
    1. ```ocaml
        square 2
       ```
    2. 2 : argument
3. parameters
4. in keyword
5. local / global declaration
    1. local binding
6. in keyword comes in the body of let
7.  1. ```ocaml
            let abs x = if x < 0 then -x else x
            val abs : int -> int = <fun>
       ```
    2. Same Type for both branches
    3. Lazy Evaluation
    4. Guard as bool
    5. Type Inference
    6.  1. ```ocaml
                let max x y = if x > y then x else y;;
                val max : 'a -> 'a -> 'a = <fun>;;
                (* 2 parameters for this function *)
                (*each function in OCaml has only one parameter *)
                max 1 2;;
                - : int = 2
                let max' x y = if x > y then x + 0 else y;;
                val max' : int -> int -> int = <fun>

                let max2' x y = if x > y then x +. 0.0 else y;;
                val max2' : float -> float -> float = <fun>

                let max'' (x : int) y = if x > y then x else y;;
                val max'' : int -> int -> int = <fun>

                let max''' (x : int) (y : int) = if x > y then x else y;;
                val max''' : int -> int -> int = <fun>

                let max'''' x y : int = if x > y then x else y;;
                val max'''' : int -> int -> int = <fun>

                let max3 x y z = max x (max y z);;
                val max3 : 'a -> 'a -> 'a -> 'a = <fun>
                let max3' x y z = max' x (max y z);;
                val max3' : int -> int -> int -> int = <fun>

                let in_order x y z = x <= y && y <= z;;
                (* a && b = if a then b else false *)
                (* a || b = if a then true else b *)
           ```

        2. prime 'a to prime a to prime a
        3. Type Variable
        4. different operators for int, float
        5. doesn't know which type to use : Type Variable
            1. don't know the specific type
        6. ' can be part of identifier but not 1st position

    7. plus operator is not overloaded

8. Function Types

    1. Partial Application
    2. corrying
    3. ```ocaml
        (* Syntactic Sugar *)
        let abs x = if x < 0 then -x else x;;
        val abs : int -> int = <fun>

        let abs' = fun x -> if x < 0 then -x else x;;
        val abs' : int -> int = <fun>

        let max x y = if x > y then x else y;;
        val max : 'a -> 'a -> 'a = <fun>

        let max' = fun x -> fun y -> if x > y then x else y;;
        val max' : 'a -> 'a -> 'a = <fun>
        (* Lambda Expression *)

        let max'' = fun x -> (
            fun y -> (
                if x > y then x else y
            )
        )
        val max'' : 'a -> 'a -> 'a = <fun>

        max 3 4;;
        - : int = 4

        max 3;;
        - : int -> int = <fun>

        let max3 = max 3;;
        val max3 : int -> int = <fun>
        max3 4;;
        - : int = 4

        let max0 = max 0;;
        val max0 : int -> int = <fun>
        max0 3;;
        - : int = 3

        max0 -1;;
        - : int = 0

        let f x1 .... xn = expression
        let f = fun x1 -> ... fun xn -> expression;;

       ```

    4. abs : identifier
    5. x : parameter
    6. samte rast tarin : value : function / bool / int
    7. yeki monde be samte rast : Type return value
    8. ```ocaml
        let max0 = max 0;;
        val max0 : int -> int = <fun>

        max0;;
        - : int -> int = <fun>

        let max0' = fun y -> if 0 > y then 0 else y;;
        let max0'' y = max 0 y;;
        let max0''' = fun y -> max 0 y;;

        let max_other x = ((max x) 0);;
       ```

    9. partial application :
        1. you don't give all parameters, which you should give

9. Recursion

    1. ```ocaml
        (* x^n *)
        (* rec : recursive declaration *)
        let rec pow x n = if n = 0 then 1 else x * pow x n-1;;
        val pow : int -> int -> int = <fun>

        pow x n = if n = 0
                    then 1
                    else x . (pow x (n - 1))


       ```

    2. x to the power of n
    3. x ^ 0 := 1
        1. equation that defines left hand side (lhs)
        2. definition
        3. **BASE CASE**
        4. **TERMINATION RULE**
    4. x ^ n+1 := x . x ^ n
    5. subset / superset
    6. Execution Trace
    7. ```ocaml
        pow 2 3 = 2 * pow 2 2 = 2 * 2 * pow 2 1 = 2 * 2 * 2 * pow 2 0 = 2 * 2 * 2 * 1 = 8

        pow 2 3 = if 3 <= 0 then 1 else 2 * pow 2 2 = 2 * (pow 2 2) =
                2 * (if 2 <= 0 then 1 else 2 * pow 2 1) = 2 * (2 * pow 2 1) =
                2 * (2 * (if 1 <= 0 then 1 else 2 * pow 2 0)) = 2 * (2 * (2 * pow 2 0)) =
                2 * (2 * 2 * (if 0 <= 0 then 1 else 2 * pow 2 -1)) = 2 * (2 * 2 * 1) = 8
       ```

    8. substitution of terms
        1. does substitution ever terminates?
            1. Infinite Loop
    9. terminatess because n decreases and
    10. Diverging functions are possible
    11. ```ocaml
        let rec doverge x = doverge x + 1;;
        val doverge : 'a -> int = <fun>

        diverge 5 = diverge 5 + 1 = diverge 5 + 1 + 1 = diverge 5 + 1 + 1 + 1 = ...
        ```

    12. it doesn't go to an End (Diverge)
    13. conditions evaluated lazy
    14. strictly opposite of lazily
        1. Lazy Evaluation
        2. Strict Evaluation
            1. Diverging
            2. Divergance

10. Recursive Division
    1. ```ocaml
        let rec div x y = if x < y then 0 else 1 + div (x - y) y;;
        val div : int -> int -> int = <fun>
        div 20 4 : if 20 < 4 then 0 else 1 + div (20 - 4) 4 =
                    1 + div 16 4 =
                    1 + (if 16 < 4 then 0 else 1 + div (16 - 4) 4) =
                    1 + (1 + div 12 4) =
                    1 + (1 + (if 12 < 4 then 0 else 1 + div (12 - 4) 4)) =
                    1 + (1 + (1 + div 8 4)) =
                    1 + (1 + (1 + (if 8 < 4 then 0 else 1 + div (8 - 4) 4))) =
                    1 + (1 + (1 + (1 + div 4 4))) =
                    1 + (1 + (1 + (1 + (if 4 < 4 then 0 else 1 + div (4 - 4) 4)))) =
                    1 + (1 + (1 + (1 + (1 + div 0 4)))) =
                    1 + (1 + (1 + (1 + (1 + (if 0 < 4 then 0 else 1 + div(0 - 4) 4))))) =
                    1 + (1 + (1 + (1 + (1 + (0))))) = 5
       ```
11. Static Semantic : Type
12. Dynamic Semantic : Evaluation
