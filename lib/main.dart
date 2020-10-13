import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'menu_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final menuData = [
    MenuModel(id: 1, categoria: 'Pizzas Salgadas', nome: 'Mussarela'),
    MenuModel(id: 5, categoria: 'Pizzas Doces', nome: 'Brigadeiro'),
    MenuModel(id: 2, categoria: 'Pizzas Salgadas', nome: 'Calabreza'),
    MenuModel(id: 6, categoria: 'Pizzas Doces', nome: 'Banana'),
    MenuModel(id: 3, categoria: 'Pizzas Salgadas', nome: 'Quatro Queijos'),
    MenuModel(id: 4, categoria: 'Pizzas Salgadas', nome: 'Napolitada'),
  ];
  var menu = <String, List<String>>{};

  final items = 0.rangeTo(10).toList();

  @override
  void initState() {
    super.initState();
    menu = menuData.groupBy<String, String>(
      (m) => m.categoria,
      valueTransform: (m) => m.nome,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: '#1B2834'.toColor(),
            ),
            FlatButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(child: CircularProgressIndicator());
                  },
                );
                int.parse("3");
                "3".toInt();

                
                await 3.seconds.delay;
                Navigator.pop(context);
                // Future.delayed(Duration(seconds: 3), () => Navigator.pop(context));

              },
              child: Text('BOTAO X'),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(items[index].toString()));
              },
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: menu.keys.length,
              itemBuilder: (context, index) {
                final key = menu.keys.elementAt(index);
                return ExpansionTile(
                  title: Text(key),
                  children: menu[key]
                      .map(
                        (e) => ListTile(
                          title: Text(e),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
