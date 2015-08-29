let a = 1

let next (ns : int []) : int [] list =
    let r  =  
        if ns.Length > 0 then  
            let c = ns.[0..]
            c.[0] <- c.[0] + 1
            c :: [] 
        else []
    r
printfn "hello " //next [|4; 3|]