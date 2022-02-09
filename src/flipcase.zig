const std = @import("std");

pub fn main() void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    const exitSuccess = 0;
    const exitReadError = 1;
    const exitWriteError = 2;

    while (true) {
        if (stdin.readByte()) |byte| {
            const out: u8 = if (byte >= 'a' and byte <= 'z') (byte - 'a' + 'A') else if (byte >= 'A' and byte <= 'Z') (byte - 'A' + 'a') else byte;

            stdout.writeByte(out) catch std.os.exit(exitWriteError);
        } else |err| switch (err) {
            error.EndOfStream => {
                std.os.exit(exitSuccess);
            },
            else => {
                std.os.exit(exitReadError);
            },
        }
    }
}
