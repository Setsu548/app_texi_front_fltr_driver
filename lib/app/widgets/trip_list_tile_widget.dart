import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';

class TripListTile extends StatelessWidget {
  const TripListTile({
    super.key,
    required this.dateLabel,          
    required this.origin,            
    required this.destination,        
    required this.priceText,          
    this.onTap,
  });

  final String dateLabel;
  final String origin;
  final String destination;
  final String priceText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  dateLabel,
                  color: lightColorScheme.primary, 
                ),
                Row(
                  children: [
                    Flexible(
                      child: LabelText(
                        origin,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_alt, color: lightColorScheme.onSurface, size: 18),
                    SizedBox(width: 5),
                    Flexible(
                      child: LabelText(
                        destination,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BodyText(
            priceText,
            color: lightColorScheme.primary,
          ),
        ],
      ),
    );
  }
}
