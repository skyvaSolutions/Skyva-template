import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SearchPage extends StatefulWidget {
  static const String id = 'searchScreen';

  const SearchPage({ Key key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar
      (
        automaticallyImplyLeading: false,
        elevation: 20,
        title:  TextField(
          style: GoogleFonts.poppins(
            fontSize:19,
          ),
          autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.arrow_back,color: Colors.white,),
              suffixIcon: Icon(Icons.clear,color: Colors.white),
              hintText: 'Search',
              
              border: InputBorder.none,
            ),
          ),
      ),
      
    );
  }
}