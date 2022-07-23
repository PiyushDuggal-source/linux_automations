import { exec } from "child_process";

exec("wmctrl -l && hostname", (error, stdout, stderr) => {
  if (error) {
    console.log(`error: ${error.message}`);
    return;
  }
  if (stderr) {
    console.log(`stderr: ${stderr}`);
    return;
  }
  const arr = stdout.split(" ");
  const name = arr.pop();
  const nameArr = name?.split("\n") || [];
  let windows: string[] = [];
  arr.forEach((ele, index) => {
    if (ele === nameArr[1]) {
      windows.push(arr[index + 1]);
    }
  });

  windows.forEach((window: string) => {
    exec(`wmctrl -a ${window}`);
    exec(`wmctrl -c ${window}`);
  });
  exec('notify-send "All windows are closed. You can shut down the PC"');
});
