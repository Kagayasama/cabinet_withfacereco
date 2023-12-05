import 'package:cabinet_withfacereco/pages/personal_center.dart';
import 'package:flutter/material.dart';
import 'package:cabinet_withfacereco/pages/main_page.dart';


class SettingsPage extends StatefulWidget {
  final Function(String) onModeChanged;

  SettingsPage({Key? key, required this.onModeChanged}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 0;
  bool notificationsEnabled = false;
  bool darkModeEnabled = false;
  String currentMode = '用户模式';

  // 底部导航栏的点击事件处理
  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        break;
      case 2:
      // 导航至 PersonalCenterPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalCenterPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
      extendBody: true,
    );
  }

  // 页面主体内容
  Widget _buildBody() {
    return Container(
      decoration: _buildGradientDecoration(),
      child: ListView(
        children: <Widget>[
          _buildSwitchListTile(
            '消息通知',
            notificationsEnabled,
                (value) => setState(() { notificationsEnabled = value; }),
          ),
          _buildSwitchListTile(
            '夜间模式',
            darkModeEnabled,
                (value) => setState(() { darkModeEnabled = value; }),
          ),
          _buildListTile('辅助功能', Icons.person),
          _buildListTile('隐私', Icons.security),
          _buildListTile(
            '模式切换 ($currentMode)',
            Icons.swap_horiz,
            _showModeSelection,
          ),
          _buildListTile('关于', Icons.info),
        ],
      ),
    );
  }

  // 渐变背景装饰
  BoxDecoration _buildGradientDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blue, Colors.white],
      ),
    );
  }

  // 显示模式选择菜单
  void _showModeSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('用户模式'),
                onTap: () => _updateCurrentMode('用户模式'),
              ),
              ListTile(
                title: Text('骑手模式'),
                onTap: () => _updateCurrentMode('骑手模式'),
              ),
            ],
          ),
        );
      },
    );
  }

  // 更新当前模式并关闭底部菜单
  void _updateCurrentMode(String mode) {
    Navigator.pop(context, mode); // Pass the mode back when popping the page
    setState(() {
      currentMode = mode;
    });
    widget.onModeChanged?.call(mode);
  }


  // 构建带开关的列表项
  Widget _buildSwitchListTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  // 构建列表项
  Widget _buildListTile(String title, IconData icon, [VoidCallback? onTap]) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  // 构建悬浮动作按钮
  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _onItemTapped(1), // 假设中间按钮返回主页
      child: Icon(Icons.home, color: Colors.yellow),
      backgroundColor: Colors.orange,
    );
  }

  // 构建底部导航栏
  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavBarIcon(Icons.settings, 0),
          _buildNavBarIcon(Icons.person, 2),
        ],
      ),
    );
  }

  // 构建底部导航栏图标
  Widget _buildNavBarIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon, color: _selectedIndex == index ? Colors.orange : Colors.grey),
      onPressed: () => _onItemTapped(index),
    );

  }




}
