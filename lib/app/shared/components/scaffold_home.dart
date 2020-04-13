import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> actionsAppBar;
  final String titleAppBar;
  final Color colorTitleAppBar;
  final Widget body;

  const CustomScaffold({
    Key key,
    this.actionsAppBar,
    this.backgroundColor = Colors.transparent,
    this.titleAppBar = "",
    this.colorTitleAppBar = Colors.black,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 39,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: actionsAppBar
              .map((widget) => Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: widget,
                  ))
              .toList(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                titleAppBar,
                style: TextStyle(
                  color: colorTitleAppBar,
                  fontFamily: "Google",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: body == null ? Container() : body,
            ),
          ],
        ),
      ),
    );
  }
}
