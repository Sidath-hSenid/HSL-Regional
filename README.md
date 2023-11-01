# HSL-Regional

HSL Regional Application, customize the app according to user's region.

## Introduction

HSL Regional Application, developed to customise the colours and texts in the application according to user's region, it uses Firebase Analytics to collect user's location data. This data is used solely for determining user's region and customize the application.

## Installation

To get started with the HSL Regional Application, follow these steps:

### Prerequisites

Before you begin, make sure you have the following prerequisites:

- [Flutter](https://flutter.dev/) installed on your system.

### 1. Clone the Repository

- git clone https://github.com/Sidath-hSenid/HSL-Regional.git

### 2. Firebase Setup

All the necessary firebase dependencies are already added to pubspec.yaml file:

- dependencies:
    flutter:
        sdk: flutter
    flutterfire_cli: ^0.2.7
    firebase_core: ^2.19.0
    firebase_remote_config: ^4.3.1
    firebase_analytics: ^10.6.1

To download the dependencies run following command on terminal:

- flutter pub get

### 3. Run the App

Run the application on local device or emulator by executing:

- flutter run

## Customization

The HSL Regional Application will collect user's location data through Firebase Analytics and determine the user's region.
Customization of colors and texts will be automatically applied using Firebase Remote Config based on the user's region.

## Android app

You can download the Android application from the links below.

- https://play.google.com/apps/testing/com.hsl.regional_app

- https://play.google.com/store/apps/details?id=com.hsl.regional_app