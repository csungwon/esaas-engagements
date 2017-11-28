jQuery(function() {
  return $('#org_contact_name').autocomplete({
    source: $('#org_contact_name').data('autocomplete-source')
  });
});