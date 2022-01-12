import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/Market/Productscreen.dart';
import 'package:smart_personal_shopper/screens/Market/cart.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';
import 'package:smart_personal_shopper/data/product/product.dart';
import '../Payment/paycard.dart';
import '../home.dart';

class details extends StatefulWidget {
  Product currentProduct = Product(
      id: "001",
      name: "harissa",
      description: "lorem",
      price: "0.8",
      review: "8",
      image: "images/hrissa.png");
  details() {
    print("Non-parameterized constructor invoked");
  }
  details.product({required this.currentProduct});

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SecondaryRed,
      appBar: AppBar(
        //toolbarHeight: screensize.height * 0.1,
        backgroundColor: SecondaryRed,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop()
            //.push(MaterialPageRoute(builder: (context) => ProductScreen())),
            ),
        leadingWidth: 30,
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyCard()));
            },
            child: const Text('Credit:180.52 DT'),
          ),
          TextButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: new Container(
                width: 70.0,
                height: 45.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/pouya.jfif'))),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                    ),
                    height: size.height * 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: size.width * 0.12, right: size.width * 0.05),
                      child: Column(
                        children: <Widget>[
                          Text(widget.currentProduct.description),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(size.height * 0.01),
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.005,
                                ),
                                child: CounterWithFavBtn(),
                              ),
                            ],
                          ),
                          AddToCart(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screensize.height * 0.0,
                        left: screensize.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.currentProduct.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.add_business_sharp,
                              color: Colors.white,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.currentProduct.price + "  DT",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 40.0),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                      top: screensize.height * 0.002,
                                      right: screensize.height * 0.00,
                                    ),
                                    child: Image.network(
                                      widget.currentProduct.image,
                                      width: screensize.width * 0.9,
                                      height: screensize.height * 0.3,
                                      fit: BoxFit.fill,
                                    )))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Color(0xFFff4d6d),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
              color: Color(0xFFff4d6d),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: SecondaryRed,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        /* Container(
          margin: EdgeInsets.only(left: size.width * 0.13),
          padding: EdgeInsets.all(8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: SecondaryRed,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        )*/
      ],
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width * 0.06,
          height: size.width * 0.06,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            onPressed: () {
              if (numOfItems > 0) {
                setState(() {
                  numOfItems--;
                });
              }
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: size.width * 0.06,
          height: size.width * 0.06,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
