#### Flutter Pigeon 他是用来干什么的，怎么使用




Flutter Pigeon 是 Flutter 官方推出的一个 ​**​代码生成工具**​​，用于简化 Flutter 与原生平台（Android/iOS）之间的通信。它通过定义类型安全的接口来自动生成平台通道（Platform Channel）代码，避免了手动编写 MethodChannel/EventChannel 的繁琐流程，同时提供更好的类型安全性和开发效率。
___
**主要作用​​**
**​1.​类型安全通信​**​：生成强类型的 Dart 和原生代码，避免手动解析数据时的类型错误。
**​2.​减少样板代码**​​：自动生成 MethodChannel 的调用代码，无需手动编写序列化/反序列化逻辑。
***​3.​跨平台支持***​​：同时生成 Android（Java/Kotlin）和 iOS（Objective-C/Swift）代码，确保两端一致性。
___

**​​使用步骤​​**

**1. 添加依赖**
在 pubspec.yaml 中添加 pigeon 开发依赖：
```yaml
dev_dependencies:
  pigeon: ^13.0.0
```
**2. 定义通信接口**
创建一个 .dart 文件（如 pigeon/messages.dart），使用 Pigeon 语法定义接口：

```dart
import 'package:pigeon/pigeon.dart';

// 定义要从 Flutter 传递到原生平台的数据模型
class Book {
  String title;
  String? author;
}

// 定义 Flutter 调用原生方法的接口
@HostApi()
abstract class BookApi {
  List<Book> getBooks();
  void addBook(Book book);
}

// 定义原生平台发送事件到 Flutter 的接口（可选）
@FlutterApi()
abstract class BookEvent {
  void onBookAdded(Book book);
}
```

**3. 生成代码**
运行命令生成平台代码：

```bash
flutter pub run pigeon \
  --input pigeon/messages.dart \
  --dart_out lib/pigeon.dart \
  --kotlin_out android/app/src/main/kotlin/com/example/app/Pigeon.kt \
  --swift_out ios/Runner/Pigeon.swift
```

**4. 实现原生端**
****Android 端（Kotlin）​​：****
```kotlin
class BookApiImpl : BookApi {
  override fun getBooks(): List<Book> {
    // 实现获取书籍逻辑
    return listOf(Book(title = "Flutter指南"))
  }

  override fun addBook(book: Book) {
    // 处理添加书籍
  }
}

// 在 MainActivity 中注册
Pigeon.BookApi.setUp(engine.dartExecutor.binaryMessenger, BookApiImpl())
```
**iOS 端（Swift）**​​：

```swift
class BookApiImpl: NSObject, PigeonBookApi {
  func getBooks() -> [PigeonBook] {
    // 实现获取书籍逻辑
    return [PigeonBook(title: "Flutter指南")]
  }

  func addBook(_ book: PigeonBook) {
    // 处理添加书籍
  }
}

// 在 AppDelegate 中注册
let api = BookApiImpl()
PigeonBookApi.setUp(binaryMessenger: controller.binaryMessenger, api: api)
```


**5. 在 Flutter 中使用**
```dart
import 'pigeon.dart';

void main() {
  // 获取原生平台的书籍
  List<Book> books = await BookApi().getBooks();
  
  // 添加书籍到原生平台
  BookApi().addBook(Book(title: "Dart编程"));
}
```
**高级用法​​**

* ​异步支持​​：接口方法可以返回 Future 或使用 async/await。
* ​错误处理​​：在接口方法中抛出 PlatformException 自动传递到 Flutter。
* ​复杂数据类型​​：支持嵌套对象、枚举、列表和 Map。


**注意事项​​**
**​1.​版本兼容性**​​：确保 Flutter 和 Pigeon 版本兼容（查看官方文档）。
**2.​​代码更新**​​：修改接口文件后需重新运行生成命令。
**​3.​空安全​**​：使用 ? 标记可空类型，确保与原生类型匹配。
通过 Pigeon，你可以更高效、安全地实现 Flutter 与原生平台之间的复杂交互，尤其适合需要频繁通信或传递复杂数据结构的场景。

```bash
  pigeon_generate: "dart run pigeon --input pigeons/message.dart --dart_out lib/pigeons/message.dart --swift_out ios/Runner/PigeonApi.swift --objc_header_out ios/Runner/PigeonApi.h --objc_source_out ios/Runner/PigeonApi.mm --kotlin_out android/app/src/main/kotlin/com/example/myflutterproject/PigeonApi.kt --kotlin_package com.example.myflutterproject"
```
