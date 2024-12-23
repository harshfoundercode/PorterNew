import 'package:flutter/material.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/order/order.dart';

class OrderSuccessfully extends StatefulWidget {
  const OrderSuccessfully({super.key});

  @override
  State<OrderSuccessfully> createState() => _OrderSuccessfullyState();
}

class _OrderSuccessfullyState extends State<OrderSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PortColor.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/order_successfully.gif",
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              headingMedium(
                text: "Your order has been Successfully Placed!! 🎉",
                color: PortColor.black,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  titleMedium(text: "Go to ", color: PortColor.black),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const OrderPage()));
                    },
                    child: titleMedium(text: "My Order ", color: PortColor.blue),
                  ),
                  titleMedium(text: "Section", color: PortColor.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
