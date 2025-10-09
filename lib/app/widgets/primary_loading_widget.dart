import 'package:flutter/material.dart';

class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("assets/images/texiFondo.png"),
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/texi.png'),
                width: 160,
              ),
              SizedBox(height: 24),
              CircularProgressIndicator(),
            ],
          )
        ],
      ),
    );
  }
}

