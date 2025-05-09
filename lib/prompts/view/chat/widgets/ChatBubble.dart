import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final bool isCurrentUser;

  Widget build(BuildContext context) {
  return Padding(
    // add some padding
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Align(
      // align the child within the container
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: DecoratedBox(
        // chat bubble decoration
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87),
            ),
          )
        ),
      ),
    ),
  );
}
}
