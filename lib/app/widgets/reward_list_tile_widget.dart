import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class RewardListTile extends StatelessWidget {
  const RewardListTile({
    super.key,
    required this.title,       
    required this.dateText,    
    required this.amountText,  
    this.amountColor,          
    this.onTap,
  });

  final String title;
  final String dateText;
  final String amountText;
  final Color? amountColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final green = lightColorScheme.surfaceDim;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                LabelText(
                  dateText,
                ),
              ],
            ),
          ),
          BodyText(
            amountText,
            color: amountColor ?? green,
          ),
        ],
      ),
    );
  }
}
