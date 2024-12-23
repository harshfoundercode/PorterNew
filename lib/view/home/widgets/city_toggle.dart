import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';

class CityToggle extends StatefulWidget {
  @override
  _CityToggleState createState() => _CityToggleState();
}

class _CityToggleState extends State<CityToggle> {
  bool isWithinCitySelected = true;

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isWithinCitySelected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight*0.01),
                decoration: BoxDecoration(
                  color: isWithinCitySelected ? PortColor.button : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Within city",
                    style: TextStyle(
                      color: isWithinCitySelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Between Cities Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isWithinCitySelected = false;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isWithinCitySelected ? PortColor.button : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Between cities",
                    style: TextStyle(
                      color: !isWithinCitySelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
    )  ] );


  }
}
