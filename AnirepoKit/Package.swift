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
        
    ],
    targets: [
        //Apps
        .target(
            name: "ProductionApp",
            dependencies: [
                "Routing",
                "TimelineFeature",
                "RecordFeature",
                "SearchFeature",
            ],
            path: "./Sources/Apps/Production"),
        .target(
            name: "CatalogApp",
            dependencies: [
                
            ],
            path: "./Sources/Apps/Catalog"),
        
        //Features
        .target(
            name: "TimelineFeature",
            dependencies: [
                
            ],
            path: "./Sources/Features/Timeline"),
        .target(
            name: "RecordFeature",
            dependencies: [
                
            ],
            path: "./Sources/Features/Record"),
        .target(
            name: "SearchFeature",
            dependencies: [
                
            ],
            path: "./Sources/Features/Search"),
        
        //Data
        .target(
            name: "AuthData",
            dependencies: [
                
            ],
            path: "./Sources/Data/Auth"),

        
        //Routing
        .target(
            name: "Routing",
            dependencies: [
                
            ],
            path: "./Sources/Routing"),
        
        //Core
        .target(
            name: "NetworkCore",
            dependencies: [
                
            ],
            path: "./Sources/Core/Network"),
        
        //Tools
        .target(
            name: "Tools",
            dependencies: [
                
            ],
            path: "./Sources/Tools"),



    ]
)
