class ProductResponse {
  String? status;
  int? statusCode;
  Data? data;
  String? error;

  ProductResponse.withError(String errorMessage) {
    error = errorMessage;
  }

  ProductResponse({this.status, this.statusCode, this.data, this.error});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = Data.fromJson(json['data']);
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['data'] = this.data!.toJson();
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;

  bool? isActive;
  String? createdAt;
  String? updatedAt;

  String? seller;

  String? createdBy;

  List<int>? category;


  Data(
      {this.id,
        this.brand,
        this.image,
        this.charge,
        this.images,
        this.slug,
        this.productName,
        this.model,
        this.commissionType,
        this.amount,
        this.tag,
        this.description,
        this.note,
        this.embaddedVideoLink,
        this.maximumOrder,
        this.stock,
        this.isBackOrder,
        this.specification,
        this.warranty,
        this.preOrder,
        this.productReview,
        this.isSeller,
        this.isPhone,
        this.willShowEmi,

        this.isActive,
        this.createdAt,
        this.updatedAt,

        this.seller,

        this.createdBy,

        this.category,
        });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge =
    json['charge'] != null ? new Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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

    category = json['category'].cast<int>();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['image'] = this.image;
    if (this.charge != null) {
      data['charge'] = this.charge!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['product_name'] = this.productName;
    data['model'] = this.model;
    data['commission_type'] = this.commissionType;
    data['amount'] = this.amount;
    data['tag'] = this.tag;
    data['description'] = this.description;
    data['note'] = this.note;
    data['embadded_video_link'] = this.embaddedVideoLink;
    data['maximum_order'] = this.maximumOrder;
    data['stock'] = this.stock;
    data['is_back_order'] = this.isBackOrder;
    data['specification'] = this.specification;
    data['warranty'] = this.warranty;
    data['pre_order'] = this.preOrder;
    data['product_review'] = this.productReview;
    data['is_seller'] = this.isSeller;
    data['is_phone'] = this.isPhone;
    data['will_show_emi'] = this.willShowEmi;

    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    data['seller'] = this.seller;

    data['created_by'] = this.createdBy;

    data['category'] = this.category;

    return data;
  }
}

class Brand {
  String? name;
  String? image;
  Null? headerImage;
  String? slug;

  Brand({this.name, this.image, this.headerImage, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['header_image'] = this.headerImage;
    data['slug'] = this.slug;
    return data;
  }
}

class Charge {
  double? bookingPrice;
  double? currentCharge;

  double? sellingPrice;
  double? profit;
  bool? isEvent;

  bool? highlight;

  bool? groupping;

  bool? campaignSection;

  Charge(
      {this.bookingPrice,
        this.currentCharge,

        this.sellingPrice,
        this.profit,
        this.isEvent,

        this.highlight,

        this.groupping,
        this.campaignSection,
        });

  Charge.fromJson(Map<String, dynamic> json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];

    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];

    highlight = json['highlight'];

    groupping = json['groupping'];

    campaignSection = json['campaign_section'];
    ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_price'] = this.bookingPrice;
    data['current_charge'] = this.currentCharge;

    data['selling_price'] = this.sellingPrice;
    data['profit'] = this.profit;
    data['is_event'] = this.isEvent;

    data['highlight'] = this.highlight;

    data['groupping'] = this.groupping;

    data['campaign_section'] = this.campaignSection;

    return data;
  }
}

class Images {
  int? id;
  String? image;
  bool? isPrimary;
  int? product;

  Images({this.id, this.image, this.isPrimary, this.product});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_primary'] = this.isPrimary;
    data['product'] = this.product;
    return data;
  }
}