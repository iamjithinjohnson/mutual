import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.grey[600],
          ),
          alignment: Alignment.topLeft,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
