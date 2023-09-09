import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/widgets/topic_button.dart';

class SelectTopicsProvider extends ChangeNotifier {
  Future<void> storeTopics() async {
    String id = await Database.auth.currentUser!.uid;
    Map<String, List<String>>? mapOfTopics;
    mapOfTopics = {'topics':TopicButton.topics};
    await Database.database.collection("Users").doc(id).update(mapOfTopics);
  }
}
