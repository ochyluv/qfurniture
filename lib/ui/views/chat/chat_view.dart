import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/chat/chat_viewmodel.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Chat view',
            style: AppStyle.kHeading1,
          ),
        ),
      ),
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
