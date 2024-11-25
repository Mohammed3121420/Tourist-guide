import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.cureentFilters, this.saveFailter);

  static const mtk = "/filters";
  final Function saveFailter;
  final Map<String, bool> cureentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  initState() {
    _summer = widget.cureentFilters['summer']!;
    _winter = widget.cureentFilters['winter']!;
    _family = widget.cureentFilters['family']!;

    super.initState();
  }

  Widget bulidSwitchListTile(String title, String subTitle, var currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtering"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFailters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFailter(selectedFailters);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                bulidSwitchListTile(
                    "Summer Trips", "Show summer trips", _summer, (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                bulidSwitchListTile(
                    "Winter Trips", "Show winter trips", _winter, (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                bulidSwitchListTile(
                    "For Families", "Show family trips", _family, (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
