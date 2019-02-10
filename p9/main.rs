/* 

   A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
   a2 + b2 = c2

   For example, 3^2 + 4^2 = 5^2
   9   + 16  = 25

   There exists exactly one Pythagorean triplet for which a + b + c = 1000.
   Find the product abc.

*/

// find a, b, c
// find a*b*c
//
// find square of all numbers up to 1000
// 1^2, 2^2, 3^2, 4^2.... 1000^2
// find set of all [a, b, c] that adds to 1000
// check which set [a, b, c] fulfills a^2 + b^2 = c^2
//
// but a < b < c
//

fn main() {

    for i in 1..1000 {
        for j in i+1..1000 {
            for k in j+1..1000 {
                //println!("trying {} {} {}", i, j, k);
                if (i as u32).pow(2) + (j as u32).pow(2) == (k as u32).pow(2) &&
                    i + j + k == 1000 {
                    println!("found it! {}", i*j*k);
                    println!("i, j, k: {} {} {}", i, j, k);
                    println!("          {} + {} = {}", (i as u32).pow(2), (j as u32).pow(2), (k as u32).pow(2));
                }

            }
        }
    }
}
