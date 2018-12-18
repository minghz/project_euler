fn main() {
    
    let mut sum = 0;
    for num in (1..1000).rev() {
        if (num % 3) == 0 || (num % 5) == 0 {
            sum += num;
        }
    }
    println!("Sum: {}", sum);

}
