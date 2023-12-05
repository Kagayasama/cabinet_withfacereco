import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final lockerNumberController = TextEditingController(text: '1');
  final codeController = TextEditingController(text: '14514');

  Future<bool> verifyAndOpenLocker(String lockerNumber, String code) async {
    // 硬件端通信接口，此处假设返回结果 = true

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('骑手存餐'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: lockerNumberController,
                decoration: InputDecoration(labelText: '柜号'),
              ),
              TextField(
                controller: codeController,
                decoration: InputDecoration(labelText: '验证码'),
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isSuccess = await verifyAndOpenLocker(
                    lockerNumberController.text,
                    codeController.text,
                  );
                  if (isSuccess) {
                    _showSuccessDialog();
                  } else {

                  }
                },
                child: Text('存餐'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    Fluttertoast.showToast(
      msg: "柜门已开，请存餐",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
