import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ordered_page.dart';
import 'package:cabinet_withfacereco/pages/login_page.dart';



// 主页面：个人中心
class PersonalCenterPage extends StatelessWidget {

  // 底部导航栏处理函数
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/page1');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/main');
        break;
      case 2:

        break;
    }
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人中心')),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white], // 从蓝色到白色的渐变
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileAvatar(context),
            Text('flutter_demo', style: TextStyle(fontSize: 20)),
            Expanded(
              flex: 2, // 调整flex比例以给“更多美食”部分留出空间
              child: _buildOrderDetailsSection(context), // 订单详情部分
            ),
            _buildFooterImage(context), // 确保“更多美食”一栏显示
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: _buildBottomAppBar(context),
      extendBody: true,
    );
  }


  // 用户头像构建
  Widget _buildProfileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalInfoPage()),
        );
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('graphics/profile_avatar.jpg'),
      ),
    );
  }

  // 水平滚动网格视图构建
  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return index == 9 ? _buildAddIcon(context) : _buildOrderImage(context);
      },
    );
  }

  // 添加图标构建
  Widget _buildAddIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/orderHistory');
      },
      child: Container(
        alignment: Alignment.center,
        child: Icon(Icons.add, size: 20),
      ),
    );
  }

  // 订单图片构建
  Widget _buildOrderImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 逻辑跳转到订单详情
      },

    );
  }

  // 底部图片构建
  Widget _buildFooterImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 这里可以添加点击逻辑
      },
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('graphics/img.png'),
          ),
        ),
        alignment: Alignment.center,
        child: Text('更多美食',

          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            backgroundColor: Colors.black45,
          ),
        ),
      ),
    );
  }

  // 悬浮动作按钮构建
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _onItemTapped(context, 1);
      },
      child: Icon(Icons.home, color: Colors.yellow),
      backgroundColor: Colors.orange,
    );
  }

  // 底部导航栏构建
  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onItemTapped(context, 0),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => _onItemTapped(context, 2),
          ),
        ],
      ),
      color: Colors.blue,
    );

  }
}

// 个人信息页面
class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // ...
  // 控制器、初始化、加载、保存用户信息方法
  // ...


  TextEditingController nicknameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override


  void initState() {
    super.initState();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    nicknameController.text = prefs.getString('nickname') ?? '';
    addressController.text = prefs.getString('address') ?? '';
  }

  Future<void> saveUserInfo() async {
    String nickname = nicknameController.text;
    String address = addressController.text;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nickname', nickname);
    await prefs.setString('address', address);

    Fluttertoast.showToast(
        msg: "信息已保存",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<void> logout(BuildContext context) async {
    // 退出登录时我们不清除SharedPreferences里的数据
    Navigator.pushReplacementNamed(context, '/login_page');
  }


  // 构建界面布局
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人信息')),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white], // 从蓝色到白色的渐变
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: nicknameController,
                decoration: InputDecoration(labelText: '昵称'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: '收货地址'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveUserInfo,
                child: Text('保存'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  logout(context);
                },
                child: Text('退出登录'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

// 订单详情部分的构建
Widget _buildOrderDetailsSection(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 30, left: 10, right: 0), // 减小容器外边距
    padding: EdgeInsets.all(10), // 减小内边距
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('订单详情', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Expanded(child: _buildGridView(context)), // 包含滑动图片的GridView
      ],
    ),
  );
}

// 订单详情的网格视图构建

Widget _buildGridView(BuildContext context) {
  return GridView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 10,  // 总项目数，包括加号图标
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      mainAxisSpacing: 5,
      childAspectRatio: 1, // 增大宽高比，减小图片高度
    ),
    itemBuilder: (context, index) {
      // 如果是最后一个项目，则显示加号图标
      if (index == 9) {
        return _buildAddIcon(context);
      }
      // 其他项目显示订单图片
      return _buildOrderImage(context, index);
    },
  );
}


// 构建加号图标

Widget _buildAddIcon(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderHistoryPage()),  // 跳转到OrderHistoryPage界面
      );
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200], // 加号背景色
        borderRadius: BorderRadius.circular(8), // 圆角边框
      ),
      child: Icon(Icons.add, size: 50, color: Colors.blue),
    ),
  );
}


// 构建订单图片的方法
Widget _buildOrderImage(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      // 逻辑跳转到订单详情
    },
    child: Container(
      padding: EdgeInsets.all(4),
      child: Image.asset('graphics/kfc.png', fit: BoxFit.cover),
    ),
  );
}



