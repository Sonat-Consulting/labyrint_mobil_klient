import 'package:labyrint_mobil_klient/model/direction.dart';

class GameAction {
  final String action;
  final String gameId;
  final String clientId;
  final Direction direction;

  GameAction({
    required this.action,
    required this.gameId,
    required this.clientId,
    required this.direction,
  });

  Map<String, dynamic> toJson() {
    return {
      'Action': action,
      'GameId': gameId,
      'ClientId': clientId,
      'Direction': direction.name,
    };
  }
}
