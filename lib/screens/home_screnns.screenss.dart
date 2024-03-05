import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generateur de code Qr"),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qrData.isEmpty ?
                  Text(
                    "Entrer les données pour generer un code QR",
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.indigo,),
                    )
                    :QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Entrer les données",
                  border: OutlineInputBorder()
                ),
                onChanged: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}