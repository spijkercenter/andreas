import 'package:andreas/constants.dart';
import 'package:flutter/cupertino.dart';
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

Widget padScreen(Function(BuildContext) bodyBuilder) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
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
  final tabs = elements
      .map((te) => te.icon)
      .map((i) => Icon(i))
      .map((i) => Tab(icon: i))
      .toList();

  final bodies = elements.map((te) => padScreen(te.bodyBuilder)).toList();

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
    body: padScreen(bodyBuilder),
  );
}
