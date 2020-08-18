# Quick start guide

In order to create and manage our flavors, we're going to use the [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr) package.
To install all dependencies or run our built-in flavors, use the Makefile to view all possibilities:

```
make help
```

## Creating a new flavor

To create a new flavor, you need to edit the `flavorizr` key at the `pubspec.yaml`, like this:

```
flavorizr:
  app:
    ...

  flavors:
    ...

    new_flavor:
      app:
        name: "New Flavor Name"

      android:
        applicationId: "com.fiorin.newflavor"

      ios:
        bundleId: "com.fiorin.newflavor"
```

To finally generate all `Android`/`iOS` files, you need to run:

```
flutter pub run flutter_flavorizr
```

This will create all needed configuration in order to use flavors at Android/iOS platforms and automatically create a `main-newflavor.dart` and the custom configs at `flavors.dart`

> Notes: Our `lib/` filenames and configuration is managed by the `flutter_flavorizr` package, so we can't override, create or manage by ourselves files like `flavors.dart`, `app.dart` and `main-<flavor>.dart`. So, I strongly recommend using my custom `make install-custom-flavors` in order to use this architecture correctly.

## Running a custom flavor

In order to run your app with any flavor in your device, you simply need to run:

```
flutter run --flavor <flavorName> -t lib/main-<flavorName>.dart
```
