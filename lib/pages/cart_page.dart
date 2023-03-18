import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: ((context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                      itemCount: value.cartitems.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              leading: Image.asset(value.cartitems[index][2],
                                  height: 36),
                              title: Text(
                                value.cartitems[index][0],
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                '\$' + value.cartitems[index][1],
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index);
                                },
                                icon: Icon(Icons.cancel),
                              ),
                            ),
                          ),
                        );
                      })),
                )),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$' + value.calculateTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade100),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
