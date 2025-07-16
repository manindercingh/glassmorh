
# Glassmorph

A lightweight and customizable Flutter widget for applying **Glassmorphism** effects to any container. Easily add blur, transparency, and optional borders to give your UI a modern, frosted-glass look.

[![Pub Version](https://img.shields.io/pub/v/glassmorph)](https://pub.dev/packages/glassmorph)
[![Buy Me a Coffee](https://img.shields.io/badge/☕-Buy%20Me%20a%20Coffee-orange)](https://coff.ee/manindersingh)

## ✨ Features

- Customizable blur intensity
- Background color with transparency
- Optional glass border
- Configurable padding and border radius
- Easy to integrate

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  glassmorph: <latest_version>
```

Replace `<latest_version>` with the current version of your package.

## 🔧 Usage

```dart
import 'package:glassmorph/glassmorph.dart';

Glassmorph(
  borderRadius: 20,
  glassEffect: 10,
  glassBGColor: Colors.white.withOpacity(0.2),
  enableGlassBorder: true,
  glassBorder: Colors.white.withOpacity(0.3),
  padding: EdgeInsets.all(16),
  child: Text(
    'Hi Maninder Singh',
    style: TextStyle(color: Colors.white),
  ),
)
```

## 📄 Parameters

| Property            | Type             | Description                                      | Default                           |
|---------------------|------------------|--------------------------------------------------|-----------------------------------|
| `child`             | `Widget`         | **Required.** Content inside the glass container | —                                 |
| `padding`           | `EdgeInsets?`    | Inner padding                                    | `EdgeInsets.all(15)`              |
| `borderRadius`      | `double?`        | Border radius for rounded corners                | `25.0`                            |
| `glassEffect`       | `double?`        | Blur intensity for the background                | `15.0`                            |
| `glassBGColor`      | `Color?`         | Background color with opacity                    | `Colors.white.withOpacity(0.2)`   |
| `enableGlassBorder` | `bool`           | Toggle border around the glass container         | `false`                           |
| `glassBorder`       | `Color?`         | Color of the optional border                     | `Colors.white.withOpacity(0.3)`   |

## 📦 Internals

The main implementation lives in:

- [`glassmorph.dart`](lib/glassmorph.dart): The public-facing widget
- [`glassmorph_config.dart`](lib/glassmorph_config.dart): Handles defaults and logic for rendering


### 🖼️ Welcome to Glassmorph

![Welcome to Glassmorph](screenshots/welcome_glassmorph.jpg)

---

## 📜 License

MIT License. See [LICENSE](LICENSE) for more information.
