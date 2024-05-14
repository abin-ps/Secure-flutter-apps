import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({super.key, required this.route, required this.label});
  final String route;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      title: Text(label),
    );
  }
}
