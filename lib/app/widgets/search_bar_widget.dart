import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String hintText;
  final Iterable<Widget> Function(BuildContext, SearchController) suggestionsBuilder;

  const CustomSearchBar({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.hintText,
    required this.suggestionsBuilder,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return SearchAnchor.bar(
      barHintText: hintText,
      barLeading: Icon(icon, color: iconColor),
      barBackgroundColor: MaterialStateProperty.all(theme.colorScheme.secondary),
      barElevation: MaterialStateProperty.all(0),
      barShape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: theme.colorScheme.secondaryContainer,
            width: 2,
          ),
        ),
      ),
      suggestionsBuilder: suggestionsBuilder,
    );
  }
}