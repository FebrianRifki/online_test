import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  int? id;
  String? name;
  String? pageUrl;
  String? originalPageUrl;
  String? media;
  bool? isActive;
  int? orders;
  int? bannerVariantId;
  Map<String, dynamic>? variant;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.pageUrl,
      this.originalPageUrl,
      this.media,
      this.isActive,
      this.orders,
      this.bannerVariantId,
      this.variant,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  factory Product.getProduct(Map<String, dynamic> products) {
    return Product(
      id: products['id'],
      name: products['name'],
      pageUrl: products['page_url'],
      originalPageUrl: products['original_page_url'],
      media: products['media'],
      isActive: products['is_active'],
      orders: products['orders'],
      bannerVariantId: products['banner_variant_id'],
      variant: products['variant'],
      createdBy: products['created_by'],
      updatedBy: products['updated_by'],
      createdAt: products['created_at'],
      updatedAt: products['updated_at'],
    );
  }

  static Future<List<Product>> fetchProduct() async {
    var apiUrl = Uri.http('food.mockable.io', 'v1/banner');

    var result = await http.get(apiUrl);

    var jsonObject = jsonDecode(result.body);

    List<dynamic> listProduct = (jsonObject as Map<String, dynamic>)['data'];

    List<Product> products = [];
    for (var i = 0; i < listProduct.length; i++) {
      products.add(Product.getProduct(listProduct[i]));
    }
    return products;
  }
  // "id": 71,
  //           "name": "Small Banner 1",
  //           "page_url": "https://food.id/o/Barunmart/ringti-orijineol-remon-bogsunga-3O5biUJLQf",
  //           "original_page_url": "https://food.id/o/Barunmart/ringti-orijineol-remon-bogsunga-3O5biUJLQf",
  //           "media": "https://fdid.imgix.net/prod/1646913182122-SXBG5.jpg",
  //           "is_active": true,
  //           "orders": 0,
  //           "banner_variant_id": 3,
  //           "variant": {
  //               "id": 3,
  //               "name": "Small",
  //               "slug": "small",
  //               "created_at": "2021-10-18T04:19:51+07:00",
  //               "updated_at": "2021-10-18T04:19:51+07:00"
  //           },
  //           "created_by": 36284,
  //           "updated_by": 36284,
  //           "created_at": "2022-01-13T20:19:50+07:00",
  //           "updated_at": "2022-03-10T19:25:37+07:00"
}
