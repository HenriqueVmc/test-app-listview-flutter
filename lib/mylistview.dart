import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordsState extends State<RandomWords> {
  final _randomWords = <WordPair>[];
  final Set<WordPair> _bufferWords = Set<WordPair>();
  final _fontStyle =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Words CamelCase'),
      ),
      body: _getListView(),
    );
  }

  Widget _getRowList(WordPair word) {
    final bool wordChecked = _bufferWords.contains(word);

    return ListTile(
        title: Text(
          word.asPascalCase,
          style: _fontStyle,
        ),
        trailing: Icon(
          wordChecked ? Icons.favorite : Icons.favorite_border,
          color: wordChecked ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (wordChecked) {
              _bufferWords.remove(word);
            } else {
              _bufferWords.add(word);
            }
          });
        });
  }

  Widget _getListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          
          if (i.isOdd) return Divider();

          final index = i ~/ 2; // arredonda resultado da divisão

          if (index >= _randomWords.length) {
            _randomWords.addAll(generateWordPairs().take(10));
          }

          return _getRowList(_randomWords[index]);
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
