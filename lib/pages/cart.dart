import 'package:drawingapp/models/cart.dart';
import 'package:drawingapp/models/drawing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final userCart = context.watch<Cart>().getUserCart();
    final double totalAmount = userCart.fold<double>(
      0.0,
      (sum, item) => sum + (double.tryParse(item.price) ?? 0),
    );


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: userCart.isEmpty
              ? const Center(
                  child: Text('Your cart is empty'),
                )
              : ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final Drawing drawing = userCart[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 6,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          drawing.imagePath,
                          width: 52,
                          height: 52,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        drawing.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text('\$${drawing.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          context.read<Cart>().removeItemFromCart(drawing);
                        },
                      ),
                    );
                  },
                ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: Row(
            children: [
              Text(
                'Your total is: ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}