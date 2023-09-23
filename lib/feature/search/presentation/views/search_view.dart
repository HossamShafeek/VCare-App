import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body:  const  Column(
          children: [
            Center(
              child: Text('Profile'),
            )
          ],
        ),
    );
  }
}
