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
}
