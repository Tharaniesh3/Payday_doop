import 'package:flutter/material.dart';


// color constants
const Color kBlackColor = Colors.black;
const Color kRedColor = Colors.red;
const Color kGreyColor = Colors.grey;
const Color kGreenColor = Colors.green;
const Color kWhiteColor = Colors.white;
const Color kInputBackgroundColor = Color(0xFF2E2E2E);

// ActionButton Component
class ActionButton extends StatelessWidget {
  final String text;
  final double width1; 
  final double height1; 
  final VoidCallback onPressed;

  ActionButton({
    required this.text,
    required this.onPressed,
    required this.width1,
    required this.height1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width1,
        height: height1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kRedColor, 
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
class TileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  
  TileWidget({
    required this.title,
    this.subtitle,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E), 
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0,bottom: 5),
          
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
        subtitle: subtitle != null
            ? Padding(
          padding: const EdgeInsets.only(left: 20.0),
              child: Text(subtitle!, style: TextStyle(color: kRedColor,fontSize: 13)),
            )
            : null,
        trailing: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}


// TileWidgetWithIcon
class TileWidgetWithIcon extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final IconData icon;
  final String status;

  TileWidgetWithIcon({
    required this.title,
    this.subtitle,
    required this.onTap,
    required this.icon,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;

    if (status == 'Rejected') {
      statusColor = kRedColor;
      statusIcon = Icons.close;
    } else if (status == 'Verified') {
      statusColor = kGreenColor;
      statusIcon = Icons.check;
    } else {
      statusColor = kGreyColor;
      statusIcon = Icons.info;
    }

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: kWhiteColor,size: 30),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: kWhiteColor)),
                if (subtitle != null)
                  Text(subtitle!, style: TextStyle(color: kGreyColor, fontSize: 12)),
                SizedBox(height: 10.0),
                IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(statusIcon, size: 16, color: kWhiteColor),
                        SizedBox(width: 4.0),
                        Text(
                          status,
                          style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward_ios, color: kWhiteColor,size: 20),
          ),
        ],
      ),
    );
  }
}