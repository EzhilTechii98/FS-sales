import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor, // text color
          elevation: 0, // no shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Button Demo'),
//       ),
//       body: Center(
//         child: CustomButton(
//           text: 'Click Me',
//           onPressed: () {
//             // Add your button logic here
//             print('Button clicked');
//           },
//           buttonColor: Colors.green, // Customize button color
//           textColor: Colors.white, // Customize text color
//           fontSize: 18.0, // Customize font size
//         ),
//       ),
//     ),
//   ));
// }
