"use strict"; use(function () {
var CONST = {PROP_TITLE: "jcr:title", PROP_PAGE_TITLE: "pageTitle", CUSTOM_TITLE: "custom-title"}
var footer = {};
footer.text = granite.resource.properties[CONST.CUSTOM_TITLE]
|| wcm.currentPage.properties[CONST.PROP_PAGE_TITLE] || wcm.currentPage.properties[CONST.PROP_TITLE]
|| wcm.currentPage.name ;
return footer;});
