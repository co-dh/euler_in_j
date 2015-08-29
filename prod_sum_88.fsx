
let next (ns : int []) : int [][]  =
    seq {
        if ns.Length > 0 then  
            let c = Array.copy ns
            c.[0] <- c.[0] + 1
            yield c
        for i in 0 .. ns.Length - 2 do
            if ns.[i] > ns.[i+1] then
                let c = Array.copy ns
                c.[i+1] <- c.[i+1] + 1
                yield c
        yield ( Array.append ns [|1|] )      
    } |> Seq.toArray


let next2 : int [][] -> int [][] =  
    Array.map next >> Array.concat >> Array.toSeq >> Seq.distinct >> Seq.toArray

let part0 (n : int) :  int [][] = 
    let mutable x =  [| [||] |] 
    for i in 0 .. n-1 do 
        x <- next2 x
    x


let memoize f =
    let dict = new System.Collections.Generic.Dictionary<int,int[][]>()
    fun n ->
        match dict.TryGetValue(n) with
        | (true, v) -> 
            printfn "cached %d" n
            v
        | _ ->
            let temp = f(n)
            printfn "put in cache <- %d" n
            dict.Add(n, temp)
            temp

let rec part1 = memoize (fun n ->
        if n = 0 then 
            [| [||] |] 
        else
            next2 (part1 (n - 1))
    )    


let rec partr (n : int) (m : int): seq<int[]> =
    seq {
        if n = 0 then
            yield [| |]
        elif m = n then
            yield [|m|]    
        else
            for h in m .. n do 
                let n1 = n - h
                let m1 = h
                if n1 = 0 || n1 = m1 || m1 <= n1 then
                    for res in partr n1 m1 do
                        yield Array.append [|h|] res
    }

let part (n : int) = partr n 1

let join (sep : string) : seq<int> -> string = 
    Seq.map string >> Seq.reduce (fun x y -> x + sep + y )

let show (a2 : seq<int []>) : string =
    a2 |> Seq.map (join " ") |> Seq.reduce(fun x y -> x + "\n" + y )


let add1( k : int) (p : int []) : int [] =
    assert (p.Length <= k)
    let a = Array.create k 1
    for i in 0 .. p.Length - 1 do
        a.[i] <- a.[i] + p.[i]
    a    

let echo (desc : string) x = 
    printf "%s" desc
    printfn "%A" x
    x

let prod_sum (k:int) = 
    printfn "%d" k
    let n1 = Seq.initInfinite (fun x -> x ) |> Seq.tryFind ( fun n ->
        printfn "n: %d, k: %d, n+k:%d" n k (n+k)
        let res = part(n) |> Seq.tryFind ( fun p ->
            add1 k p 
                //|> echo "add1: "
                |> Seq.reduce (*) 
                //|> echo "prod: "
                |> (=) (n+k)
                //|> echo "=:  "
            )

        match res with 
            | Some(foo) -> 
                printfn "%A" foo
                true
            | None -> false
        )
    match n1 with 
        | Some x -> x + k
        | None -> 
            printfn "failed %d" k
            -1

//printfn "%A" (add1 3 [|1; 2|])
//printfn "%A" (prod_sum 2)
//{ 2 .. 1200 } |> Seq.map p |> Seq.distinct |> Seq.reduce (+);;
//part 30 |> show;;
let part5 (n:int) = 
    let a = Array.zeroCreate 40 
    let rec recasc (n:int) (m:int) (k : int) : seq<int[]> = 
        seq {
            for x in m .. (n/2) do
                a.[k] <- x
                yield! (recasc (n-x) x (k+1) ) 
            a.[k] <- n
            yield a.[1 .. k+1]    
        }    
    recasc n 1 1
        
    