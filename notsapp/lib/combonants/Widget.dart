import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/background-vertical.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill);
  }
}

Text h6(String text, {TextAlign align = TextAlign.start}) => Text(
      text,
      style: TextStyle(fontSize: 16),
      textAlign: align,
    );


