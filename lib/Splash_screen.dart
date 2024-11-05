
import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set up the duration of the splash screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TodoScreen())

      );
    }
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(

                child: Image.network('https://mentalhealthmatch.com/articles/wp-content/uploads/2020/10/to-do-4483048_1920-e1621205663689.jpg',



                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


