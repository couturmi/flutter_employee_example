import 'package:example_proj/bloc/view_type_bloc.dart';
import 'package:example_proj/widgets/staff_list/staff_screen.dart';
import 'package:flutter/material.dart';

/// Entry point to the application
class LandingScreen extends StatelessWidget {
  static const double VIEW_BUTTON_WIDTH = 150.0;
  static const String MANAGER_BUTTON_KEY_ID = "LandingManagerButton";
  static const String NORMAL_BUTTON_KEY_ID = "LandingNormalButton";

  final Key _managerButtonKey = Key(MANAGER_BUTTON_KEY_ID);
  final Key _normalButtonKey = Key(NORMAL_BUTTON_KEY_ID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Select View Option"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: VIEW_BUTTON_WIDTH,
              child: RaisedButton(
                key: _managerButtonKey,
                child: Text(
                  "Manager View",
                  style: Theme.of(context).accentTextTheme.button,
                ),
                onPressed: () {
                  _navigateToStaffScreen(context, ViewType.manager);
                },
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(
              width: VIEW_BUTTON_WIDTH,
              child: RaisedButton(
                key: _normalButtonKey,
                child: Text(
                  "Normal View",
                  style: Theme.of(context).accentTextTheme.button,
                ),
                onPressed: () {
                  _navigateToStaffScreen(context, ViewType.normal);
                },
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigate to the StaffScreen
  void _navigateToStaffScreen(BuildContext context, ViewType viewType) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StaffScreen(viewType);
    }));
  }
}
