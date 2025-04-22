import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/features/auction_data/presentation/widgets/feedback_rating_display.dart';
import 'package:flutter/material.dart';

class AuctionScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const AuctionScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final make = data['make'] ?? AppStrings.unknown;
    final model = data['model'] ?? AppStrings.unknown;
    final uuid = data['_fk_uuid_auction'] ?? AppStrings.notAvailable;
    final price = data['price'] ?? AppStrings.unknown;
    final feedbackText = data['feedback'];
    final isPositive = data['positiveCustomerFeedback'];
    return Scaffold(
      appBar: AppBar(title: Text(AuctionStrings.auctionResult)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AuctionStrings.model}$model',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('${AuctionStrings.uuid}$uuid'),
            const SizedBox(height: 8),
            Text('${AuctionStrings.price}$price'),
            const SizedBox(height: 8),
            if (feedbackText != null)
              Text('${AuctionStrings.feedback}$feedbackText'),
            const SizedBox(height: 24),
            if (isPositive != null)
              FeedbackRatingDisplay(feedback: isPositive)
            else
              const FeedbackRatingDisplay(feedback: null),
          ],
        ),
      ),
    );
  }
}
