import '../domain/model/post.dart';
import '../domain/service/ai_service.dart';

class HomeScreenVielmodel{

  AiService aiService = AiService();

  List<Post> _posts = [];
  
  Future<List<Post>> addNewAiPost ()async{
    _posts.add(await aiService.createNewPost());
    return _posts;
  }

  List<Post> get posts => _posts;

}