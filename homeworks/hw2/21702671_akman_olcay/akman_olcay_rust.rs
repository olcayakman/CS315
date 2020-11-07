

fn main() {

    let i = 0;
    for i in 0..5 {
        println!("rust code - {}", i);
    }
    println!("i outside the loop is: {}", i);


    let mut myArr: [i32; 5] = [0; 5];
    for i in 1..5 {
        myArr[i] = 33;
    }

    for i in 0..5 {
        print!("{} ", myArr[i]);
    }

    println!("");
    
    let myArr2 = ["s", "t", "r!"];
    for elem in myArr2.iter() {
        print!("{} ", elem);
    }
    println!();


}