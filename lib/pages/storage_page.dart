import 'package:flutter/material.dart';

class StoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('存餐')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: '柜号'),
            ),
            TextField(
              decoration: InputDecoration(labelText: '验证码'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: 绑定逻辑
              },
              child: Text('点击绑定'),
            ),
            Text('绑定成功/验证失败'),
          ],
        ),
      ),
    );
  }
}
