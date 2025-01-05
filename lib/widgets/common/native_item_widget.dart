import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class NativeItemWidget extends StatefulWidget {
  const NativeItemWidget({super.key, required this.id});

  final int id;

  @override
  State<NativeItemWidget> createState() {
    return _NativeItemWidgetState();
  }
}


class _NativeItemWidgetState extends State<NativeItemWidget> {

  double? _nativeViewHeight = 0;

  @override
  void initState() {
    super.initState();
    _setupChannel();
  }

  void _setupChannel() {
    const platform = MethodChannel('native_view_');
    platform.setMethodCallHandler((call) async {
      if (call.method == 'updateHeight') {
        final height = call.arguments['height'] as double?;
        debugPrint("height = $height"); // 使用 debugPrint 和字符串插值
        setState(() {
          _nativeViewHeight = height ?? 0; // 处理可能的 null 值
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    final String viewType = 'native_view';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return Container(
      width: MediaQuery.of(context).size.width,
      height: _nativeViewHeight, // Use the updated height here
      child: PlatformViewLink(
        viewType: viewType,
        surfaceFactory:
            (BuildContext context, PlatformViewController controller) {
          // 将 PlatformViewController 转换为 AndroidViewController
          final AndroidViewController androidViewController =
          controller as AndroidViewController;
          return AndroidViewSurface(
            controller: controller,
            gestureRecognizers: const <Factory<
                OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (PlatformViewCreationParams params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: StandardMessageCodec(),
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      )
    );
  }
}