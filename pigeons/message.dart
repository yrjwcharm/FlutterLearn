import 'package:pigeon/pigeon.dart';

/// 原生数据
class NativeBean {
  final int id;
  final String name;
  NativeBean(this.id, this.name);
}

/// Flutter数据
class FlutterBean {
  final int fId;
  final String fName;
  FlutterBean(this.fId, this.fName);
}

/// 重点关心这两个抽象类
@HostApi() // Flutter调用原生的方法写在下面  原生去实现
abstract class FlutterToNative {
  // 通过id从原生获取信息
  NativeBean loadNativeInfo(int id);
}

@FlutterApi() // 原生调用Flutter的方法 Flutter去实现
abstract class NativeToFlutter {
  FlutterBean getFlutterInfo(int id);
}
