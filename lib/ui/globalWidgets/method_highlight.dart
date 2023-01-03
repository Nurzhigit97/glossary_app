import 'package:flutter/material.dart';

// Получает для сравнения title glossaries и textController.text
List<TextSpan> highlightOccurrences({String? source, String? query}) {
  if (query == null || query.isEmpty) {
    return [TextSpan(text: source)];
  }

  var matches = <Match>[];
  for (final token in query.trim().toLowerCase().split(' ')) {
    matches.addAll(token.allMatches(source!.toLowerCase()));
  }

  if (matches.isEmpty) {
    return [TextSpan(text: source)];
  }
  matches.sort((a, b) => a.start.compareTo(b.start));

  int lastMatchEnd = 0;
  final List<TextSpan> children = [];
  for (final match in matches) {
    if (match.end <= lastMatchEnd) {
      // already matched -> ignore
    } else if (match.start <= lastMatchEnd) {
      children.add(TextSpan(
        text: source!.substring(lastMatchEnd, match.end),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          backgroundColor: Color.fromARGB(181, 12, 201, 37),
        ),
      ));
    } else if (match.start > lastMatchEnd) {
      children.add(TextSpan(
        text: source!.substring(lastMatchEnd, match.start),
      ));

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          backgroundColor: Color.fromARGB(181, 12, 201, 37),
        ),
      ));
    }

    if (lastMatchEnd < match.end) {
      lastMatchEnd = match.end;
    }
  }

  if (lastMatchEnd < source!.length) {
    children.add(TextSpan(
      text: source.substring(lastMatchEnd, source.length),
    ));
  }

  return children;
}
