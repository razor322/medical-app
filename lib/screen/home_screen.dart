import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/const.dart';
import 'package:medical_app/model/model_berita.dart';
import 'package:medical_app/screen/detail_screen.dart';
import 'package:medical_app/utils/cek_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical_app/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? id, username;
  late List<Datum> _allBerita = [];
  late List<Datum> _searchResult = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getBerita();
  }

  Future<void> getBerita() async {
    try {
      http.Response res = await http.get(Uri.parse('$url/getBerita.php'));
      List<Datum> data = modelBeritaFromJson(res.body).data ?? [];
      setState(() {
        _allBerita = data;
        _searchResult = data;
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      });
    }
  }

  void _filterBerita(String query) {
    List<Datum> filteredBerita = _allBerita
        .where((berita) =>
            berita.judul!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _searchResult = filteredBerita;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Info Berita",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              onChanged: _filterBerita,
              decoration: InputDecoration(
                hintText: 'Cari berita...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                Datum data = _searchResult[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageDetailBerita(data),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.network(
                                  '$url/gambar_berita/${data.gambarBerita}',
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "${data.judul}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 170, 146),
                              ),
                            ),
                            subtitle: Text(
                              "${data.isiBerita}",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
