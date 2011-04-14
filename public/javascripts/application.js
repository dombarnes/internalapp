// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#adhoc_support_date").datepicker();
});
$(function() {
  $("#companies th a, #companies .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#companies_search input").keyup(function() {
    $.get($("#companies_search").attr("action"), $("#companies_search").serialize(), null, "script");
    return false;
  });
});