import 'package:flutter/material.dart';
import 'package:mainproject/interfaces/interface_menu.dart';
import 'package:mainproject/json_parse/json_parse_menu.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  JsonParseMenu? _dataFromAPI;

  @override
  void initState() {
    super.initState();
    getMenu();
  }

  Future<JsonParseMenu?> getMenu() async {
    //
    String menu =
        '[{"name": "โกโก้นมเหนียว","price": 50,"category": "นมเหนียว"},{"name": "โกโก้นมเหนียว","price": 50,"category": "นมเหนียว"}]';
    _dataFromAPI = jsonParseMenuFromJson(menu);
    return _dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMenu(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          return ListView(
            children: [
              ListTile(
                title: Text(result.name),
              )
            ],
          );
        }
        return const LinearProgressIndicator();
      },
    );
  }
}
