const std = @import("std");
const webui = @import("webui");

pub fn main() !void {
    const window = webui.newWindow();
    defer webui.clean();

    const html = @embedFile("index.html");

    _ = try window.show(html);
    webui.wait();
}
