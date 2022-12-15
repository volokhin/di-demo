// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "ReviewsModule",
	platforms: [.iOS(.v14)],
	products: [
		.library(name: "ReviewsModule", targets: ["ReviewsModule"]),
	],
	dependencies: [
		.package(path: "../ReviewsServices")
	],
	targets: [
		.target(
			name: "ReviewsModule",
			dependencies: [
				.product(name: "ReviewsServicesInterfaces", package: "ReviewsServices"),
			]
		),
		.testTarget(
			name: "ReviewsModuleTests",
			dependencies: [
				"ReviewsModule",
				.product(name: "ReviewsServicesMocks", package: "ReviewsServices")
			]
		),
	]
)
