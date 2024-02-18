import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/utils/ui_constants.dart';
import 'package:myapp/utils/ui_helpers.dart';
import 'package:myapp/widgets/custom_form.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key, required this.user});

  final User user;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  int? _selectedIndex = 0;
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.user.toString()),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(labelUseExistingData),
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
                    setState(() {
                      _selectedIndex = index;
                      _isEnabled = _selectedIndex == 1;
                    });
                  }
                )
              ],
            ),
            UIHelper.verticalSpaceMedium,
            CustomForm(user: widget.user, isEnabled: _isEnabled)
          ],
        )
      )
    );
  }
}
