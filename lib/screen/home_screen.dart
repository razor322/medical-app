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
        title: Text("Info Berita"),
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
      ),

      // body: FutureBuilder(
      //   future: getBerita(),
      //   builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           Datum? data = snapshot.data?[index];
      //           return Padding(padding: EdgeInsets.all(10),
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) 
      //                 => PageDetailBerita(data)
      //                 ));
      //               },
      //               child: Card(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [Padding(padding: EdgeInsets.all(10),
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(10),
      //                     child: Image.network(
      //                       'http://localhost/medicalDb/gambar_berita/${data?.gambarBerita}', 
      //                     fit: BoxFit.fill,), 
      //                       ), 
      //                     ),ListTile(
      //                       title: Text(
      //                         "${data?.judul}", 
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w600, 
      //                           fontSize: 16, 
      //                           color: Color.fromARGB(255, 0, 170, 146)),),
      //                     subtitle: Text( 
      //                       "${data?.isiBerita}", 
      //                       maxLines: 2, 
      //                       style: TextStyle(
      //                         fontSize: 12, 
      //                         color: Colors.black54),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         });
      //     } else if (snapshot.hasError){
      //       return Center(
      //         child: Text(snapshot.error.toString()),
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           color: Color.fromARGB(255, 0, 170, 146),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}