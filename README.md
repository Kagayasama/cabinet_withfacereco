# cabinet_withfacereco

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



***************************************************************************************************
# 外卖柜APP

## 登录页面（页面1）

）


### 主页面（页面2）


按钮：存餐
按钮：个人中心
显示：当前账号绑定的柜台号/未绑定

- 个人中心页面(页面4)

  个人消息（显示）
  订单记录（按钮）

    - 订单记录（页面7）

- 存餐页面(页面5)

  输入要打开的柜号（输入框）
  输入验证码（输入框）
  点击绑定（按钮）
  显示：绑定成功/验证失败


## 使用流程

### 顾客下单

- 1 顾客下单之后，可选择是否使用外卖柜。

- 2 若选择使用，则系统自动为当前订单分配一个柜子，并把柜号发送给骑手和顾客，并给骑手发送验证码

### 骑手存餐

- 1 骑手在APP里面点击“存餐”，并输入柜号和验证码

- 2 验证成功，则柜门弹开。 -------------------硬件端提供接口

- 3 存餐完毕关上柜门，柜子进入“使用”状态。同时APP向顾客发送提示消息-------------------硬件端提供接口

### 顾客取餐

- 1 到柜体的摄像头处进行人脸识别。-------------------硬件端提供接口

- 2 根据识别结果匹配用户手机号，并打开所绑定的柜子

- 3 取餐完毕关上柜门，柜子进入“空闲”状态
- *************************************************************************************************

# cabinet-with-facerecognize-base-on-IoT
