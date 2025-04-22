import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class FeedbackRatingDisplay extends StatelessWidget {
  final dynamic feedback;
  const FeedbackRatingDisplay({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    if (feedback == true) {
      return Row(
        children: const [
          Icon(Icons.thumb_up, color: Colors.green),
          SizedBox(width: 8),
          Text(
            AuctionStrings.feedbackPositive,
            style: TextStyle(color: Colors.green),
          ),
        ],
      );
    } else if (feedback == false) {
      return Row(
        children: const [
          Icon(Icons.thumb_down, color: Colors.red),
          SizedBox(width: 8),
          Text(
            AuctionStrings.feedbackNegative,
            style: TextStyle(color: Colors.red),
          ),
        ],
      );
    } else {
      return Row(
        children: const [
          Icon(Icons.help_outline, color: Colors.grey),
          SizedBox(width: 8),
          Text(
            AuctionStrings.feedbackNotAvailable,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
    }
  }
}
