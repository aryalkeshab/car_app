import 'package:flutter/material.dart';

class NameDescribe extends StatelessWidget {
  String? topic;
  String? data;
  NameDescribe({this.data, this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            topic.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data.toString(),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
