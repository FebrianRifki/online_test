import 'package:flutter/material.dart';
import 'http/get_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    Product.fetchProduct().then((value) => {
          if (value.isNotEmpty)
            {
              for (var i = 0; i < value.length; i++) {products.add(value[i])}
            }
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(),
          _buildSlider(),
          _buildVoucer(),
          _buildRecomendation()
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
        decoration: BoxDecoration(color: Colors.green.shade400),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'FOOD.ID',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.message,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Dikirim ke Jakarta Selatan',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Mau belanja makan apa?',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _buildSlider() {
    return FutureBuilder(
        future: Product.fetchProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            color: Colors.white,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  products.isNotEmpty
                      ? Container(
                          // height: 150,
                          // width: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(products[3].media!),
                          ),
                        )
                      : Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange,
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _buildVoucer() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30),
      child: FutureBuilder(
          future: Product.fetchProduct(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spesial di FOOD.ID',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    products.isNotEmpty
                        ? Container(
                            width: 180,
                            height: 80,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[4].media!,
                                  fit: BoxFit.fill,
                                )),
                          )
                        : Container(
                            width: 180,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orange,
                            )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 190,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange.shade200,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 190,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 228, 146, 116),
                      ),
                    )
                  ],
                )
              ],
            );
          }),
    );
  }

  _buildRecomendation() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cari inspirasi belanja',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: Product.fetchProduct(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Row(
                children: [
                  Column(
                    children: [
                      products.isNotEmpty
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.orange.shade200,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    products[0].media!,
                                    fit: BoxFit.fill,
                                  )),
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.orange.shade200,
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      products.isNotEmpty
                          ? Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[1].media!,
                                  fit: BoxFit.fill,
                                ),
                              ))
                          : Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.orange.shade200,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  products.isNotEmpty
                      ? Container(
                          width: 270,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange.shade200,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              products[2].media!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          width: 270,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange.shade200,
                          ),
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
