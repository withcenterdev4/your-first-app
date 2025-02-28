import 'package:flutter/material.dart';

// void main() {
//   runApp(Interactivity ());
// }

class Interactivity extends StatefulWidget {
  const Interactivity({super.key});

  @override
  State<Interactivity> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<Interactivity> {
  bool isFavorite = false;
  int totalFav = 42;
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = isFavorite ? false : true;
                totalFav = isFavorite ? totalFav + 1 : totalFav - 1;
              });
            },
            icon: isFavorite
                ? Icon(Icons.star)
                : Icon(Icons.star_outline_outlined),
            color: Theme.of(context).primaryColor,
          ),
          Text('$totalFav'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(color, "Call", Icons.phone),
        _buildButton(color, "Route", Icons.near_me),
        _buildButton(color, "Share", Icons.share),
      ],
    );
    return MaterialApp(
      title: 'Layout Demo',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              'assets/lake.jpeg',
              height: 240,
              width: 600,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButton(Color color, String text, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        )
      ],
    );
  }
}
