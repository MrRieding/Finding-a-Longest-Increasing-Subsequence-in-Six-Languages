let max x y = if x > y then x else y;;

let l_l list = List.fold_left(fun temp a -> if List.length temp < List.length a then a else temp) [] list

(*This solution is purely functional, not O(nlogn) unfortunately.*)

let subs d list =
        let rec _subs temp = function (*Helper function*)
                | h::t-> _subs (if (List.hd (List.rev h)) < d then
                        h::temp
                else temp) t
        | []-> temp
        in _subs [] list

let lis li =
        let rec _lis list = function (*h::t is like head and tail*)
        | h::t -> _lis ((l_l (subs h list)@[h])::list) t (*l_l is longest list*)
        | []-> l_l list
      in _lis [] li
