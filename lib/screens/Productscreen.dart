

import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/data/product/ProductItems.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

import 'Chat_With_Personal_shopper.dart';
import 'details.dart';
import 'home_screen.dart';


class ProductScreen extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  late String filter;
  @override
  void initState(){

    controller.addListener(() {
      filter = controller.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Credit 180.52£'),
          ),
          TextButton(
              style: style,
              onPressed: () {},
              child: new Container(
                width:90.0,
                height:90.0,
                decoration: new BoxDecoration(
                    shape:BoxShape.circle,
                    image: new DecorationImage(
                        fit : BoxFit.fill,
                        image: AssetImage('images/profile.jpg'))
                ),
              )
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));},
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeinterface()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Chat()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          ),
        ),
      ),
      body:Column(
        children: <Widget>[
          Text(
            'choose your product',
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, fontSize: 30, color:Colors.grey,),

          ),
                Column(
                  children:<Widget>[
                    Row(
                    children: <Widget>[
                      Expanded(child: Container(
                        height: 80,
                        padding: EdgeInsets.only(
                          top:35,
                          left: 15,
                          right:5,
                          bottom: 5,
                        ),
                        width: double.infinity,
                        color: Colors.white10,
                        child:TextField(
                          controller: controller,
                          decoration:InputDecoration(
                            enabledBorder: UnderlineInputBorder (borderRadius: BorderRadius.circular(25.7),borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder (borderRadius: BorderRadius.circular(25.7),borderSide: BorderSide(color: Colors.black)
                            ),
                            labelText: 'search',
                          filled:true,
                            fillColor: Colors.white12,
                          ),
                        ),
                      ),
                      ),
                      Container(
                        height:80,
                        color: Colors.white,
                        padding:EdgeInsets.only(
                          top:25, right:15
                        ),
                        child:Icon(Icons.search),
                      ),
                    ],
                    ),
                  ],
                ),
                Expanded(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                    )),
              )),
          ],
    ),
    );
  }
}
class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({
    Key ,
    required this.product,

  }) : super(key: Key);

  get index => products.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(20),
      child: Column(
        children: <Widget>[

          Container(
            padding:EdgeInsets.all(16),
            height:250,
            width:250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),

            ),
            child:Column(
              children: <Widget>[
                Image.asset(product.image,height: 150,width: 150,),
                Text(product.title,
                  style: TextStyle(fontSize: 25),
                ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => details()));
              },

              color: Colors.grey,
              child: Text(
                'details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
              ],

            ),
          ),

        ],

      ),
    );
  }
}

