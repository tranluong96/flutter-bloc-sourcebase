import 'package:flutter/material.dart';
import 'package:my_app/core/shared/image_cached.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              padding: const EdgeInsets.all(15),
              child: const AspectRatio(
                aspectRatio: 1,
                child: ImageCached(
                  width: double.infinity,
                  fit: BoxFit.contain,
                  imageUrl:
                      'https://freepngimg.com/save/13348-headphones-png-hd/2400x1996',
                  // height: 100,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(10)),
                  color: Colors.amber[400],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Text(
                  "10% OFF",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Text("Noise Cancelling Headphones"),
        const SizedBox(height: 5),
        const Text(
          "\$249.95",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
