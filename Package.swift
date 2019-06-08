// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ModernNotificationCenter",
    products: [
        .library(
            name: "ModernNotificationCenter",
            targets: ["ModernNotificationCenter"]),
        .library(name: "MNCKeyboardNotifications",
                 targets: ["MNCKeyboardNotifications"])
    ],
    targets: [
        .target(
            name: "ModernNotificationCenter",
            dependencies: []),
        .testTarget(
            name: "ModernNotificationCenterTests",
            dependencies: ["ModernNotificationCenter"]),
        .target(name: "MNCKeyboardNotifications",
                dependencies: ["ModernNotificationCenter"])
    ],
    swiftLanguageVersions: [.v5]
)
