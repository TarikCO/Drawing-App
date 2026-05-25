import 'package:drawingapp/models/drawing.dart';
import 'package:flutter/material.dart';

class DrawingTile extends StatelessWidget {
  final Drawing drawing;
  final VoidCallback? onTap;

  const DrawingTile({super.key, required this.drawing, this.onTap});

  void _showExpandedImage(BuildContext context) {
    final size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.04,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                SizedBox(
                  width: size.width * 0.92,
                  height: size.height * 0.88,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Image.asset(
                      drawing.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Material(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(999),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(999),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        // drawing picture 
        GestureDetector(
          onTap: () => _showExpandedImage(context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(drawing.imagePath),
          ),
        ),

        // description
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 3 ),
          child: Text(
            drawing.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[600])
            ),
        ),

        // price + detail
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    // drawing name
                    Text(
                      drawing.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),

                      const SizedBox(height: 5),

                    // price
                    Text(
                      '\$' + drawing.price,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 6),
          
              // button to add to cart
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 31, 31, 32),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}