class Todomodel{
  String? id;
  String? Title;
  String? Description;
  bool? ischeck;
  Todomodel(this.Title,this.Description,this.ischeck,this.id);

  Todomodel.fromjson(Map<String,dynamic>json){
    id = json['id'];
    Title = json['Title'];
    Description = json['description'];
    ischeck = json['ischeck'];
  }
  Map<String,dynamic>toMap(){
    return{
      'id':id,'Title':Title,'description':Description,'ischeck':ischeck
    };
  }

}