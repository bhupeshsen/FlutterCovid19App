import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TextEditingController> _controllers = new List();
  List<Item> itemList = [
    Item("ID1", "product 1"),
    Item("ID2", "product 2"),
    Item("ID3", "product 3"),
    Item("ID4", "product 4"),
    Item("ID5", "product 5"),
    Item("ID6", "product 6"),
    Item("ID7", "product 7"),
    Item("ID8", "product 8"),
    Item("ID9", "product 9"),
    Item("ID10", "product 10"),
    Item("ID11", "product 11"),
    Item("ID12", "product 12"),
    Item("ID13", "product 13"),
    Item("ID14", "product 14"),
    Item("ID15", "product 15"),
    Item("ID16", "product 16"),
    Item("ID17", "product 17"),
    Item("ID18", "product 18"),



  ];

  Map<String, int> quantities = {};

  void takeNumber(String text, String itemId) {
    try {
      int number = int.parse(text);
      quantities[itemId] = number;
      print(quantities);
    } on FormatException {}
  }

  Widget singleItemList(int index, TextEditingController controllertxt) {
    Item item = itemList[index];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [


          Expanded(flex: 1, child: Text("${index + 1}")),

          Expanded(
            flex: 3,
            child: new TextField(
              controller: controllertxt,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                takeNumber(text, item.id);
              },
              decoration: InputDecoration(
                labelText: "Qty",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              _controllers.add(new TextEditingController());
              if (itemList.isEmpty) {
                return CircularProgressIndicator();
              } else {

                return singleItemList(index,_controllers[index]);
              }
            }),
      ),
    );
  }
}

class Item {
  final String id;
  final String name;

  Item(this.id, this.name);
}