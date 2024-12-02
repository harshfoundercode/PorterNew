import 'dart:async';
import 'package:flutter/material.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/view/account/account.dart';
import 'package:porter/view/coins/coins.dart';
import 'package:porter/view/home/home.dart';
import 'package:porter/view/order/order.dart';
import 'package:porter/view/payment/payment.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const OrderPage(),
    const CoinsPage(),
    const PaymentsPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      coin = false;
    });
    if (_selectedIndex == 2) {
      closeCoin();
    }
  }

  void closeCoin() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        coin = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: PortColor.grey,
            thickness: 1,
            height: 1,
          ),
          Container(
            color: PortColor.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home, 'Home'),
                _buildNavItem(1, Icons.receipt_long, 'Orders'),
                _buildNavItem(2, Icons.account_balance_wallet, 'Coins'),
                _buildNavItem(3, Icons.payment, 'Payments'),
                _buildNavItem(4, Icons.account_circle, 'Account'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? PortColor.blue : Colors.grey,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? PortColor.blue : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
