import 'package:flutter/cupertino.dart';

const kPrimaryColor = Color(0xff62FCD7);
const kNotesBox = 'notes_box';
const logo = 'assets/Notebook-bro.png';
const iconlo = 'images/note.png';
const appName = "Az-Notes";
const kSecondPrimaryColor = Color(0xff100B20);

Text MorningWidget(String text, {TextAlign align = TextAlign.start}) => Text(
      text,
      style: TextStyle(fontFamily: 'VarelaRound', fontSize: 24),
      textAlign: align,
    );

List<Color> kColors = const [
  Color(0xff00ADF6),
  Color(0xffFEFCEA),
  Color(0xffE5D352),
  Color(0xff007C7C),
  Color(0xffD9E76C),
  Color(0xff537D8D),
  Color(0xff482C3D),
  Color(0xffFF6C37),
  Color(0xff329071),
  Color.fromARGB(255, 82, 55, 255),
  Color.fromARGB(255, 65, 230, 205),
  Color.fromARGB(255, 235, 55, 255),
  Color.fromARGB(255, 143, 144, 50),
  Color.fromARGB(255, 50, 67, 144),
];
