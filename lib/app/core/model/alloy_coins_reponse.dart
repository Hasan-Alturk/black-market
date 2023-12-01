import 'package:black_market/app/core/model/coins.dart';
import 'package:black_market/app/core/model/ingots.dart';

class AlloyCoinResponse {
  List<Ingots>? ingots;
  List<Coins>? coins;

  AlloyCoinResponse({this.ingots, this.coins});

  AlloyCoinResponse.fromJson(Map<String, dynamic> json) {
    if (json['ingots'] != null) {
      ingots = <Ingots>[];
      json['ingots'].forEach((v) {
        ingots!.add(Ingots.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = <Coins>[];
      json['coins'].forEach((v) {
        coins!.add(Coins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ingots != null) {
      data['ingots'] = ingots!.map((v) => v.toJson()).toList();
    }
    if (coins != null) {
      data['coins'] = coins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
