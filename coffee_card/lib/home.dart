import 'package:coffee_card/home/coffee_prefs.dart';
import 'package:coffee_card/styled_body_text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('my coffee', style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),),
      backgroundColor: Colors.brown[700],
      centerTitle: true,
    ),
    body:Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.brown[200],
          padding: const EdgeInsets.all(20),
          child:const StyledBodyText('How i like my coffee '),
        ),
        Container(
          color: Colors.brown[100],
          padding: const EdgeInsets.all(20),
          child:const CoffeePrefs(),
        ),
        Expanded(
          child: Image.asset('assets/img/car3.jpg', 
          fit: BoxFit.fitHeight, 
          alignment: Alignment.center,),
        ),
      ],
    ),
    );
  }
}

