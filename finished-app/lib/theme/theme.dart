import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const red1 = Color(0xffFE746A);
const red2 = Color(0xffE42B1E);

const white1 = Colors.white;
const white2 = Color(0xffF2EDE7);
const white3 = Color(0xffD7C6B8);
const white4 = Color(0xffBBA8A6);

const grey = Color(0xffBBA8A6);

const yellow = Color(0xffF2983E);

const blue1 = Color(0xff746B8B);
const blue2 = Color(0xff50417D);
const blue3 = Color(0xff1E1147);

var materialTheme =  ThemeData(
    primaryColor: red2,
    accentColor: blue1,
    scaffoldBackgroundColor: white3,
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(
        color: blue3
    )
);