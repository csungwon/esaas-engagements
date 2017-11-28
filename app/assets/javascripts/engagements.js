jQuery(function() {
  return $('#engagement_org_name').autocomplete({
    source: $('#engagement_org_name').data('autocomplete-source')
  });
});

jQuery(function() {
  return $('#engagement_coach_name').autocomplete({
    source: $('#engagement_coach_name').data('autocomplete-source')
  });
});

jQuery(function() {
  return $('#engagement_contact_name').autocomplete({
    source: $('#engagement_contact_name').data('autocomplete-source')
  });
});