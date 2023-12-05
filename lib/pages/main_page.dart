import 'package:flutter/material.dart';
import 'package:cabinet_withfacereco/pages/personal_center.dart';
import 'package:cabinet_withfacereco/pages/settings_page.dart';
import 'chat_pages.dart';
import 'customer_fetch_page.dart';
import 'delivery_page.dart';



class MainPage extends StatefulWidget {

  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  String currentMode = '用户模式';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        _navigateToSettingsPage();
        break;

      case 1:

        break;
      case 2:

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalCenterPage()),
        );
        break;
    }

  }
  void _navigateToSettingsPage() async {
    final mode = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          onModeChanged: (selectedMode) {
            setState(() {
              currentMode = selectedMode;
            });
          },
        ),
      ),
    );
    if (mode != null) {
      setState(() {
        currentMode = mode;
      });
    }
  }

  PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FaceXpress Demo'),
        actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(currentMode)), 

          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('graphics/profile_avatar.jpg'),
            ),
          ),
          const SizedBox(width: 20), // 添加一些间距
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white], // 从蓝色到白色的渐变
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 确保子组件居中
            children: <Widget>[
              SizedBox(
                width: 100.0,  // 调整宽度
                height: 100.0, // 调整高度
                child: FloatingActionButton(
                  onPressed: () {
                    if (currentMode == '用户模式') {
                      // Navigate to CustomerFetchPage with animation
                      Navigator.of(context).push(
                          _createPageRoute(CustomerFetchPage()));
                    }else if (currentMode == '骑手模式') {
                      // Navigate to DeliveryPage with animation
                      Navigator.of(context).push(_createPageRoute(DeliveryPage()));
                    }
                  },
                  child: const Icon(Icons.coffee, color: Colors.yellow),
                  backgroundColor: Colors.orange,
                ),
              ),


              const SizedBox(height: 45), // 按钮和文字之间的间距
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: const Text(
                  '柜号：1',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1);
        },
        child: const Icon(Icons.home, color: Colors.yellow),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
      extendBody: true,
    );
  }
  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: _selectedIndex == 0 ? Colors.orange : Colors.grey),
            onPressed: () => _onItemTapped(0),
          ),
          IconButton(
            icon: Icon(Icons.person, color: _selectedIndex == 2 ? Colors.orange : Colors.grey),
            onPressed: () => _onItemTapped(2),
          ),
        ],
      ),
    );
  }
}
