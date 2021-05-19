import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Himanshu Ranjan",
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 60,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold)),
                Text("SDE Intern @Practo | Backend and Android Engineer",
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal))
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            AvatarGlow(
              glowColor: Colors.blue,
              endRadius: 220.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: AssetImage(
                    'assets/profile.png',
                  ),
                  radius: 180.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
