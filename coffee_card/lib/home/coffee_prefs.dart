import 'package:coffee_card/styled_body_text.dart';
import 'package:coffee_card/styled_button.dart';
import 'package:flutter/material.dart';

class CoffeePrefs extends StatefulWidget {
  const CoffeePrefs({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}

class _CoffeePrefsState extends State<CoffeePrefs> {

int strength = 1;
int sugar =1 ;

  void increaseStrenght() {
    setState(() {
     strength = strength < 5 ? strength + 1 : 1;
      
    });
  }

  void increaseSugars() {
    setState(() {
     sugar = sugar < 5 ? sugar + 1 : 0;
    });
         
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const StyledBodyText('Strength: '),
            for(int i = 0; i < strength; i++ )
              Image.asset(
                'assets/img/car1.jpg',
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),
             
            
            const Expanded(child: SizedBox()),
            StyledButton(
                onPressed: increaseStrenght,
                child: const Text('Add'))
          ],
        ),
        Row(
          children: [
            const StyledBodyText('Sugar: '),
            if (sugar == 0)
              const Text('No sugars...'),

            for(int i = 0; i < sugar; i++ )
              Image.asset(
                'assets/img/car2.jpg',
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(
                onPressed: increaseSugars,
                child: const Text('Add'))
          ],
        ),
      ],
    );
  }
}
