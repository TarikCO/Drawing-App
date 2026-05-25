import 'package:drawingapp/components/drawing_tile.dart';
import 'package:drawingapp/models/cart.dart';
import 'package:drawingapp/models/drawing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String searchQuery = '';

  String _normalize(Object? value) {
    return (value ?? '').toString().toLowerCase().trim();
  }

  @override
  Widget build(BuildContext context) {
    final drawingShop = context.watch<Cart>().getDrawingList();
    final filteredDrawings = drawingShop.where((drawing) {
      final query = _normalize(searchQuery);
      if (query.isEmpty) return true;

      final drawingName = _normalize(drawing.name);
      final drawingDescription = _normalize(drawing.description);

      return drawingName.contains(query) || drawingDescription.contains(query);
    }).toList();

    return Column(
      children: [
        const SizedBox(height: 10),

      // search bar
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),

      // message
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Text(
          '"drawings are like expressions of ourselves"',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),

      // drawings
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Portraits Drawings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 10),

      Expanded(
        child: filteredDrawings.isEmpty
            ? const Center(
                child: Text(
                  'No drawings found',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(right: 25),
                itemCount: filteredDrawings.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Drawing drawing = filteredDrawings[index];
                  return DrawingTile(
                    drawing: drawing,
                    onTap: () {
                      context.read<Cart>().addItemToCart(drawing);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart')),
                      );
                    },
                  );
                },
              ),
      ),

      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 25),
        child: Divider(
          color: Colors.white,
        ),
      ),
    ],
    );
  }
}