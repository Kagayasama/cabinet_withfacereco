import 'package:flutter/material.dart';

import 'package:cabinet_withfacereco/pages/main_page.dart';
// 其他需要的import

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController(text: 'fluttertest_account'); // 默认用户名
  final codeController = TextEditingController(text: '1234'); // 默认验证码
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>(); // 密码字段的key

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _passwordKey.currentState?.setValue('1145141919810'); // 默认密码
    });
  }

  Future<void> login() async {
    // 登录逻辑
    // ...

    // 导航到主页
    Navigator.pushReplacement(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('graphics/profile_avatar.jpg'), // 替换为实际的图片路径
              radius: 50,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: '用户名'),
            ),
            TextFormField(
              key: _passwordKey,
              obscureText: true, // 隐藏密码
              decoration: InputDecoration(labelText: '密码'),
            ),
            TextField(
              controller: codeController,
              decoration: InputDecoration(labelText: '验证码'),
            ),
            ElevatedButton(
              onPressed: login,
              child: Text('登录'),
            ),
          ],
        ),
      ),
    );
  }
}

