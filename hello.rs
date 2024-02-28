use std::process::Command;

fn main () {
    println!("hello");
    let _output = Command::new("adb")
    .args([
        "shell",
        "am",
        "start",
        "-a",
        "android.intent.action.INSERT",
        "-t",
        "vnd.android.cursor.dir/contact",
        "-e",
        "name",
        "tel0",
        "-e",
        "phone",
        "99999-8888",
    ])
    .output()
    .expect("Falha ao executar o processo1");

    let _output = Command::new("adb")
    .args([
        "shell",
        "input",
        "tap",
        "1000",
        "150",
    ])
    .output()
    .expect("Falha ao executar o processo2");
}