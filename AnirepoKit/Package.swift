// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnirepoKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "Production",
            targets: ["ProductionApp"]),
        .library(
            name: "Catalog",
            targets: ["CatalogApp"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios.git",
            .upToNextMajor(from: "1.0.0")
        ),
    ],
    targets: [
        //Apps
        .target(
            name: "ProductionApp",
            dependencies: [
                "Routing",
                "SearchFeature",
                "WorkDetailFeature",
            ],
            path: "./Sources/Apps/Production"),
        .target(
            name: "CatalogApp",
            dependencies: [
                
            ],
            path: "./Sources/Apps/Catalog"),
        
        //Features
        .target(
            name: "SearchFeature",
            dependencies: [
                "SearchData"
            ],
            path: "./Sources/Features/Search"),
        .target(
            name: "WorkDetailFeature",
            dependencies: [
                "WorkDetailData"
            ],
            path: "./Sources/Features/WorkDetail"),
        
        //Data
        .target(
            name: "SearchData",
            dependencies: [
                "GraphQLCore"
            ],
            path: "./Sources/Data/Search"),
        .target(
            name: "WorkDetailData",
            dependencies: [
                "GraphQLCore"
            ],
            path: "./Sources/Data/WorkDetail"),

        
        //Routing
        .target(
            name: "Routing",
            dependencies: [
                
            ],
            path: "./Sources/Routing"),
        
        //Core
        .target(
            name: "GraphQLCore",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios"),
            ],
            path: "./Sources/Core/GraphQL"),


    ]
)
