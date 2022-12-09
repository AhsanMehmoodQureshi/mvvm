

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apps/provider/item_provider.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    print('fdgfdg');
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('ItemLists'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
           itemCount: 50,
            itemBuilder: (BuildContext context,index){
          return Consumer<ItemProvider>(builder: (context,value,chile){
            return ListTile(
              onTap:() {
                if(value.selectedItem.contains(index)){
                  value.removeItem(index);
                }
                else{
                  value.addItem(index);
                }
              },
              title: Text('Items ${index.toString()}' ),
              trailing: value.selectedItem.contains(index)?const Icon(Icons.check_circle,color: Colors.green,):const Icon(Icons.circle_outlined),
            );
          });
        }),
      ),
    ),
    );
  }
}
