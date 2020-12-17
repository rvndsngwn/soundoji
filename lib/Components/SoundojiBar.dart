import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundoji/Constants/UIColors.dart';
import 'package:soundoji/Pages/AboutPage.dart';
import 'LogoTitle.dart';
import 'package:soundoji/Pages/speech_home.dart';


class SoundojiBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const SoundojiBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    uiColors _colors = new uiColors();

    return SafeArea(
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 8.0, 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height - 20,
              decoration: BoxDecoration(
                  color: _colors.defaultWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xfff6f6f6),
                        blurRadius: 0,
                        offset: Offset(0, 4)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  LogoTitle(colors: _colors),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyApp(),),
                        );
                      },
                      child: Image.asset('assets/images/about.png',width: 45,)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
