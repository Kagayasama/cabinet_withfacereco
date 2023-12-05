import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomerFetchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('取餐页面'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white], // 从蓝色到白色的渐变
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () => onFacialRecognitionButtonPressed(context),
            child: Text('人脸识别取餐'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button color
              onPrimary: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }

  void onFacialRecognitionButtonPressed(BuildContext context) async {
    bool isRecognized = true; // 直接设置为true，模拟识别成功

    if (isRecognized) {
      // 识别成功，尝试解锁柜子
      bool isUnlocked = await unlockLocker('用户的手机号');
      if (isUnlocked) {
        // 柜子解锁成功，提示用户取餐
        Fluttertoast.showToast(
          msg: "柜门已开，请取餐",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        // 处理解锁失败的情况
        Fluttertoast.showToast(
          msg: "解锁失败，请重试",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "人脸识别失败，请联系客服",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<bool> unlockLocker(String phoneNumber) async {
    return true; // 假设解锁成功
  }
}
