import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:myapp/custom_form.dart';
import 'package:myapp/utils/ui_helpers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _label_use_existing_data = "Usar Datos del Registro";
  int? _selectedIndex = 0;
  bool fillUserData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(12),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_label_use_existing_data),
                    ToggleSwitch(
                      initialLabelIndex: _selectedIndex,
                      iconSize: 1,
                      fontSize: 14,
                      minHeight: 30,
                      minWidth: 40,
                      labels: ['No', 'Sí'],
                      inactiveBgColor: Colors.white,
                      activeBgColor: [Colors.green],
                      onToggle: (index) {
                        setState(() => _selectedIndex = index);
                      }                      
                    )                    
                  ],
                ),
                UIHelper.verticalSpaceMedium,
                const CustomForm()
              ],
            )
          ],
        ),
      )
    );
  }
}
