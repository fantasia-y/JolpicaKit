[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffantasia-y%2FJolpicaKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/fantasia-y/JolpicaKit) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffantasia-y%2FJolpicaKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/fantasia-y/JolpicaKit)

#  JolpicaKit

JolpicaKit is a Swift Wrapper for the Jolpica API which is a replacement for the soon deprecated Ergast API.
Check out their GitHub Page [here](https://github.com/jolpica/jolpica-f1)!

# Installation

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13+ / watchOS 6+ / visionOS 1+
- Xcode 16+
- Swift 6+

## Swift Package Manager

If you're using Xcode, follow [this guide](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app) to JolipcaKit to your Project.
Use ``https://github.com/fantasia-y/JolpicaKit.git``for the url.

## Getting started

After adding the dependency you'll be able to import the package and initialize the client.

```
// Jolpica.swift

import JolpicaKit

let jolpica = Jolpica()
```

# Documentation

Documentation for the API can found at the Jolpica API [GitHub Page](https://github.com/jolpica/jolpica-f1/blob/main/docs/README.md).

# Configuration

At the moment no configuration is needed, just install the dependency and you're ready to go.
This section will change in the future as soon as the Jolpica team finished implementing access tokens.

## Logging

You can however enable logging

```
let jolpica = Jolpica(
    enableLogging: true
)
```

# TODO

- [ ] Query Parameters (limit, offset)
- [ ] More control over caching
- [ ] Tests

# Usage

Coming soon
