import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../theme/main_theme.dart';

class StarRating extends HookWidget {
  final Function(double)? onRatingChanged;

  const StarRating({super.key, this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    final rating = useState<double>(4);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          highlightColor: Colors.transparent,
          icon: Icon(
            index < rating.value ? Icons.star : Icons.star_border,
            color: index < rating.value ? lightColorScheme.primary : lightColorScheme.secondary,
            size: 40,
          ),
          onPressed: () {
            rating.value = index + 1.0;
            if (onRatingChanged != null) {
              onRatingChanged!(rating.value);
            }
          },
        );
      }),
    );
  }
}
