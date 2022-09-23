class SearchResponse {
  SearchResponse({
    required this.status,
    required this.data,
  });
  late final String status;
  late final Data data;
  String? error;
  SearchResponse.withError(String errorMessage) {
    error = errorMessage;
  }

  SearchResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.categories,
    required this.products,
  });
  late final List<dynamic> categories;
  late final Products products;

  Data.fromJson(Map<String, dynamic> json){
    categories = List.castFrom<dynamic, dynamic>(json['categories']);
    products = Products.fromJson(json['products']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories;
    _data['products'] = products.toJson();
    return _data;
  }
}

class Products {
  Products({
    required this.count,


    required this.results,
  });
  late final int count;


  late final List<Results> results;

  Products.fromJson(Map<String, dynamic> json){
    count = json['count'];


    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;


    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.brand,
    required this.image,
    required this.charge,
    required this.images,
    required this.slug,
    required this.productName,
    required this.model,
    required this.commissionType,
    required this.amount,
    required this.tag,
    required this.description,
    required this.note,
    required this.embaddedVideoLink,
    required this.maximumOrder,
    required this.stock,
    required this.isBackOrder,
    required this.specification,
    required this.warranty,
    required this.preOrder,
    required this.productReview,
    required this.isSeller,
    required this.isPhone,
    required this.willShowEmi,

    required this.isActive,
    required this.createdAt,
    required this.updatedAt,

    required this.seller,

    required this.createdBy,

    required this.category,
    required this.relatedProduct,
    required this.filterValue,
  });
  late final int id;
  late final Brand brand;
  late final String image;
  late final Charge charge;
  late final List<Images> images;
  late final String slug;
  late final String productName;
  late final String model;
  late final String commissionType;
  late final String amount;
  late final String tag;
  late final String description;
  late final String note;
  late final String embaddedVideoLink;
  late final int maximumOrder;
  late final int stock;
  late final bool isBackOrder;
  late final String specification;
  late final String warranty;
  late final bool preOrder;
  late final int productReview;
  late final bool isSeller;
  late final bool isPhone;
  late final bool willShowEmi;

  late final bool isActive;
  late final String createdAt;
  late final String updatedAt;

  late final String seller;

  late final String createdBy;

  late final List<int> category;
  late final List<dynamic> relatedProduct;
  late final List<dynamic> filterValue;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    brand = Brand.fromJson(json['brand']);
    image = json['image'];
    charge = Charge.fromJson(json['charge']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];

    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    seller = json['seller'];

    createdBy = json['created_by'];

    category = List.castFrom<dynamic, int>(json['category']);
    relatedProduct = List.castFrom<dynamic, dynamic>(json['related_product']);
    filterValue = List.castFrom<dynamic, dynamic>(json['filter_value']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['brand'] = brand.toJson();
    _data['image'] = image;
    _data['charge'] = charge.toJson();
    _data['images'] = images.map((e)=>e.toJson()).toList();
    _data['slug'] = slug;
    _data['product_name'] = productName;
    _data['model'] = model;
    _data['commission_type'] = commissionType;
    _data['amount'] = amount;
    _data['tag'] = tag;
    _data['description'] = description;
    _data['note'] = note;
    _data['embadded_video_link'] = embaddedVideoLink;
    _data['maximum_order'] = maximumOrder;
    _data['stock'] = stock;
    _data['is_back_order'] = isBackOrder;
    _data['specification'] = specification;
    _data['warranty'] = warranty;
    _data['pre_order'] = preOrder;
    _data['product_review'] = productReview;
    _data['is_seller'] = isSeller;
    _data['is_phone'] = isPhone;
    _data['will_show_emi'] = willShowEmi;

    _data['is_active'] = isActive;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;

    _data['seller'] = seller;

    _data['created_by'] = createdBy;

    _data['category'] = category;
    _data['related_product'] = relatedProduct;
    _data['filter_value'] = filterValue;
    return _data;
  }
}

class Brand {
  Brand({
    required this.name,
    required this.image,
    this.headerImage,
    required this.slug,
  });
  late final String name;
  late final String image;
  late final Null headerImage;
  late final String slug;

  Brand.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
    headerImage = null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['image'] = image;
    _data['header_image'] = headerImage;
    _data['slug'] = slug;
    return _data;
  }
}

class Charge {
  Charge({
    required this.bookingPrice,
    required this.currentCharge,
    required this.isEvent,

    required this.highlight,

    required this.groupping,

    required this.campaignSection,

  });
  late final double bookingPrice;
  late final double currentCharge;



  late final bool isEvent;

  late final bool highlight;

  late final bool groupping;

  late final bool campaignSection;


  Charge.fromJson(Map<String, dynamic> json){
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];



    isEvent = json['is_event'];

    highlight = json['highlight'];

    groupping = json['groupping'];

    campaignSection = json['campaign_section'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['booking_price'] = bookingPrice;
    _data['current_charge'] = currentCharge;



    _data['is_event'] = isEvent;

    _data['highlight'] = highlight;

    _data['groupping'] = groupping;

    _data['campaign_section'] = campaignSection;

    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });
  late final int id;
  late final String image;
  late final bool isPrimary;
  late final int product;

  Images.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['is_primary'] = isPrimary;
    _data['product'] = product;
    return _data;
  }
}