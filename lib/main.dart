import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? lat;
  double? long;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Get Kuala Lumput Weather'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                const query = "Kuala Lumpur";
                var addresses = await Geocoder.local.findAddressesFromQuery(query);
                var first = addresses.first;
                setState(() {
                  lat = first.coordinates.latitude ?? -1;
                  long = first.coordinates.longitude ?? -1;
                });
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Text('Latitude: $lat'),
            Text('Longitude: $long'),
          ],
        ),
      ),
    );
  }
}
