import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/data/product/ProductItems.dart';
class details extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Color(0xffb89686),
      appBar: AppBar(
        toolbarHeight: screensize.height*0.1,
        backgroundColor:Color(0xffb89686),
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
      body: SingleChildScrollView(
          child: Column(
          children:<Widget> [
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
                    height: size.height*2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child:Container(
                      padding: EdgeInsets.only(left:size.width * 0.12 ,right:size.width * 0.05 ),
                      child: Column(
                            children:<Widget> [

                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."),
                      Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                      Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                              padding: EdgeInsets.only(
                                top: size.height * 0.0012,
                                left:size.width * 0.05,
                              ),

                              child:  CounterWithFavBtn(),),

                               ],
                             ),
                              AddToCart(),
                            ],
                      ),
                    ),),
                          Padding(padding: EdgeInsets.only(right:screensize.height*0.0 ,left:screensize.height*0.02),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Text('hrissa sicam',
                                        style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white ,
                                          fontWeight: FontWeight.bold),),
                                        SizedBox(height:20.0),
                                    Row(
                                  children: <Widget>[
                                    Icon(Icons.add_business_sharp, color:Colors.white,),
                                    RichText(text: TextSpan(
                                      children: [
                                        TextSpan(text:"   price : 0.8 DT",
                                        style: TextStyle(fontSize: 18,color: Colors.white),),
                                              ],
                                          ),),
                                          SizedBox(width:40.0),

                                      Expanded(
                                        child:Container(
                                            margin:EdgeInsets.only(
                                              top: screensize.height*0.002,
                                               right :screensize.height*0.00,),
                                          child:Image.asset("images/hrissa.png",height: screensize.height*0.25,
                                        width: screensize.width*0.9,
                                                  fit:BoxFit.fill,
                                          )))
                                                 ],
                                        )],),)],),)],),),);
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
                color: Color(0xffb89686),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart, color:Colors.black,),
                color:Color(0xffb89686),  onPressed: () {  },
              ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color(0xffb89686),
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
    Key?  key ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Container(
          margin:EdgeInsets.only(left: size.width * 0.13),
          padding: EdgeInsets.all(8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xffb89686),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.favorite, color:Colors.white,),
        )
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
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:1),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({icon: Icons.add, required Function press}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.15,
      height: size.width * 0.15,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press(),
        child: Icon(icon),
      ),
    );
  }
}