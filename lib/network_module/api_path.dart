enum APIPath {
  //auth
  login,
  signup,
  logout,
  terms,
  get_User,
  //common
  //address
  get_Address,
  add_Address,
  remove_Address,
  //gst
  get_GST,
  add_GST,
  // settings
  add_ContactInfo,
  changePassword,
  //seller
  get_SellerLots,
  get_SoldLots,
  get_LotDetails,
  get_LotGrades,
  get_Qualities,
  get_Grades,
  get_SellerAuctionReport,
  get_AuctionReportMobile,
  //buyer
  get_PastAuctions,
  get_Live,
  get_AuctionLots,
  get_WonAuctions,
  get_WonLots,
  get_WonLotsMobile,
  set_AutoBid,
  get_AutoBid,
  get_CurrentAuctions,
  get_AuctionCurrLots,
  get_AuctionLot,
  post_Bid,
  show_Bids,
  show_BidsHistory,
  //wishlist
  wishlistAdd,
  getMyWishlist,
  getWishAuctions,
  removeWishlist,
  //support
  get_support,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      //auth
      case APIPath.terms:
        return "/phoneTerms";
        break;
      case APIPath.login:
        return "app/login";
        break;
      case APIPath.signup:
        return "app/register";
        break;
      case APIPath.logout:
        return "app/logout";
        break;
      //gst
      case APIPath.get_GST:
        return "getUserGST";
        break;
      case APIPath.add_GST:
        return "addGST";
        break;

      //address
      case APIPath.get_Address:
        return "getAddresses";
        break;
      case APIPath.add_Address:
        return "addAddress";
        break;
      case APIPath.remove_Address:
        return "deleteAddress";
        break;
      //settings
      case APIPath.add_ContactInfo:
        return "addContactInfo";
        break;
      case APIPath.get_User:
        return "getUser";
        break;
      case APIPath.changePassword:
        return "changePassword";
        break;
      //seller
      case APIPath.get_SellerLots:
        return "getSellerLots";
        break;
      case APIPath.get_SoldLots:
        return "getSoldLots";
        break;
      case APIPath.get_LotDetails:
        return "getLotDetails";
        break;
      case APIPath.get_LotGrades:
        return "getLotGrades";
        break;
      case APIPath.get_Grades:
        return "getGrades";
        break;
      case APIPath.get_Qualities:
        return "getQualities";
        break;
      case APIPath.get_SellerAuctionReport:
        return "getSellerAuctionReport";
        break;
      case APIPath.get_AuctionReportMobile:
        return "getSellerAuctionReportMobile";
        break;
      //buyer
      case APIPath.get_Live:
        return "showCurrAuctionLot";
        break;
      case APIPath.get_AuctionCurrLots:
        return "getAuctionCurrLots";
        break;
      case APIPath.get_PastAuctions:
        return "getPastAuctions";
        break;
      case APIPath.get_AuctionLots:
        return "getAuctionLots";
        break;
      case APIPath.get_WonAuctions:
        return "getWonAuctions";
        break;
      case APIPath.get_WonLots:
        return "getWonLots";
        break;
      case APIPath.get_WonLotsMobile:
        return "getWonLotsMobile";
        break;
      case APIPath.get_AutoBid:
        return "getAutoBid";
        break;
      case APIPath.set_AutoBid:
        return "setAutoBid";
        break;
      case APIPath.get_CurrentAuctions:
        return "getCurrentAuctions";
        break;
      case APIPath.get_AuctionLot:
        return "getAuctionLot";
        break;
      case APIPath.post_Bid:
        return "postBid";
        break;
      case APIPath.show_Bids:
        return "showBids";
        break;
      case APIPath.show_BidsHistory:
        return "showBidsHistory";
        break;
      //wishlist
      case APIPath.wishlistAdd:
        return "wishlistAdd";
        break;
      case APIPath.getMyWishlist:
        return "getMyWishlist";
        break;
      case APIPath.removeWishlist:
        return "removeWishlist";
        break;
      case APIPath.getWishAuctions:
        return "getWishAuctions";
        break;
      //support
      case APIPath.get_support:
        return "raiseToken";
        break;
      default:
        return "/login";
    }
  }
}
