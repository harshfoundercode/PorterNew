import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view_model/wallet_history_view_model.dart';
import 'package:provider/provider.dart';

class PaymentPorterCredit extends StatefulWidget {
  const PaymentPorterCredit({super.key});

  @override
  State<PaymentPorterCredit> createState() => _PaymentPorterCreditState();
}

class _PaymentPorterCreditState extends State<PaymentPorterCredit> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final walletHistoryViewModel =
      Provider.of<WalletHistoryViewModel>(context, listen: false);
      walletHistoryViewModel.walletHistoryApi();
    });
  }



  final List transactions = [
    {
      "date": "Dec 23, 2024",
      "amount": "1.0",
    },
    {
      "date": "Dec 23, 2024",
      "amount": "1.0",
    },
    {
      "date": "Dec 23, 2024",
      "amount": "1.0",
    },
  ];

  final TextEditingController _controller = TextEditingController();
  bool isBottomSheetVisible = false;
  bool isProceedEnabled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateProceedButton() {
    setState(() {
      isProceedEnabled =
          _controller.text.isNotEmpty && int.tryParse(_controller.text) != null;
    });
  }

  void _addAmount(int amount) {
    int currentAmount = int.tryParse(_controller.text) ?? 0;
    int newAmount = currentAmount + amount;
    _controller.text = newAmount.toString();
    _updateProceedButton();
  }

  Widget _quickAddButton(String label, int amount) {
    return GestureDetector(
      onTap: () => _addAmount(amount),
      child: Container(
        height: 40, // fixed height for button
        width: 140, // fixed width for button
        decoration: BoxDecoration(
          color: PortColor.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: elementsSmall(
            text: label,
            color: PortColor.blue,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletHistoryViewModel = Provider.of<WalletHistoryViewModel>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PortColor.grey,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: screenHeight * 0.07,
            width: screenWidth,
            decoration: BoxDecoration(
              color: PortColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.04),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: PortColor.black,
                    size: screenHeight * 0.025,
                  ),
                ),
                SizedBox(width: screenWidth * 0.28),
                headingMedium(text: "Courier Credits", color: PortColor.black),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.07,
            width: screenWidth,
            decoration: BoxDecoration(
              color: PortColor.blue.withOpacity(0.1),
              border: const Border(bottom: BorderSide(color: PortColor.white)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                children: [
                  titleMedium(text: "Balance ₹0", color: PortColor.black),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isBottomSheetVisible = true;
                      });
                    },
                    child: headingMedium(
                      text: "Add Money",
                      color: PortColor.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Expanded(
            child:
            // walletHistoryViewModel.loading
            //     ?const Center(child: CircularProgressIndicator(color: Colors.blueAccent,))
            //     :walletHistoryViewModel.walletHistoryModel?.data
            //     ?.isNotEmpty == true
            //     ?
            Container(
              width: screenWidth,
              color: PortColor.white,
              child: ListView.builder(
                itemCount: walletHistoryViewModel.walletHistoryModel!.data!.length,
                itemBuilder: (context, index) {
                  final transaction = walletHistoryViewModel.walletHistoryModel!.data![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                            vertical: screenHeight * 0.01),
                        child: elementsMedium(
                            text: transaction.datetime.toString(), color: PortColor.gray),
                      ),
                      Divider(
                        thickness: screenWidth * 0.002,
                        color: PortColor.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.035,
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(Assets.assetsRuppee),
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.13,
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            titleMedium(
                                text: "Wallet Recharge", color: PortColor.black),
                            const Spacer(),
                            titleSmall(
                                text: " ₹${transaction.amount.toString()}", color: Colors.green),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
            //       : Center(
            //   child: Image.asset("assets/no_history.gif"),
            // )
          ),
        ],
      ),
      bottomSheet: isBottomSheetVisible
          ? Container(
        height: screenHeight * 0.26,
        width: screenWidth,
        decoration: BoxDecoration(
          color: PortColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: PortColor.gray.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.015),
              headingMedium(text: "Add Money", color: PortColor.black),
              SizedBox(height: screenHeight * 0.012),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: PortColor.gray,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => _updateProceedButton(),
                      decoration: InputDecoration(
                        hintText: 'Enter Amount',
                        hintStyle: const TextStyle(color: PortColor.gray),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: PortColor.gray),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: PortColor.gray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: PortColor.gray, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  _quickAddButton("+500", 500),
                  SizedBox(width: screenWidth * 0.04),
                  _quickAddButton("+1000", 1000),
                  SizedBox(width: screenWidth * 0.04),
                  _quickAddButton("+2000", 2000),
                ],
              ),
              SizedBox(height: screenHeight * 0.055),
              GestureDetector(
                onTap: isProceedEnabled ? () {} : null,
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.88,
                  decoration: BoxDecoration(
                    color: isProceedEnabled
                        ? PortColor.blue
                        : PortColor.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: headingMedium(
                      text: "Proceed",
                      color: isProceedEnabled
                          ? PortColor.white
                          : PortColor.gray,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }
}
