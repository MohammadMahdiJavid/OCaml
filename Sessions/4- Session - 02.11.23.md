# Session (2.11.23)

## References

1. [Newton Function](https://www.google.com/search?q=newton+function&rlz=1C1SQJL_enIR862IR862&oq=newton+function&gs_lcrp=EgZjaHJvbWUyCQgAEEUYORiABDIHCAEQABiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDIHCAUQABiABDIICAYQABgWGB4yCAgHEAAYFhgeMggICBAAGBYYHjIICAkQABgWGB7SAQgxNzkzajBqN6gCALACAA&sourceid=chrome&ie=UTF-8)

## Notes

1. higher order function

    1. func as arg
    2. ```ocaml
         let rec first f k = if f k then k else first f (k+1);;
         val first : (int -> bool) -> int -> int = <fun>

         first (fun x -> x mod 11 = 0) 12;;
         (* lambda function
         * val int -> bool = <fun>
         * lambda i . i mod 11 = 0
         *)
         - : int = 22

         let f i = i mod 11 = 0;;
         val f : int -> bool = <fun>
         first f 12;;
         - : int = 22
       ```

    3. pass func as an arg
    4. arg : ordinary values
    5. func as arg to otehr func
    6. first order function
        1. opposite of higher order function
    7. func : ordinary values
    8. declare function and bind it to identifier using let
    9. or use lambda function
        1. ```ocaml
             (fun x -> x mod 11 = 0) 12;;
             - : bool = false
           ```
        2. use fun keyword
        3. create function and use it inside expression instead of defining it and binding it to an identifier
    10. ```ocaml
         let f' = fun i -> i mod 11 = 0;;
         val f' : int -> bool = <fun>

         let f'' i = i mod 11 = 0;;
         val f'' : int -> bool = <fun>
        ```

2. tail recursive

    1. result of function call is **NOT used** in another computation / expression

3. Investing Strictly Increasing Functions

    1. Assume Func f that is strictly increasing :
        1. f(0) < f(1) < f(2) < ... < f(n)
    2. let's find the inverse g of f, i.e. g(f n) = n
    3. using HIGHER ORDER FUNCTIONS
    4. only natural numbers
    5. ```math
         first (lambda k . f (k + 1) > f (n)) 0 = n
         n : 0 1 2 3 4 5 6 7 8 9 10
         f (n) = n^2 : 0 1 4 9 16 25 36 49 64 81 100

         f (n) = n ^ 2
         g (n) = sqrt n

         g (16) = 4
         g (16) i.e. for which n : f (n) = 16
       ```

    6. Inverse function
        1. faghat baraye vaght hayi hast ke monoton hast
        2. **Strictly Increasing Function**
    7. ```ocaml
         let rec first f k = if f k then k else first f (k+1);;
         val first : (int -> bool) -> int -> int = <fun>

         let inverse f y = first (fun x -> f (x + 1) > y) 0;;
         val inverse : (int -> int) -> int -> int = <fun>

         let sqrt = inverse (fun x -> x * x);;
         val sqrt : int -> int = <fun>
       ```

    8. ![alt](../Images/24-%20Session%20-%20Program.jpg)

4. Finding Zeros of a function

    1. values when you put it in a function, function returns 0
    2. Nullstellen
    3. ```ocaml
         let rec first f k = if f k then k else first f (k+1);;
         val first : (int -> bool) -> int -> int = <fun>

         let inverse f y = first (fun x -> f (x + 1) > y) 0;;
         val inverse : (int -> int) -> int -> int = <fun>

         let find_zero f = inverse f 0;;
       ```

    4. float arithmetics
        1. approximation
        2. imprecise
    5. dot after operator
        1. floating point operator
        2. ```ocaml
              1. /. 2.0;;
              - : float = 0.5
           ```
    6. without dot after the operator
        1. integer operation

5. Polymorphic FUnctions

    1. Many Shapes
    2. Many Types
    3. not specifying precisse type
    4. Tuples
        1. (1, 2)
            1. Type: int \* int
        2. ((1, true), 3)
            1. Type: (int \* bool) \* int
        3. (true, 2)
            1. Type: bool \* int
    5. ```ocaml

       ```

    6. function fst / snd

        1. extracts 1st element of a tuple
        2. extracts 2nd element of a tuple
        3. ```ocaml
            fst (1, 2);;
            - : int = 1

            snd (1, 2);;
            - : int = 2

            fst ((true, 2), 10);;
            - : bool * int = (true, 2)


            let fst (x, y) = x;;
            val fst : 'a * 'b -> 'a = <fun>

            let swap (x, y) = (y, x);;
            val swap : 'a * 'b -> 'b * 'a = <fun>

            swap(1, 2);;
            - : int * int = (2, 1)

            swap(true, 2);;
            - : int * bool = (2, true)
           ```

        4. General Iteration Function
        5. ```ocaml
               let rec iter f n x =
                  if n = 0 then x
                  else iter f (n-1) (f x);;

               val iter : ('a -> 'a) -> int -> 'a -> 'a = <fun>

               iter (fun x -> x * 5) 0 10;;
               - : int = 10

               iter (fun x -> x * 5) 1 10;;
               - : int = 50

               iter (fun x -> x * 5) 2 10;;
               - : int = 250

               iter (fun x -> x * 5) 3 10;;
               - : int = 1250

           ```

        6. F : Step Function
        7. ```ocaml
            n + x := (lambda a . a + 1) ^ n (x)
            n * x := (lambda a . a * 1) ^ n (x)
            n ^ x := (lambda a . a ^ 1) ^ n (x)

            iter (fun x -> x + 1) 3 0;;
            - : int = 3

            iter (fun x -> x * 2) 3 1;;
            - : int = 8

            iter (fun x -> x ^ 2) 3 1;;
            - : int = 256

            let succ x = x + 1
            let add x y = iter succ x y
            let mul x y = iter (add x) y 0
            let pow x y = iter (mul x) y 1

           ```
