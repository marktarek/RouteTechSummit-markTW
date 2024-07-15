class GetViewProductListModel{

  List<ProductsListModel> dataProductsList;
  int total;
  int skip;
  int limit;

  GetViewProductListModel({
    required this.dataProductsList,
    required this.total,
    required this.skip,
    required this.limit,
});

  factory GetViewProductListModel.fromJson(Map<dynamic, dynamic> json){
    return GetViewProductListModel(
        dataProductsList: json["products"] != null
            ? (json["products"] as List)
            .map((json) => ProductsListModel.fromJson(json))
            .toList()
            : [],
        total: json["total"]??0,
        skip: json["skip"]??0,
        limit: json["limit"]??0
    );
  }
}

class ProductsListModel{
  int id;
  String title;
  String description;
  String category;
  double price;
  String discountPercentage;
  double rating;
  int stock;
  List<dynamic> images;
  String thumbnail;

  ProductsListModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.images,
    required this.thumbnail,
});

  factory ProductsListModel.fromJson(Map<dynamic,dynamic>json){
  return  ProductsListModel(
        id: json["id"]??0,
        title: json["title"]??'',
        description: json["description"]??'',
        category: json["category"]??'',
        price: json["price"]??0.0,
        discountPercentage: json["discountPercentage"] != null ? json["discountPercentage"].toString():'',
        rating: json["rating"]??0.0,
        stock: json["stock"]??0,
        images: json["images"]??[],
        thumbnail: json["thumbnail"]??'',
    );
  }

}