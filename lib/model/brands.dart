import 'package:remote_control/model/remote_model.dart';

class RemoteBrand {
  final String brandName;
  final List<InfraredRemote> infraredRemotes;

  RemoteBrand({
    required this.brandName,
    required this.infraredRemotes,
  });
}
