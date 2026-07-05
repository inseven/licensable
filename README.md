# Licensable

[![build](https://github.com/inseven/licensable/actions/workflows/build.yaml/badge.svg)](https://github.com/inseven/licensable/actions/workflows/build.yaml)

Lightweight Swift API for exporting license information

## Documentation

https://inseven.github.io/licensable/documentation/licensable/

## Usage

```swift
extension Licensable where Self == License {

  public static var interact: License {

    let licenseURL = Bundle.module.url(forResource: "LICENSE", withExtension: nil)!

    return License(id: "https://github.com/inseven/interact",
                   name: Package.name,
                   author: Package.author,
                   text: try! String(contentsOf: licenseURL),
                   attributes: [
                     .url(URL(string: "https://github.com/inseven/interact")!, 
                        title: "GitHub"),
                   ],
                   licenses: [
                     .licensable,
                   ])
  }

}
```

## License

Licensable is licensed under the MIT License (see [LICENSE](LICENSE)).
