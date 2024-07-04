import 'package:flutter/material.dart';
import 'package:payday/pages/Verify_KYC_Page.dart';
import 'package:payday/constants.dart';
import 'package:payday/pages/verify_account_page.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.04;
    final double verticalPadding = screenSize.height * 0.02;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        title: Text('Wallet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$1.8',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.08,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: screenSize.width * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top-up Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.035,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.005),
                          Text(
                            '\$1.8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: screenSize.height * 0.05,
                        width: 1.0,
                        color: Colors.white30,
                        margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.03,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Winnings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.035,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.005),
                          Text(
                            '\$0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  ActionButton(
                    height1: screenSize.height * 0.05,
                    width1: screenSize.width * 0.3,
                    text: 'Add Cash',
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            TileWidget(
              title: 'My Transactions',
              onTap: () {
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            TileWidget(
              title: 'Withdraw',
              subtitle: 'Verify to Withdraw',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyKYCPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
