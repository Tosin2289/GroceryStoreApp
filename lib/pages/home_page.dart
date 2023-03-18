import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/componets/grocery_item_tile.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:grocery_store_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return CartPage();
          })));
        }),
        child: Icon(Icons.shopping_bag),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good day,"),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: .7,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: ((context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
