jQuery(function() {
  return $('#org_contact_name').autocomplete({
    source: $('#org_contact_name').data('autocomplete-source')
  });
});


// problem: only get list of items when you type SOMETHING.. lol
//  should just make org contact REQUIRED... bc on orgs page it lists the contacts email.
//  org: contact can't be blank
// engagement: Coaching org and coach required (also add contact required?)
//  do i just need validates :contact? what are the differences between all validates stuff
// sean says validates presence