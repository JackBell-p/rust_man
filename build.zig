const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zig_webui = b.dependency("zig_webui", .{
        .target = target,
        .optimize = optimize,
        .enable_tls = false,
        .is_static = true,
    });

    const exe = b.addExecutable(.{
        .name = "rust_man",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    exe.root_module.addImport("webui", zig_webui.module("webui"));

    b.installArtifact(exe);
}
