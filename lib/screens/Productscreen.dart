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
    var screensize=MediaQuery.of(context).size;

    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
       appBar: AppBar(
      toolbarHeight: screensize.height*0.1,
      backgroundColor: const Color(0xffF57752),
      elevation: 0.0,

      actions: <Widget>[
        TextButton(
          style: style,
          onPressed: () {},
          child: const Text('Credit:180.52 DT'),
        ),
        TextButton(
            style: style,
            onPressed: () {},
            child: new Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/profile.jpg'))),
            ))
      ],
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
                ),
                ),
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

  get itemcount => products.length;

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return GestureDetector(
      child:SingleChildScrollView(
        child: Stack(
            children: <Widget>[
        new Container(
        padding: EdgeInsets.all(screensize.height*0.005),
        child: Column(
        children: <Widget>[

          Container(
            padding:EdgeInsets.all(screensize.height*0.005),
            height: screensize.height*0.25,
            width: screensize.width*0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),

            ),
            child:Column(
              children: <Widget>[
                Image.asset(product.image,height: screensize.height*0.1,
                  width: screensize.width*0.4,),
                Text(product.title,
                  style: TextStyle(fontSize: 15),
                ),
            RaisedButton(
              onPressed: () {
               Navigator.push(
                      context,
                    MaterialPageRoute(
                        builder: (context) => details()));
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
    ),
    ],
        ),
    ),
    );
  }
}

