// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:medical_app/model/pegawai/model_pegawai.dart';

class PegawaiDetail extends StatelessWidget {
  final Datum? data;

  const PegawaiDetail(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pegawai'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Color.fromARGB(255, 0, 170, 146)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      Text(
                        "nama : ${data?.nama} ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("email ${data?.email}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("no hp ; ${data?.noHp}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text("no bp ${data?.noBp}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
