jQuery(function() {
  return $('#app_org_name').autocomplete({
    source: $('#app_org_name').data('autocomplete-source')
  });
});