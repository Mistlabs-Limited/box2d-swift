// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "box2d-swift",
    products: [
        .library(name: "Box2D", targets: ["Box2D"]),
    ],
    targets: [
        .target(
            name: "Box2D",
            path: ".",
            exclude: [
                ".clang-format",
                ".gitattributes",
                ".github",
                "benchmark",
                "build.sh",
                "build_emscripten.sh",
                "create_sln.bat",
                "CMakeLists.txt",
                "deploy_docs.sh",
                "docs",
                "extern",
                "LICENSE",
                "README.md",
                "samples",
                "shared",
                "src/CMakeLists.txt",
                "src/box2d.natvis",
                "test",
            ],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src"),
                .define("BOX2D_VALIDATE", .when(configuration: .debug)),
            ],
            linkerSettings: [
                .linkedLibrary("m", .when(platforms: [.linux])),
                .linkedLibrary("pthread", .when(platforms: [.linux])),
            ]
        ),
    ],
    cLanguageStandard: .gnu17
)
