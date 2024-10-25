import '../dao/ai_dao.dart';
import '../model/post.dart';

class AiService {
  final AiDao _aiDao = AiDao();

  Future<Post> createNewPost() async{
    String aiCreatePostPrompt = 'CRIE UM OBJETO JSON E ME MANDE APENAS O OBJETO JSON SEM TEXTO ADICIONAL, ELE DEVE CONTER UM CAMPO userSurname(USE UM NOME QUALQUER) E UM CAMPO message(preencha com uma mensagem em portugues que as pessoas usam em rede social)';
    return _aiDao.createNewPost(aiCreatePostPrompt);
  }
}