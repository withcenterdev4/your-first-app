import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     DiffList(
//       items: List<ListItem>.generate(
//         1000,
//         (i) => i % 6 == 0
//             ? HeadingItem('Heading $i')
//             : MessageItem('Sender $i', 'Message Body $i'),
//       ),
//     ),
//   );
// }

class DiffList extends StatelessWidget {
  final List<ListItem> items;
  const DiffList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed Apps';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                  textColor: orientation == Orientation.portrait
                      ? Colors.black
                      : Colors.red,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubtitle(BuildContext context) => Text(sender);

  @override
  Widget buildTitle(BuildContext context) => Text(body);
}
