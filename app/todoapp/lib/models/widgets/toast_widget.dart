import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/assets/global.dart';


class ToastWidget extends StatefulWidget {

  final String message;
  final bool success;
  
  const ToastWidget({super.key, required this.message, required this.success});

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}


class _ToastWidgetState extends State<ToastWidget> {

  late FToast fToast;


  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);

    // shows toast after build is completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomToast();
    });
  }


  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }


  void showCustomToast() {

    Widget customToast = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: darkGreyColor
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.success ? 
            Icon(
              Symbols.check_circle_rounded,
              color: Colors.green,
            ) : 
            Icon(
              Symbols.close_rounded,
              color: Colors.red,
            ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            widget.message,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );


    fToast.showToast(
      child: customToast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2)
    );
  }
}