
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example2_provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final providerTwo=Provider.of<ExampleTwoProvider>(context,listen: false);
    print('hjhjh');
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
             Consumer<ExampleTwoProvider>(builder: (context,integer,child){
               return  Slider(
                   max: 1.0,
                   min: 0.0,
                   value:integer.range, onChanged: (values){
                 integer.setSlider(values);
               });
             }),
            Consumer<ExampleTwoProvider>(builder: (context,integer,child){
              return Row(
                children: [
                  Expanded(child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(integer.range),
                    ),
                    child: const Center(
                      child: Text('Container'),
                    ),
                  )),
                  Expanded(child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(integer.range),
                    ),
                    child: const Center(
                      child: Text('Container'),
                    ),
                  )),
                ],
              );
            }),
          ],
        ),
      ),
    ));
  }
}
