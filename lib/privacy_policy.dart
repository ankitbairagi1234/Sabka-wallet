import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Theme/colors.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        child: ListView(
          children: [
            Stack(
              children: [
                // Image.asset(
                //   'assets/imgs/Layer 1672-1.png',
                //   width: MediaQuery.of(context).size.width,
                //   colorBlendMode: BlendMode.darken,
                //   color: Colors.black.withOpacity(0.25),
                // ),
                AppBar(
                  centerTitle: true,
                  backgroundColor: primary,
                  title: Text("Privacy Policy"),
                ),
                PositionedDirectional(
                    top: 120,
                    start: 100,
                    end: 100,
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 4,
                    )),
              ],
            ),
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            //   child: Text(
            //     locale.termsOfUse!,
            //     style: Theme.of(context)
            //         .textTheme
            //         .subtitle1!
            //         .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            //   ),
            // ),
            Padding(
              padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16,top: 30),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
