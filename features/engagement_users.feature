Feature: engagement owns users working on that project / app
   As a staff who uses the app
   I want each engagement links to User objects
   So that I can easily assign students to an app

Background: Logged in
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
       | id | name  | github_uid      | email          | type_user     |
       | 1  | user1 | esaas_developer | test@user.com  | staff         |
       | 2  | user2 |                 | test1@user.com | student       |
       | 3  | user3 |                 | test2@user.com | coach         |
       | 4  | user4 |                 | test4@user.com | coach         |


   And I'm logged in on the orgs page
   And I follow "Apps"

Scenario: Can create an engagement with Team members
   #Story ID: #152298585
   Given I follow "app1"
   And I create a new engagement for "app1"
   Then I should see "Team members"
   And I select "user1 user2 user3" as Team members
   And I press "Save"
   Then I should see "2 errors prohibited Engagement from being saved:"

Scenario: Can create an engagement with Team members
   #Story ID: #152298585
   Given I follow "app1"
   And I create a new engagement for "app1"
   When I fill in the engagement fields as follows:
       | field                  | value      |
       | Team number            | Team1      |
       | Student names          | Student1   |
   And I select "user1 user2 user3" as Team members
   And I press "Save"
   Then I should see "Engagement was successfully created."
   And I should see "user1"

Scenario: Can update an engagement's team mumbers
   #Story ID: #152298585
   Given I follow "app1"
   And I create a new engagement for "app1"
   When I fill in the engagement fields as follows:
       | field                  | value      |
       | Team number            | Team1      |
       | Student names          | Student1   |
   And I select "user1 user2 user3" as Team members
   And I press "Save"
   Then I should see "Engagement was successfully created."
   And I want to edit the engagement for "Team1"
   Then I should see "Editing Engagement for app1"
   And I select "user1 user2 user4" as Team members
   And I press "Save"
   Then I should see "Engagement was successfully updated."