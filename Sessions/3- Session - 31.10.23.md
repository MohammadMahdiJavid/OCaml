# Session (31.10.23)

## Resources

## Notes

1. ```ocaml

   ```

2. Digit Sum

    1. ```ocaml
        (* sum of all of the digit of a number *)
        (*
        * 367
        * 3 + 6 + 7 = 16
        *)
        let rec digit_sum n =
            if n < 10 then n
            else (n mod 10) + digit_sum (n / 10)

        digit_sum 367;;
        - : int = 16

        (367 mod 10) + digit_sum (367 / 10) =
        (7) + (36 mod 10) + digit_sum(36 / 10) =
        (7) + (6) + (3 mod 10) + digit_sum(3 / 10) =
        (7) + (6) + (3) + (0) = 16

        (* mod 10 : remainder of the division by 10
        * first digit of the number (from right)
        *)

        digit_sum n := n              n < 10
        digit_sum n := (n mod 10) + digit_sum (n div 10)

        ds : digit sum

        execution trace :
            ds 367 = 7 + ds 36 = 7 + 6 + ds 3 = 7 + 6 + 3
       ```

    2. ```ocaml
        (* Digit Reversal *)
        (* n : number, r : result *)
        let rec digit_reversal n r =
            if n < 10 then n + r * 10
            else digit_reversal (n / 10) ((n mod 10) + r * 10)

        (*
        * 367
        * 7 + reverse 36
        * 7 * 10 + 6 + reverse 3
        * 7 * 10 + 6 * 10 + 3
        *
        * rev 367 0 = rev 36 7
        *           = rev 3  76
        *           = rev 0  763
        *)

        let rec rev' n =
            if n < 10 then n
            else (n mod 10) * 10 + rev' (n / 10)

        let rev n = rev' n 0

        rev 367;;
        - : int = 763





        (* a very wrong reverse function, it needs base case, and 2nd argument *)
        let rec rev' n = if n < 10 then n else (n mod 10) * 10 + rev' (n / 10);;

        rev' 367;;

        > val rev' : int -> int = <fun>
        > - : int = 133

       ```

3. Greatest Common Divisor (ggT)

    1. ```ocaml
        gcd x y :=
            the greatest number q, such that there exist n and m,
            such that x = q * n and y = q * m

        x + y > 0

        gcd 34 85 = 17
        34 = 2 * 17
        85 = 5 * 17

        (*
        * gcd x 0 = x
        * gcd x y = gcd y (x mod y) if y > 0
        *
        * how 2 sets are equal?
        * set1 is a subset of set 2
        * set2 is a subset of set 1
        *
        *)
       ```

    2. ```ocaml
        let rec gcd x y = if y < 1 then x
                          else gcd y (x mod y)

        (*
        * Execution Trace :
        * gcd 36 132 =
        * gcd 132 (36 % 132) =
        * gcd 132 36 =
        * gcd 36 (132 % 36) =
        * gcd 36 24 =
        * gcd 24 (36 % 24) =
        * gcd 24 12 =
        * gcd 12 (24 % 12) =
        * gcd 12 0 =
        * 12
        * gcd is a tail recursive function
        *)
       ```

    3. tail recursive function
        1. result of function call is NOT used in another computation / expression
        2. it is immediately returned
        3. power is NOT a tail recursive function
        4. gcd is a tail recursive function
    4. Tail Recursion
        1. less memory overhead
        2. faster
    5. Using Accumulator, Tail Recursive
    6. **Tail Recursive Power Function using Accumulator**

        1. ```ocaml
                let pow x n = pow' x n 1
                let rec pow' x n a = if n < 1 then a
                                     else pow' x (n - 1) (a * x)
                (* initialize accumulator with 1 *)

                pow 2 3 = pow' 2 3 1
                        = pow' 2 2 2
                        = pow' 2 1 4
                        = pow' 2 0 8
                        = 8

                (* pow x n : Z -> N -> Z *)

                let pow_checked x n = if n > 0 then pow x n
                                      else invalid_arg
                (* pow_checked x n : Z -> N -> Z option *)


           ```

4. Tuples

    1. return more than one value
    2. ```ocaml
       let f x y = (x + y, x * y)
       (* f : int -> int -> int * int *)

       let (a, b) = f 3 4
       (* a : int = 7
        * b : int = 12
        *)

       let (a, b) = f 3 4 in a + b
       (* 19 *)

       let (a, b) = f 3 4 in a + b, a * b
       (* (19, 12) *)

       let (a, b) = f 3 4 in a + b, a * b, a - b
       (* (19, 12, -1) *)

       let (a, b) = f 3 4 in a + b, (a * b, a - b)
       (* (19, (12, -1)) *)

       let (a, (b, c)) = f 3 4 in a + b, a * b, a - b
       (* (19, 12, -1)
       ```

    3. ```ocaml
        (2, 1, 39) : Z * Z * Z : int * int * int

        (2, 3) : int * int

        (3, false) : int * bool

        ((2, 3), (false, 5)) : (int * int) * (bool * int)
       ```

    4. ```occaml
        let hms x = x / 3600, (x mod 3600) / 60, x mod 60
        let hms' x = let h = x / 3600 in
                        let m = (x mod 3600) / 60 in
                            let s = x mod 60 in
                                (h, m, s)

        > val hms' : int -> int * int * int = <fun>
        (h, m, s) : int * int * int

        (* local declaration *)
       ```

    5. ```ocaml
        let sec (h, m, s) = h * 3600 + m * 60 + s;;
       ```
    6. ```ocaml
        let max x y = if x > y then x else y
        > val max : int -> int -> int = <fun>
        (* partial application *)
        let max' 0 y = max 0 y

        let max (x, y) = if x > y then x else y
        > val max : int * int -> int = <fun>
       ```

5. Higher Order Functions

    1. First Order Functions
    2. Higher Order Functions
    3. ```ocaml
        let rec first f l = match l with
                            | [] -> invalid_arg "first"
                            | x :: xs -> if f x then x else first f xs

        let rec first' f k = if f k then k
                                else first f (k + 1)
        > val first' : (int -> bool) -> int -> int = <fun>
       ```

    4. x | y is the highest number q such that q . y <= x
    5. := is the least q such that (q + 1) . y > x
    6. x | y := first (lambda q . (q + 1) . y > x) 0
    7. ```ocaml
        let div x y = first (fun q -> (q + 1) * y > x) 0
       ```
