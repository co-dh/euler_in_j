import scala.{Array => A}

object ps {

	def next( ns: A[Int]) : A[A[Int]] = {
		var r : A[A[Int]] = A()

		if(ns.length > 0){
			var c = ns.clone
			c(0) += 1
			r ++= A(c)
		}	
		for( i <- 0 until ns.length-1) {
			if(ns(i) > ns(i+1)){
				var c = ns.clone
				c(i+1) += 1
				r ++= A(c)
			}
		}
		r ++ A(ns ++ A(1))
	}


	def deq(x : A[A[Int]], y : A[A[Int]]) = 
		x.corresponds(y) { _ sameElements _ }


	def part(n : Int) : A[A[Int]] = {
		var x : A[A[Int]] = A(A())
		for( i <- 0 until n) 
			x = x.flatMap(next)
		
		x
	}

	def pp(aa: A[A[Int]]) : String = 
		aa.map( _ mkString " ") mkString "\n"

	def test() = {
		val n =  A(4,3)
		val expected = A(A(5, 3), A(4, 4), A(4, 3, 1))

		assert( deq(expected, next(n) )  , "next")

		assert( add1(3, A(2,1)).corresponds( A(3,2,1)) { _ == _ }   , "add1 a")
		assert( add1(3, A()).corresponds( A(1,1,1)) { _ == _ }  , "add1 b")
		//assert( add1(3, A(1,2,3,4)).corresponds( A(1,1,1)) { _ == _ }  , "add1 a")
	}	

	def add1(k : Int, p : A[Int]) : A[Int] = {
		//return an array whose length is k, 
		// and each element is pi+1. 
		// assume p.length <= k
		assume(p.length <= k, "p.length <= k")
		var a : A[Int] = new Array(k)
		for(i  <- 0 until k) {
			a(i) = 1
		}
		for( i <- 0 until p.length) {
			a(i) += p(i)
		}
		a
	}


	def prod_sum(k: Int) = {
		// return smallest N 
		// where { N = sum A = prod A, Ai in N, len(A) = k} 

		var n = 0
		var found = 0
		while (n < 1000 && found == 0) {
			for( p <- part(n) if p.length <= k) {
				if(add1(k, p).product == n + k){
					//return n
					found = n
				}
			}
			n += 1
		}
		n
	}
	
}
