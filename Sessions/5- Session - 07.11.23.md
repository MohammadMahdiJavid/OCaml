# Session (2.11.23)

## References

1. []()

## Notes

1. ```ocaml
   (*
   * Fibonacci Numbers
   * fib (0) := 0
   * fib (1) := 1
   * fib (n + 2) := fib (n + 1) + fib (n)
   *
   * 0 : 0
   * 1 : 1
   * 2 : 1
   * 3 : 2
   * 4 : 3
   *)

   let rec fib n = if n < 2 then n else fib (n - 1) + fib (n - 2);;
   ```

2. using 2 accumulators, to pass previous fibonacci number
3. or pair of 2 values : tuple would be better
4. ```ocaml
   let rec fib n =
     let rec fib_aux n (a, b) =
       if n = 0 then a
       else fib_aux (n - 1) (b, a + b)
     in
     fib_aux n (0, 1);;
   ```
5. ```ocaml
    let rec fib' (a, b) n = if n <= 0 then a else fib' (b, a + b) (n - 1);;
   ```
6. N-Th Prime Number
7. ```ocaml
    let rec is_prime n =
      let rec is_prime_aux n d =
         if d * d > n then true
         else if n mod d = 0 then false
         else is_prime_aux n (d + 1)
      in
      is_prime_aux n 2;;
   ```
