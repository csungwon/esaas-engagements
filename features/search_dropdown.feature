Feature: when creating an app, the orgs dropdown should be searchable
As a user of the app
So that I do not have to look through a long list of dropdown menu
I want to do a string matching within the dropdown menu

Background: user and orgs have been added to database
  And the following orgs exist:
        | id | name     | contact_id |
        | 1  | Berkeley | 1          |
        | 2  | Stanford | 2          |
        | 3  | org3     | 3          |
        | 4  | org4     | 4          |

  And the following users exist:
        | name              | id | github_uid      | email          |
        | user1             | 1  | esaas_developer | test1@user.com |
        | user2             | 2  |                 | test2@user.com |
        | cal student       | 3  |                 | test3@user.com |
        | stanford student  | 4  |                 | test4@user.com |

  And I'm logged in on the orgs page
  
@javascript
Scenario: I can search the dropdown list of orgs when creating a new app
  # Story ID: 153069853
  Given I am on the new app page
  When I type in "org" into autocomplete list "app[org_name]"
  Then I should see "org3" in the autocomplete list "app[org_name]"
  Then I should see "org4" in the autocomplete list "app[org_name]"
  Then I should not see "Berkeley" in the autocomplete list "app[org_name]"
  Then I should not see "Stanford" in the autocomplete list "app[org_name]"

@javascript
Scenario: I can search the dropdown list of users when creating a new org
  # Story ID: 153069853
  #Given I am on the new org page
  #When I type in "stu" into autocomplete list "org[contact_name]"
  #Then I should see "cal student" in the autocomplete list "org[contact_name]"
  #Then I should see "stanford student" in the autocomplete list "org[contact_name]"
  #Then I should not see "user1" in the autocomplete list "org[contact_name]"
  #Then I should not see "user2" in the autocomplete list "org[contact_name]"
  Given I am on the new org page
  When I type in "u" into autocomplete list "org[contact_name]"
  Then I should see "user2" in the autocomplete list "org[contact_name]"
  Then I should not see "cal student" in the autocomplete list "org[contact_name]"
  Then I should not see "stanford student" in the autocomplete list "org[contact_name]"

#Scenario: I can still create a new app as usual with this new feature added
#  # Story ID: 153069853
#  Given I am on the new app page
#  When I fill in "App Name" with "Fake app"
#  When I fill in "App Description" with "Fake app description"
#  When I fill in "Deployment url" with "Fake app deployment url"
#  When I fill in "Repository url" with "Fake app repository"
#  When I fill in "app[org_name]" with "org1"
#  And I press "Save"
#  Then I should be on the apps page
#  And I should see "App was successfully created."
#
#Scenario: I can still create a new org as usual with this new feature added
#  # Story ID: 153069853
#  Given I am on the new org page
#  And I fill in "Org Name" with "fakeorg"
#  When I fill in "org[contact_name]" with "user1"
#  Then I press "Save"
#  Then I should be on the orgs page
#  Then I should see "Org was successfully created."
