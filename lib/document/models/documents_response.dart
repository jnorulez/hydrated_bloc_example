import 'dart:collection';

import 'package:equatable/equatable.dart';

import 'models.dart';

class DocumentsResponse extends Equatable {
  final List<Document> _documents;

  DocumentsResponse(this._documents);

  DocumentsResponse.fromJson(List<dynamic> parsedJson)
      : _documents = parsedJson
            .map<Document>((json) => Document.fromJson(json))
            .toList();

  List<Document> get documents => UnmodifiableListView<Document>(_documents);

  @override
  List<Object> get props => [_documents];

  @override
  bool get stringify => true;
}
