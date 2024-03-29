
import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/ecommerce/product_view.dart';
import 'package:justpet/customer/models/petshop_class.dart';

import '../../../models/product_class.dart';

class PetShopHome extends StatefulWidget {
  final PetShopClass data;

  const PetShopHome({Key? key, required this.data}) : super(key: key);

  @override
  State<PetShopHome> createState() => _PetShopHomeState();
}

class _PetShopHomeState extends State<PetShopHome> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  List<dynamic> productList = [];
  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];
  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    Color(0xFFFFC1D9),
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;

  var selectedRange = const RangeValues(1.00, 200.00);

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          stretch: true,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 100),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              title: AnimatedOpacity(
                opacity: _isScrolled ? 0.0 : 1.0,
                duration: Duration(milliseconds: 500),
                child: Text(widget.data.petshopDescription,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                    )),
              ),
              background: Image.asset("assets/images/background.png", fit: BoxFit.fill)
          ),
          // bottom: AppBar(
          //   automaticallyImplyLeading: false,
          //   toolbarHeight: 70,
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   title: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           height: 50,
          //           child: TextField(
          //             cursorColor: Colors.grey,
          //             decoration: InputDecoration(
          //               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //               fillColor: Colors.white,
          //               prefixIcon: Icon(Icons.search, color: Colors.black),
          //               border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(10),
          //                   borderSide: BorderSide.none
          //               ),
          //               hintText: "Cerca un prodotto",
          //               hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 50,
          //         width: 50,
          //         child: IconButton(
          //           onPressed: () {
          //             showFilterModal();
          //           },
          //           icon: Icon(Icons.filter_list, color: Colors.black, size: 30,),
          //         ),
          //       ),
          //       SizedBox(width: 10),
          //     ],
          //   ),
          // ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                height: 330,
                color: Colors.white,
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Prodotti in evidenza', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, inherit: false, letterSpacing: 1),),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text('Vedi tutti i prodotti', style: TextStyle(color: Colors.black, fontSize: 14, inherit: false),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.data.products.length,
                              itemBuilder: (context, index) {
                                return productCart(widget.data.products[index]);
                              }
                          )
                      )
                    ]
                )
            ),
            Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                height: 180,
                color: Colors.white,
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Prodotti per te', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, inherit: false, letterSpacing: 1),),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text('Vedi tutti i prodotti ', style: TextStyle(color: Colors.black, fontSize: 14, inherit: false),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.data.products.length,
                              itemBuilder: (context, index) {
                                return forYou(widget.data.products[index]);
                              }
                          )
                      )
                    ]
                )
            ),
            Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                height: 330,
                color: Colors.white,
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('In sconto', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, inherit: false, letterSpacing: 1),),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text('Vedi tutti i prodotti ', style: TextStyle(color: Colors.black, fontSize: 14, inherit: false),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.data.products.length,
                              itemBuilder: (context, index) {
                                return productCart(widget.data.products[index]);
                              }
                          )
                      )
                    ]
                )
            ),
          ]),
        )
      ]
    );
  }
  productCart(Product product) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewPage(product: product,)));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )],
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(product.imagePath, fit: BoxFit.fill)
                      ),
                    ),
                    // Add to cart button
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: MaterialButton(
                        color: Colors.black,
                        minWidth: 45,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: () {
                          addToCartModal();
                        },
                        padding: EdgeInsets.all(5),
                        child: Center(child: Icon(Icons.shopping_cart, color: Colors.white, size: 20,)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text(product.name,
                style: TextStyle(color: Colors.black, fontSize: 18,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.description, style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                  Text("€ ${product.price}",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  forYou(Product product) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.grey.shade200,
          )],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(product.imagePath, fit: BoxFit.fill)),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product.name,
                      style: TextStyle(color: Colors.black, fontSize: 18,),
                    ),
                    SizedBox(height: 5,),
                    Text(product.description, style: TextStyle(color: Colors.orange.shade400, fontSize: 13,),),
                    SizedBox(height: 10,),
                    Text("€ ${product.price}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }

  addToCartModal() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 350,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Color", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index ? Icon(Icons.check, color: Colors.white,) : Container(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Size", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: size.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                                shape: BoxShape.circle
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  button('Add to Cart', () {
                    Navigator.pop(context);

                    // Let's show a snackbar when an item is added to the cart
                    final snackbar = SnackBar(
                      content: Text("Item added to cart"),
                      duration: Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  })
                ],
              ),
            );
          },
        )
    );
  }

  button(String text, Function onPressed) {
    return MaterialButton(
      onPressed: () => onPressed(),
      height: 50,
      elevation: 0,
      splashColor: Colors.yellow[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.yellow[800],
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}
