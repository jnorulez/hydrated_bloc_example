import 'package:equatable/equatable.dart';

class Page extends Equatable {
  final String _fileName;
  final String _uuid;

  const Page(this._fileName, this._uuid);

  Page.fromJson(Map<String, dynamic> parsedJson)
      : _fileName = parsedJson['fileName'],
        _uuid = parsedJson['uuid'];

  Map<String, dynamic> toJson() => {'uuid': _uuid, 'fileName': _fileName};

  String get fileName => _fileName;

  String get uuid => _uuid;

  @override
  List<Object> get props => [_fileName, _uuid];

  @override
  bool get stringify => true;
}
