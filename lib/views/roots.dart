import 'package:andreas/constants.dart';
import 'package:flutter/material.dart';

final Widget _title = FittedBox(
  fit: BoxFit.fitHeight,
  child: Text(
    appName,
    style: TextStyle(
      color: secondaryColor,
      fontFamily: "Snorelia",
      fontSize: 48,
    ),
  ),
);

Widget _padScreen(Function(BuildContext) bodyBuilder) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: bodyBuilder,
        ),
      ),
    );

class TabElement {
  final IconData icon;
  final Function(BuildContext) bodyBuilder;

  TabElement(this.icon, this.bodyBuilder);
}

DefaultTabController tabView(List<TabElement> elements) {
  final tabs = elements.map((te) => Tab(icon: Icon(te.icon))).toList();

  final bodies = elements.map((te) => _padScreen(te.bodyBuilder)).toList();

  return DefaultTabController(
    length: elements.length,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _title,
        bottom: TabBar(tabs: tabs),
      ),
      body: TabBarView(children: bodies),
    ),
  );
}

Scaffold scaffold(Function(BuildContext) bodyBuilder) {
  return new Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: _title,
    ),
    body: _padScreen(bodyBuilder),
  );
}
