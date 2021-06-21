import 'package:equatable/equatable.dart';

import 'models.dart';

class Document extends Equatable {
  final String _uuid;

  final String _constructionsite_uuid;

  final DateTime _createdAt;

  final List<Page> _pages;

  const Document(
      this._uuid, this._constructionsite_uuid, this._createdAt, this._pages);

  factory Document.fromJson(Map<String, dynamic> json) {
    String uuid = json['uuid'];
    String constructionsite_uuid =
        json['constructionsite_uuid'] ?? json['constructionsite']['uuid'];
    DateTime createdAt = DateTime.parse(json['created_at']);
    List<dynamic> jsonPages = json['pages'] ?? json['document_pages'];
    List<Page> parsedPages =
        jsonPages.map((element) => Page.fromJson(element)).toList();
    return Document(uuid, constructionsite_uuid, createdAt, parsedPages);
  }

  Map<String, dynamic> toJson() => {
        'uuid': _uuid,
        'constructionsite_uuid': _constructionsite_uuid,
        'created_at': _createdAt.toString(),
        'pages': _pages
      };

  String get uuid => _uuid;

  String get constructionsite_uuid => _constructionsite_uuid;

  DateTime get createdAt => _createdAt;

  List<Page> get pages => _pages;

  @override
  List<Object> get props => [_uuid, _constructionsite_uuid, _createdAt, _pages];

  @override
  bool get stringify => true;

  @override
  bool operator ==(document) =>
      document is Document && this.uuid == document.uuid;
}
