// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReviewsServices",
	platforms: [.iOS(.v14)],
    products: [
		.library(name: "ReviewsServicesInterfaces", targets: ["ReviewsServicesInterfaces"]),
        .library(name: "ReviewsServices", targets: ["ReviewsServices"]),
		.library(name: "ReviewsServicesMocks", targets: ["ReviewsServicesMocks"]),
    ],
    dependencies: [
		.package(path: "../AppContainer")
    ],
    targets: [
		.target(
			name: "ReviewsServicesInterfaces",
			dependencies: []
		),
        .target(
            name: "ReviewsServices",
            dependencies: [
				"ReviewsServicesInterfaces",
				.product(name: "AppContainer", package: "AppContainer"),
			]
		),
		.target(
			name: "ReviewsServicesMocks",
			dependencies: [
				"ReviewsServicesInterfaces",
				.product(name: "AppContainer", package: "AppContainer"),
			]
		),
    ]
)
