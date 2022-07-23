"use strict";
exports.__esModule = true;
var child_process_1 = require("child_process");
(0, child_process_1.exec)("wmctrl -l && hostname", function (error, stdout, stderr) {
    if (error) {
        console.log("error: ".concat(error.message));
        return;
    }
    if (stderr) {
        console.log("stderr: ".concat(stderr));
        return;
    }
    var arr = stdout.split(" ");
    var name = arr.pop();
    var nameArr = (name === null || name === void 0 ? void 0 : name.split("\n")) || [];
    var windows = [];
    arr.forEach(function (ele, index) {
        if (ele === nameArr[1]) {
            windows.push(arr[index + 1]);
        }
    });
    windows.forEach(function (window) {
        (0, child_process_1.exec)("wmctrl -a ".concat(window));
        (0, child_process_1.exec)("wmctrl -c ".concat(window));
    });
    (0, child_process_1.exec)('notify-send "All windows are closed. You can shut down the PC"');
});
