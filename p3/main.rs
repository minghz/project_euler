/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143 ?
*/
fn main() {

    let mut prime_vector = Vec::new();

    for number in 1..13+1 {
        if is_prime(number) {
            prime_vector.push(number);
        }
    }

    println!("my primes: {:?}", prime_vector);

}

fn is_prime(n: i32) -> bool {
    for i in 2..n/2 {
        if n % i == 0 {
            return false;
        } else {
            println!("{} % {}", n, i);
        }
    }
    true
}
