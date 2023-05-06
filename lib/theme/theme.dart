import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: kBlueColor,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: kBlueColor,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            iconTheme: const IconThemeData(size: 15, color: kBlackColor),
            titleTextStyle: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w500, color: kBlackColor)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            // selectedLabelStyle: GoogleFonts.poppins(),
            // unselectedLabelStyle: GoogleFonts.poppins(),
            selectedItemColor: kSelectedBottomNavColor,
            unselectedItemColor: kUnselectedBottomNavColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: kWhiteColor,
                backgroundColor: kBlueColor)),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            headline1: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
            headline2:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
            bodyText1:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            button:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      );
}

//colors
const kBlueColor = Color(0xFF2F5DD5);
const kBlackColor = Color(0xFF07061E);
const kWhiteColor = Color(0xFFFFFFFF);
const hintTextColor = Color(0XFF858488);
const kSliderDotColor = Color(0XFFC5C5C5);
const kTextfieldBackgroundColor = Color(0XFFF3F3F3);
const kSelectedBottomNavColor = Color(0xFF05081E);
const kUnselectedBottomNavColor = Color(0xFFd2d2d5);
const kLightBlue = Color(0xFFc6d7f3);
