import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';

class CustomDialog extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String actualWeight;
  final String goldPurity;
  final String weight;
  final String size;
  final int quantity;
  final double totalWeight;

  const CustomDialog({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.actualWeight,
    required this.goldPurity,
    required this.weight,
    required this.size,
    required this.quantity,
    required this.totalWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: Dimens.edgeInsets10,
        width: MediaQuery.of(context).size.width * 2.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Actual Weight: \n$actualWeight gm'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailChip(label: 'Gold Purity', value: goldPurity),
                DetailChip(label: 'Weight', value: weight),
                DetailChip(label: 'Size', value: size),
              ],
            ),
            const SizedBox(height: 10),
            Text('Total Products: $quantity'),
            Text('Total Weight: $totalWeight gm'),
            Padding(
              padding: Dimens.edgeInsets10,
              child: CustomButton(
                height: 50,
                text: 'Checkout',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailChip extends StatelessWidget {
  final String label;
  final String value;

  const DetailChip({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('$label: $value', style: const TextStyle(fontSize: 12)),
    );
  }
}

// onPressed: () {
// showDialog(
// context: context,
// builder: (context) => CustomDialog(
// imageUrl: 'https://example.com/image.png',
// title: 'Diamond Ring',
// actualWeight: '10.89',
// goldPurity: '18kt Rose',
// weight: '10gm',
// size: '10.3',
// quantity: 2,
// totalWeight: 10.89,
// ),
// );
// },
