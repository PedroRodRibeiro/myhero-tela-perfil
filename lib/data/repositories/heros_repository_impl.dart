import 'package:heros/data/models/hero_model.dart';
import 'package:heros/domain/repositories/heros_repository.dart';
import 'package:heros/core/network/http_client.dart';

class HerosRepositoryImpl implements HerosRepository {
  final HttpClient httpClient;

  HerosRepositoryImpl(this.httpClient);

  @override
  Future<HeroModel> getHeros(String? id) async {
    try {
      final response = await httpClient.get('/$id');
      return HeroModel.fromJson(response);
    } catch (e) {
      throw Exception('Erro ao buscar herói');
    }
  }
}
