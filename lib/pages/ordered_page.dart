import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('外卖订单记录'),
      ),
      body: OrderList(),
    );
  }
}

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Order> _orders = [];
  int _visibleItemCount = 10; // Number of initially visible items

  @override
  void initState() {
    super.initState();

    // Initialize order data
    _orders = List.generate(20, (index) {
      return Order(
        id: index + 1,
        orderNo: '20231128${index + 1}',
        orderTime: DateTime.now().subtract(Duration(days: index)),
        orderStatus: OrderStatus.delivered,
        orderAmount: (index + 1) * 10,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _visibleItemCount + 1, // Add 1 for the "End of List" message
      itemBuilder: (BuildContext context, int index) {
        if (index == _visibleItemCount) {
          // Display "End of List" message
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                '已经到底了',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }

        final order = _orders[index];

        return ListTile(
          title: Text('订单号: ${order.orderNo}'),
          subtitle: Text('时间: ${order.orderTime.toString()}'),
          // You can customize the status display based on your OrderStatus enum
          // Here, it's just showing "已收货"
          trailing: Text('价格: ${order.orderAmount.toStringAsFixed(2)}元\n状态: 已收货'),
        );
      },
    );
  }
}

class Order {
  final int id;
  final String orderNo;
  final DateTime orderTime;
  final OrderStatus orderStatus;
  final double orderAmount;

  Order({
    required this.id,
    required this.orderNo,
    required this.orderTime,
    required this.orderStatus,
    required this.orderAmount,
  });
}

enum OrderStatus {
  pending,
  shipped,
  delivered,
}


