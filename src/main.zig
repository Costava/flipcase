//! The program reads an ASCII stream of bytes from stdin
//! and outputs the bytes to stdout while flipping the case of letters.
//!
//! Look at the top of main for the program's return code in different cases.
//!
//! Tested with zig 0.8.0

const std = @import("std");

pub fn main() void {
    // getStdOut is seen in the "Hello World" section of
    // https://ziglang.org/documentation/0.8.0/
    //
    // But is not documented at
    // https://ziglang.org/documentation/0.8.0/std/
    // > This declaration is not tested or referenced
    //
    // Is there a better way to get stdin and stdout?

    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    const exitSuccess = 0;
    const exitReadError = 1;
    const exitWriteError = 2;

    while (true) {
        if (stdin.readByte()) |byte| {
            // Flip the case of the input byte if the byte is a letter.
            // zig fmt wants to put this all on one line (not acceptable).
            const out: u8 =
                if (byte >= 'a' and byte <= 'z') (byte - ('a' - 'A'))
                else if (byte >= 'A' and byte <= 'Z') (byte + ('a' - 'A'))
                else byte;

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
