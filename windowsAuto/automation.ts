import { exec } from "child_process";

exec("wmctrl -l", (error, stdout, stderr) => {
  if (error) {
    console.log(`error: ${error.message}`);
    return;
  }
  if (stderr) {
    console.log(`stderr: ${stderr}`);
    return;
  }
  const arr = stdout.split(" ");
  let windows: string[] = [];
  arr.forEach((ele, index) => {
    if (ele === "null") {
      windows.push(arr[index + 1]);
    }
  });
  console.log(windows);

  windows.forEach((window: string) => {
    exec(`wmctrl -a ${window}`);
    exec(`wmctrl -c ${window}`);
  });
  exec('notify-send "All windows are closed. You can shut down the PC"');
});
