import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({super.key, required this.route, required this.label});
  final String route;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        title: Text(label),
      ),
    );
  }
}
