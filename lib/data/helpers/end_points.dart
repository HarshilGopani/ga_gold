class EndPoints {
  static String login = 'user/login';
  static String register = 'user/register';
  static String forgotpass = 'user/forgotpassword';
  static String getProfile = 'user/profile';

  static String postUploadProfile = 'user/profile';
  static String repairOrderList = 'user/repairingorders';
  static String getOneRepairOrder = 'user/repairingorders/getone';
  static String repairOrderImage = 'user/repairingorders/upload';
  static String uploadImage = 'user/upload';
  static String postRepairOrder = 'user/repairingorders/save';
  static String sampleOrderImage = 'user/sampleorders/upload';
  static String postSampleOrder = 'user/sampleorders/save';
  static String sampleOrderHistory = 'user/sampleorders';
  static String getOneSampleOrder = 'user/sampleorders/getone';
  static String postOrderHistory = 'user/orders/history';
  static String postOrderGetOne = 'user/orders/getone';
  static String postGetOnebag = 'user/bags/getone';
  static String postOrderCreate = 'user/orders/create';

  // Harshil Gopani
  static String getAllCategories = 'user/categories';
  static String postAllProduct = 'user/products';
  static String postAddToCart = 'user/cart/save';
  static String postGetAllCartProduct = 'user/cart';
  static String postCartProductRemove = 'user/cart/remove';
  static String postWishlist = 'user/wishlist';
  static String postWishlistAddRemove = 'user/wishlist/add';
}
