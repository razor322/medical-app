import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/screen/detail_screen.dart';
import 'package:medical_app/utils/cek_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical_app/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // Future<List<Datum>?> getBerita() async{
  //   try {
  //     http.Response res = await http.get(Uri.parse('http://localhost/medicalDb/getBerita.php'));
  //     return modelBeritaFromJson(res.body).data;
  //   } catch (e) {
  //     setState(() {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))
  //       );
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
          ("Info Berita", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
      ),

      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [Color.fromARGB(255, 0, 170, 146)],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         onChanged: _searchKamus,
      //         decoration: InputDecoration(
      //           labelText: 'Search Keyword',
      //           border: OutlineInputBorder(),
      //           fillColor: Colors.white, 
      //           filled: true, 
      //         ),
      //       ),
      //     ),SizedBox(height: 20),
      //       Expanded(
      //         child: 
      //         Container(
      //                   decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(25),
      //                       topRight: Radius.circular(25))),
      //           child: ListView.builder(
      //             itemCount: _searchResult?.length ?? _beritaList?.length ?? 0,
      //             itemBuilder: (context, index) {
      //               Datum? data = _searchResult?[index] ?? _beritaList?[index];
      //               return Padding(
      //                 padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      //                 child: GestureDetector(
      //                   onTap: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (context) => PageDetailBerita(data)),
      //                     );
      //                   },
      //                   child: Card(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         ListTile(
      //                           title: Text(
      //                             "${data?.judulberita}",
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 16,
      //                               color: Colors.black,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}