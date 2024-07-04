import 'package:flutter/material.dart';
import 'package:payday/constants.dart';

class VerifyAccountPage extends StatefulWidget {
  
  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  
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
            Navigator.pop(context);
          },
        ),
        title: Text('Verify your Account'),
        centerTitle: true,
      ),
      body: Padding(
 padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get verified to withdraw winnings to your bank!',
              style: TextStyle(color: kGreyColor),
            ),
            SizedBox(height: screenSize.height * 0.02),
            TileWidgetWithIcon(
              title: 'Bank Account',
              subtitle: 'Verify your bank account for quick withdrawals',
              icon: Icons.account_balance,
              status: 'Rejected', 
              onTap: () {
              },
            ),
            SizedBox(height: screenSize.height * 0.016),
            TileWidgetWithIcon(
              title: 'Verify Email',
              subtitle: 'Verify your bank account for quick withdrawals',
              icon: Icons.email,
              status: 'Not Verified',
              onTap: () {
              },
            ),
            SizedBox(height: screenSize.height * 0.016),
            TileWidgetWithIcon(
              title: 'KYC',
              subtitle: 'Verify your identity',
              icon: Icons.verified_user,
              status: 'Verified', 
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}