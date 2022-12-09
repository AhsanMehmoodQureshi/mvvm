import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apps/provider/counter_provider.dart';

class MyHomePages extends StatefulWidget {
  const MyHomePages({Key? key}) : super(key: key);

  @override
  State<MyHomePages> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
   // _controller = AnimationController(vsync: this);const
   //  Timer.periodic(Duration(seconds: 0), (timer) {
   //    final countProvider=Provider.of<CountProvider>(context,listen: false);
   //    countProvider.setCount();
   //  });

  }

  @override
  Widget build(BuildContext context) {
    final countProvider=Provider.of<CountProvider>(context,listen: false);
 //   print('gffffffffffffffffffff${countProvider.count}');
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CountProvider>(builder: (context,value,child){
              print('valuefghfgfgf${value.count}');

              return Text(
                value.count.toString(),
                style: Theme.of(context).textTheme.headline2,
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    ));
  }
}
