import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:instagramclone/widgets/bottom_nav.dart';

class CaptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int captionCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: captionCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return ListTile(
              title: Text(document['caption'] ?? '<No caption retrieved>'),
              subtitle: Text('caption ${index + 1} of $captionCount'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  CollectionReference get posts => Firestore.instance.collection('posts');

  Future<Null> _addcaption() async {
    final DocumentReference document = posts.document();
    document.setData(<String, dynamic>{
      'caption': 'Hello world!',
    });
  }

  @override
  Widget build(BuildContext context) {
    // int _currentIndex;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: CaptionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addcaption,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
