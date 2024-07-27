# Getx Flutter Package

GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

## Installation

To install getx Package, follow these steps

1. Add the package to your project's dependencies in the `pubspec.yaml` file:
   
   ```yaml
   dependencies:
      get: ^4.6.6
    ``` 
3. Run the following command to fetch the package:
    ``` 
    flutter pub get
    ``` 
## Usage

1. Add "Get" before your MaterialApp, turning it into GetMaterialApp:
    ``` 
   void main() => runApp(GetMaterialApp(home: Home()));
    ```
