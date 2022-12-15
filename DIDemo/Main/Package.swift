// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
	platforms: [.iOS(.v14)],
    products: [
        .library(name: "Main", targets: ["Main"]),
    ],
    dependencies: [
		.package(path: "../ReviewsServices"),
		.package(path: "../ReviewsModule")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: [
				.product(name: "ReviewsServices", package: "ReviewsServices"),
				.product(name: "ReviewsModule", package: "ReviewsModule"),
			]
		)
    ]
)
