# Bookshelf

![coverage][coverage_badge]

Bookshelf app created by Kyrylo Kovalenko.

---

## Getting Started 🚀

First - install all dependencies:

```sh
    make bootstrap
```

After that you need to generate all the necessary files:

```sh
    make gen
```

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define=BASE_URL={url}

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --dart-define=BASE_URL={url}

# Production
$ flutter run --flavor production --target lib/main_production.dart --dart-define=BASE_URL={url}
```

do not forget to include the server address **BASE_URL**


_\*Bookshelf works on iOS, Android._

For cleaning all dependencies, you can call the command:

```sh
    make clean
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT