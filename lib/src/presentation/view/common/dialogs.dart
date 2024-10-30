import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:micit_test/src/core/utils/extension.dart';

Future<T?> customBottomSheet<T>(
    {required BuildContext context,
    required Widget Function(BuildContext context, BoxConstraints constraints) builder,
    required double height,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    Color? backgroundColor,
    AnimationController? controller,
    TickerProvider? vsync,
    bool? canClose = true,
    bool? canSystemPop = true,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding}) async {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    useSafeArea: false,
    isDismissible: canClose!,
    enableDrag: canClose,
    backgroundColor: backgroundColor,
    shape: shape,
    constraints: BoxConstraints(
      minHeight: height,
      maxHeight: context.sizeSide.largeSide,
      minWidth: context.sizeSide.width,
    ),
    builder: (context) {
      return PopScope(
        canPop: canSystemPop!,
        child: Padding(
          padding: padding ??
              EdgeInsets.only(
                left: context.sizeSide.smallSide * .045,
                right: context.sizeSide.smallSide * .045,
                bottom: context.viewInsets.bottom,
              ),
          child: SizedBox(
            height: height,
            child: LayoutBuilder(
              builder: builder,
            ),
          ),
        ),
      );
    },
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG, // Toast duration
      gravity: ToastGravity.BOTTOM, // Position of toast
      backgroundColor: Colors.black54, // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0 // Font size
      );
}

Future<bool?> showLoadingDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  ).then((value) => true);
}
