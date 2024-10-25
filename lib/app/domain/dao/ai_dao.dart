import 'dart:convert';
import 'package:dio/dio.dart';
import '../dao/ai_dao_constants.dart';
import '../model/post.dart';
import '../business/ai_business.dart';

class AiDao implements AiBusiness {
  @override
  Future<String> getAiResponse(String input) async {
    try {
      Map<String, String> body = {'model': 'llama3', 'prompt': input};

      Response response = await Dio().post(llamaApiUrl,
          data: body, options: Options(responseType: ResponseType.json));

      List<String> data = (response.data).toString().split('\n');
      data.removeLast(); //tem um bug na api

      String output =
          data.map((e) => jsonDecode(e)['response']).toList().join('').trim();

      return output;
    } catch (e) {
      throw Exception('Não foi possível fazer um prompt: $e');
    }
  }

  Future<Post> createNewPost(String prompt) async {
    try {
      Map<String, dynamic> response = jsonDecode(await getAiResponse(prompt));

      print(response);

      return Post(
          userSurname: response['userSurname']!, message: response['message']!);
    } catch (e) {
      throw Exception('Não foi possível criar um novo post: $e');
    }
  }
}
