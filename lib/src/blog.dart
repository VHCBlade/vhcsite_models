import 'package:event_db/event_db.dart';
import 'package:tuple/tuple.dart';

/// Holds metadata and information about a specific blog. The actual blog should
/// be stored elsewhere, such as in a file.
class BlogManifest extends GenericModel {
  late String path;
  late String name;
  late DateTime uploadDate;

  String? next;
  String? previous;

  List<String> get convertedPath => path.split('/');
  String get category => convertedPath[1];

  @override
  Map<String, Tuple2<Getter<dynamic>, Setter<dynamic>>> getGetterSetterMap() =>
      {
        'path': GenericModel.primitive(() => path, (value) => path = value!),
        'name': GenericModel.primitive(() => name, (value) => name = value!),
        'uploadDate': GenericModel.dateTime(
          () => uploadDate,
          (value) => uploadDate = value!,
        ),
      };

  @override
  String get type => 'BlogManifest';
}

class BlogViews extends GenericModel {
  late String _path;
  set path(String path) => idSuffix = _path = path;
  String get path => _path;
  int viewCount = 0;

  @override
  Map<String, Tuple2<Getter<dynamic>, Setter<dynamic>>> getGetterSetterMap() =>
      {
        'path': GenericModel.primitive(
          () => path,
          (value) => path = value!,
        ),
        'viewCount': GenericModel.number(
          () => viewCount,
          (value) => viewCount = value?.toInt() ?? 0,
        ),
      };

  @override
  String get type => 'BlogViews';
}
