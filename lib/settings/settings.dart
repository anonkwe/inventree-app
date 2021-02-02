import 'package:InvenTree/settings/about.dart';
import 'package:InvenTree/settings/login.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:InvenTree/api.dart';
import 'login.dart';

import 'package:package_info/package_info.dart';

class InvenTreeSettingsWidget extends StatefulWidget {
  // InvenTree settings view

  @override
  _InvenTreeSettingsState createState() => _InvenTreeSettingsState();

}


class _InvenTreeSettingsState extends State<InvenTreeSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InvenTree Settings"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text("Server Settings"),
                subtitle: Text("Configure server and login settings"),
                leading: FaIcon(FontAwesomeIcons.server),
                onTap: _editServerSettings,
            ),
            Divider(),
            ListTile(
              title: Text(I18N.of(context).about),
              subtitle: Text(I18N.of(context).appDetails),
              leading: FaIcon(FontAwesomeIcons.infoCircle),
              onTap: _about,
            ),
            ListTile(
              title: Text("Report Bug"),
              subtitle: Text("Report bug or suggest new feature"),
              leading: FaIcon(FontAwesomeIcons.bug),
              onTap: null,
            ),
          ],
        )
      )
    );
  }

  void _editServerSettings() async {

    var prefs = await SharedPreferences.getInstance();

    Navigator.push(context, MaterialPageRoute(builder: (context) => InvenTreeLoginSettingsWidget(prefs)));
  }

  void _about() async {

    PackageInfo.fromPlatform().then((PackageInfo info) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InvenTreeAboutWidget(info)));
    });
  }
}