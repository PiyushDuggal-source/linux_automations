"use strict";
exports.__esModule = true;
var child_process_1 = require("child_process");
(0, child_process_1.exec)("wmctrl -l", function (error, stdout, stderr) {
    if (error) {
        console.log("error: ".concat(error.message));
        return;
    }
    if (stderr) {
        console.log("stderr: ".concat(stderr));
        return;
    }
    var arr = stdout.split(" ");
    var windows = [];
    arr.forEach(function (ele, index) {
        if (ele === "null") {
            windows.push(arr[index + 1]);
        }
    });
    console.log(windows);
    windows.forEach(function (window) {
        (0, child_process_1.exec)("wmctrl -a ".concat(window));
        (0, child_process_1.exec)("wmctrl -c ".concat(window));
    });
    (0, child_process_1.exec)('notify-send "All windows are closed. You can shut down the PC"');
});
