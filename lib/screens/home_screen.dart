import 'package:ecommerce/api/products.dart';
import 'package:ecommerce/screens/products_screen.dart';
import 'package:ecommerce/widgets/icon.dart';
import 'package:ecommerce/widgets/offer_card.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool homeButtonPressed = false;
  bool cartButtonPressed = false;
  bool notificationButtonPressed = false;
  bool profileButtonPressed = false;

  var fetch = FetchProducts();
  List<ProductModel> products = [];
  List<ProductModel> clothes = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      products = await fetch.getProducts();
      getClothes(products);
    } catch (e) {
      throw e.toString();
    }
  }

  void getClothes(List<ProductModel> prod) {
    for (var prd in prod) {
      if (prd.category == "men's clothing" ||
          prd.category == "women's clothing") {
        clothes.add(prd);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController searchFieldController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height / 7,
          leading: const Row(
            children: [
              Spacer(),
              CustomIcon(image: "assets/icons/menu.png"),
            ],
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 219, 218, 218),
                  shape: BoxShape.circle),
              child: Image.asset("assets/images/avatar.png"),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      homeButtonPressed = !homeButtonPressed;
                      cartButtonPressed = false;
                      notificationButtonPressed = false;
                      profileButtonPressed = false;
                    });
                  },
                  child: homeButtonPressed
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/home.png",
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      : Image.asset(
                          "assets/icons/home.png",
                          color: Colors.black,
                        ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cartButtonPressed = !cartButtonPressed;
                      homeButtonPressed = false;
                      notificationButtonPressed = false;
                      profileButtonPressed = false;
                    });
                  },
                  child: cartButtonPressed
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/cart.png",
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Cart",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      : Image.asset("assets/icons/cart.png"),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      notificationButtonPressed = !notificationButtonPressed;
                      homeButtonPressed = false;
                      cartButtonPressed = false;
                      profileButtonPressed = false;
                    });
                  },
                  child: notificationButtonPressed
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/notification.png",
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      : Image.asset("assets/icons/notification.png"),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      profileButtonPressed = !profileButtonPressed;
                      homeButtonPressed = false;
                      cartButtonPressed = false;
                      notificationButtonPressed = false;
                    });
                  },
                  child: profileButtonPressed
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/profile.png",
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      : Image.asset("assets/icons/profile.png"),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome,",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Our Fashions App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 3 / 4,
                    child: TextField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: searchFieldController,
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: const Color.fromARGB(255, 222, 222, 222),
                        fillColor: const Color.fromARGB(255, 222, 222, 222),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 222, 222),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 222, 222),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CustomIcon(image: "assets/icons/icon.png"),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OfferCard(
                      percent: '50',
                      code: "FSCREATION",
                      image: "assets/images/fifty.png",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OfferCard(
                      percent: '70',
                      code: "FSCREATION70",
                      image: "assets/images/seventy.png",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                    prod: clothes,
                                  )));
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: clothes.isEmpty
                    ? const Center(child: Text('No clothes available'))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 2, // Adjust itemCount to clothes.length
                        itemBuilder: (context, index) {
                          var prod = clothes[index];
                          return ProductCard(product: prod);
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
