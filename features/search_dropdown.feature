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
  And the following apps exist:
        | name  | id | description | org_id | status  |
        | app1  | 1  | test        | 1      | pending |
        | app2  | 2  | test        | 1      | pending |
        | app3  | 3  | test        | 1      | pending |

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