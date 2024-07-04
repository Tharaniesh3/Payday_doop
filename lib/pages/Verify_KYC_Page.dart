import 'package:flutter/material.dart';
import 'package:payday/constants.dart';
import 'package:payday/pages/verify_account_page.dart';

class VerifyKYCPage extends StatefulWidget {
  @override
  _VerifyKYCPageState createState() => _VerifyKYCPageState();
}

class _VerifyKYCPageState extends State<VerifyKYCPage> {
  DateTime? _selectedDate;

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
        title: Text('Verify KYC'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepIndicator(1, true, screenSize),
                  _buildLineIndicator(screenSize),
                  _buildStepIndicator(2, false, screenSize),
                  _buildLineIndicator(screenSize),
                  _buildStepIndicator(3, false, screenSize),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Personal details',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenSize.height * 0.005),
            Text(
              'Kindly make sure you provide accurate details to avoid confusion',
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenSize.width * 0.03,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildFormField('First', screenSize)),
                      SizedBox(width: screenSize.width * 0.02),
                      Expanded(child: _buildFormField('Last', screenSize)),
                    ],
                  ),
                  _buildDateOfBirthFormField(context, screenSize),
                  _buildFormField('Social Security Number (Last 4 Digits)', screenSize, obscureText: true),
                  _buildFormField('United States of America', screenSize),
                  _buildFormField('Address 1', screenSize),
                  _buildFormField('Address 2', screenSize),
                  Row(
                    children: [
                      Expanded(child: _buildFormField('City', screenSize)),
                      SizedBox(width: screenSize.width * 0.02),
                      Expanded(child: _buildFormField('State', screenSize)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Center(
              child: ActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerifyAccountPage()),
                  );
                },
                text: "Next",
                width1: screenSize.width * 0.8,
                height1: screenSize.height * 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isActive, Size screenSize) {
    return Container(
      width: screenSize.width * 0.06,
      height: screenSize.width * 0.06,
      decoration: BoxDecoration(
        color: isActive ? kGreenColor : kWhiteColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          step.toString(),
          style: TextStyle(
            color: isActive ? kWhiteColor : kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenSize.width * 0.035,
          ),
        ),
      ),
    );
  }

  Widget _buildLineIndicator(Size screenSize) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.02),
      child: Container(
        width: screenSize.width * 0.1,
        height: screenSize.height * 0.002,
        color: kWhiteColor,
      ),
    );
  }

  Widget _buildFormField(String label, Size screenSize, {bool obscureText = false}) {
    if (label == 'United States of America') {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
        child: TextFormField(
          enabled: false,
          initialValue: 'United States of America',
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0x000000000),
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
        child: TextField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0x000000000),
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildDateOfBirthFormField(BuildContext context, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0x000000000),
            labelText: 'Date of Birth',
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenSize.width * 0.015),
              borderSide: BorderSide(color: Color(0xFF3A3A3A)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Select Date',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
