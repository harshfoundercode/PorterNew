import 'dart:async';
import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/auth/login_page.dart';
import 'package:porter/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  final String mobileNumber;
  final String userId;

  const OtpPage({
    super.key,
    required this.mobileNumber,
    required this.userId,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _timer;
  int _remainingTime = 60;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthViewModel>(context, listen: false)
          .sendOtpApi(widget.mobileNumber, context);
    });

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOtp() {
    final enteredOtp = _otpController.text.trim();
    if (enteredOtp.length == 4 && int.tryParse(enteredOtp) != null) {
      final loginViewModel = Provider.of<AuthViewModel>(context, listen: false);
      loginViewModel.verifyOtpApi(widget.mobileNumber,enteredOtp,widget.userId ,context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 6-digit OTP."),
          backgroundColor: PortColor.blue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.07, vertical: screenHeight * 0.04),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PORTER',
                      style: TextStyle(
                        color: PortColor.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.location_on,
                      color: PortColor.blue,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: const AssetImage(Assets.assetsIndiaflagsquare),
                        height: screenHeight * 0.023),
                    SizedBox(width: screenWidth * 0.02),
                    titleSmall(
                        text: widget.mobileNumber, color: PortColor.black),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: elementsSmall(
                            text: "CHANGE", color: PortColor.blue)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                elementsSmall(
                    text:
                        "One Time Password (OTP) has been sent to this number",
                    color: PortColor.gray),
                SizedBox(height: screenHeight * 0.05),
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintText: "Enter OTP Manually",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: PortColor.gray, width: screenWidth * 0.001),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: PortColor.gray, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                InkWell(
                  onTap: _verifyOtp,
                  child: Container(
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: PortColor.gray.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child:
                        headingMedium(text: "Verify", color: PortColor.black),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _remainingTime > 0
                    ? Text(
                        "Resend OTP in $_remainingTime seconds",
                        style: const TextStyle(color: PortColor.gray),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _remainingTime = 60;
                            _startTimer();
                          });
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                              color: PortColor.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                otherOptionButton(
                    "Get OTP via WhatsApp", Assets.assetsWhatsapp),
                otherOptionButton("Resend OTP via SMS", Assets.assetsSms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otherOptionButton(String label, String img) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: PortColor.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage(img),
            height: screenHeight * 0.023,
          ),
          SizedBox(width: screenWidth * 0.02),
          headingMedium(text: label, color: PortColor.gray),
        ],
      ),
    );
  }
}
