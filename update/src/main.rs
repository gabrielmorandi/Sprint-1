use redis::Commands;
use std::process::Command;
use std::thread;
use std::time::Duration;

fn main() -> redis::RedisResult<()> {
    let client = redis::Client::open("redis://127.0.0.1:6379/")?;
    let mut connection = client.get_connection()?;

    loop {
        let contacts_hash: Vec<(String, String)> = connection.hgetall("contacts")?;

        for (field, value) in contacts_hash {
            println!("Campo: {}, Valor: {}", field, value);
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
                    &field,
                    "-e",
                    "phone",
                    &value,
                ])
                .output();
            thread::sleep(Duration::from_secs(1));
            let _output = Command::new("adb")
                .args(["shell", "input", "tap", "1000", "150"])
                .output();

            thread::sleep(Duration::from_secs(1));
            let _output = Command::new("adb")
                .args(["shell", "input", "tap", "850", "2350"])
                .output();

            thread::sleep(Duration::from_secs(1));
            let _output = Command::new("adb")
                .args(["shell", "input", "tap", "975", "150"])
                .output();

            thread::sleep(Duration::from_secs(1));
            let _: () = connection.hdel("contacts", field)?;
        }
    }
}
