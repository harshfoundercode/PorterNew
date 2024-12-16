import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: ListView(
          children: [
            SizedBox(height: screenHeight * 0.02),
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
            SizedBox(height: screenHeight * 0.12),
            const Image(image: AssetImage(Assets.assetsMainimage)),
          ],
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06, vertical: screenHeight * 0.037),
          decoration: const BoxDecoration(
            color: PortColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  headingSmall(
                    text: "Welcome",
                    color: PortColor.black.withOpacity(0.6),
                  ),
                  SizedBox(width: screenWidth * 0.018),
                  Image(
                    image: const AssetImage(Assets.assetsHello),
                    height: screenHeight * 0.03,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.016),
              titleMedium(
                text:
                    "With a valid number, you can access deliveries, and\nour other services",
                color: PortColor.gray,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: screenWidth * 0.002),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.assetsIndiaflag,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 4),
                        titleSmall(text: "+91", color: PortColor.gray),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      controller: _controller,
                      height: screenHeight * 0.05,
                      hintText: "Mobile Number",
                      fillColor: PortColor.grey,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      cursorHeight: screenHeight * 0.025,
                      focusNode: _focusNode,
                    ),
                  ),
                ],
              ),
              if (_isFocused) loginButton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget loginButton() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.03),
        GestureDetector(
          onTap: () {
            if (_controller.text.length == 10 &&
                RegExp(r'^\d{10}$').hasMatch(_controller.text)) {
              final loginViewModel = Provider.of<AuthViewModel>(context, listen: false);
              loginViewModel.loginApi(_controller.text,context);
            } else {
            Utils.showErrorMessage(context, "please enter a valid 10 digit number");
            }
          },
          child: Container(
            height: screenHeight * 0.06,
            decoration: BoxDecoration(
              color: PortColor.buttonBlue,
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child:  headingMedium(text: "Login", color: PortColor.white),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "By clicking on login you agree to the ",
            style: TextStyle(color: PortColor.gray, fontSize: 12),
            children: [
              TextSpan(
                text: "terms of service",
                style: TextStyle(
                  color: PortColor.buttonBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: " and ",
                style: TextStyle(color: PortColor.gray, fontSize: 12),
              ),
              TextSpan(
                text: "privacy policy",
                style: TextStyle(
                  color: PortColor.buttonBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


