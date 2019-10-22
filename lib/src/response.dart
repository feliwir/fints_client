import 'package:fints_client/src/segments/hibpa.dart';
import 'package:fints_client/src/segments/hisyn.dart';

class ResponseSegment {
  String name;
  int id;
  List<String> contents;

  ResponseSegment(this.name, this.id, this.contents);
}

class Response {
  List<ResponseSegment> _responses;
  Iterable<ResponseSegment> get warnings =>
      _responses.where((rs) => _isStatus(rs));
  ResponseSegment get _bpaResponse => _responses.firstWhere((rs) => _isBpa(rs));
  HibpaSegment get bpa => new HibpaSegment(_bpaResponse.contents);
  ResponseSegment get _synResponse => _responses.firstWhere((rs) => _isSyn(rs));
  HisynSegment get syn => new HisynSegment(_synResponse.contents);

  Response(String content) {
    _responses = new List();

    var segments = content.split('\'');
    segments.removeWhere((value) => value.isEmpty);
    segments.forEach((seg) {
      var parts = seg.split(":");
      var segName = parts.first;
      var segId = int.parse(parts[1]);

      _responses.add(new ResponseSegment(segName, segId, parts.sublist(2)));
    });
  }

  bool _isStatus(ResponseSegment rs) {
    return rs.name == "HIRMG" || rs.name == "HIRMS";
  }

  bool _isBpa(ResponseSegment rs) {
    return rs.name == HibpaSegment.name();
  }

  bool _isSyn(ResponseSegment rs) {
    return rs.name == HisynSegment.name();
  }
}
