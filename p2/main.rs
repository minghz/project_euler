fn main() {

    let term_limit = 4000000;

    let mut term;

    let mut p = 1;
    let mut c = 2;

    let mut sum_of_evens = 2;

    loop {
        term = p + c;

        if term > term_limit { break; }

        if (term % 2) == 0 {
            sum_of_evens += term;
            println!("term: {} <--- even | sum: {}", term, sum_of_evens);
        } else {
            println!("term: {}", term);
        }

        p = c;
        c = term;
    }

    println!("sum of even: {}", sum_of_evens);

}
