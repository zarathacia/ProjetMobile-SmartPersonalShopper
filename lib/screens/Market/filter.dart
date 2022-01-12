import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/data/product/ProductItems.dart';

import '../../constants.dart';
class filter extends StatefulWidget {
  const filter({Key? key}) : super(key: key);

  @override
  _filterState createState() => _filterState();
}

class _filterState extends State<filter> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Product> _allUsers = products;

  // This list holds the data for the list view
  List<Product> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((product) =>
          product.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('search item'),
        backgroundColor: PrimaryRed,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index].id),
                  color: Colors.grey[50]?.withOpacity(0.01),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Image.asset( _foundUsers[index].image.toString(),),
                    title: Text(_foundUsers[index].title,
                        style: TextStyle(fontSize: 24,color: Colors.white),
                    ),


                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}