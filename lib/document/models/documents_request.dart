import 'package:equatable/equatable.dart';

import 'models.dart';

class DocumentRequest extends Equatable {
  final Document _document;

  DocumentRequest(this._document);

  factory DocumentRequest.fromJson(Map<String, dynamic> json) {
    return DocumentRequest(Document.fromJson(json));
  }

  Document get document => _document;

  @override
  List<Object> get props => [_document];

  @override
  bool get stringify => true;
}
