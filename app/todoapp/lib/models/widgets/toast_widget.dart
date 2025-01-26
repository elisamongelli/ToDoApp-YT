import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/assets/global.dart';


class ToastWidget extends StatefulWidget {
  
  const ToastWidget({super.key, required message, required success});

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
  }


  @override
  Widget build(BuildContext context) {

    return Container(
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
          this.success ? 
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ) : 
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}