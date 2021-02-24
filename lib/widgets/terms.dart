import 'package:flutter/material.dart';
import 'package:mutual_events/material/color.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'By signing in,you confirm that you agree to your ',
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 11,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: '\tTerms of Use\t',
              style: TextStyle(color: texttheme, fontSize: 13)),
          TextSpan(
              text: 'and have read and understood our',
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 11,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: '\tPrivacy Policy',
              style: TextStyle(color: texttheme, fontSize: 13))
        ]),
      ),
    );
  }
}
