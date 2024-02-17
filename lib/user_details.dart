import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:myapp/custom_form.dart';
import 'package:myapp/utils/ui_helpers.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final String _labelUseExistingData = "Usar Datos del Registro";
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
        margin: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_labelUseExistingData),
                    ToggleSwitch(
                      initialLabelIndex: _selectedIndex,
                      iconSize: 1,
                      fontSize: 14,
                      minHeight: 30,
                      minWidth: 40,
                      labels: const ['No', 'Sí'],
                      inactiveBgColor: Colors.white,
                      activeBgColor: const [Colors.green],
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
