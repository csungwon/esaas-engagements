Feature: after a user logins with their github id they are redirected to the page they wanted to view prior to login

  As a user who first opens the app
  So that I can efficiently login and browse the app
  I want to return to the page I requested to login

Background: users, orgs and apps have been added to database
  Given the following apps exist:
        | name  | description | org_id | status  |
        | app1  | test        | 1      | pending |
        | app2  | test        | 1      | pending |
        | app3  | test        | 1      | pending |

    And the following orgs exist:
        | name | contact_id |
        | org1 | 1          |
        | org2 | 1          |
        | org3 | 1          |

    And the following users exist:
        | name  | github_uid      | email         |
        | user1 | esaas_developer | test@user.com |
        | user2 |                 | test@user.com |
        | user3 |                 | test@user.com |


  And I am not logged in

Scenario: not logged in so should see login with Github from users page 
  Given I am on the users page
  Then I should see "Log in with GitHub"
 
Scenario: not logged in so should see login with Github from orgs page 
  Given I am on the orgs page
  Then I should see "Log in with GitHub"
  
Scenario: not logged in so should see login with Github from create page 
  Given I am on the create page
  Then I should be on the login page
  # Then I should see "Log in with GitHub"

Scenario: login with Github from orgs page and redirect to orgs
  Given I am not logged in
  And I am on the apps page
  And I follow "Orgs"
  And I follow "Log in with GitHub"
  Then I should be on the orgs page

Scenario: login with Github from users page and redirect to users
  Given I am not logged in
  And I am on the apps page
  And I follow "Users"
  #And I am visiting the provider "users"
  And I follow "Log in with GitHub"
  Then I should be on the users page

Scenario: login with Github from create page and redirect to create
  Given I am not logged in
  And I am on the apps page
  Given I follow "Create"
  And I follow "Log in with GitHub"
  Then I should be on the create page
  
Scenario: login with Github from create page, logout, login back and redirect to create
  Given I am not logged in
  And I am on the apps page
  And I follow "Create"
  And I follow "Log in with GitHub"
  And I am not logged in
  And I follow "Log in with GitHub"
  Then I should be on the create page
  
Scenario: login with Github from create page, after visiting orgs and users
  Given I am not logged in
  And I am on the apps page
  And I follow "Create"
  And I follow "Orgs"
  And I follow "Users"
  And I follow "Create"
  And I follow "Log in with GitHub"
  Then I should be on the create page