part of anitube_crawler_api;

class ItemParser {
  
  static Map<String, dynamic> parseItem(Element itemElement, String divImageClassName,
      String closedCaptionClassName) {
    
    var pageLink = itemElement.children[0].attributes['href'];
        var title = itemElement.children[0].attributes['title'];
        var id = pageLink.split('.site/')[1];

        id = id.substring(0, id.length-1);

        var itemImgDiv = itemElement.children[0]
        //divImageClassName
        .getElementsByClassName(divImageClassName)[0];

        var imageUrl = itemImgDiv.getElementsByTagName('img')[0].attributes['src'];
        /// closedCaptionClassName
        var cc = itemImgDiv.getElementsByClassName(closedCaptionClassName)
          [0].text;

    return {
      Item.ID : id,
      Item.TITLE : title,
      Item.PAGE_URL : pageLink,
      Item.IMAGE_URL : imageUrl,
      Item.CC : cc,
    };
  }
}