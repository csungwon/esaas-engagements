Feature: Have User support Student and Staff types
    As a developer
    So that I can differentiate between student and staff among Users
    I want Users to be categorized into types

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
        | name  | github_uid      | email         |
        | user1 | esaas_developer | test@user.com |
        | user2 |                 | test@user.com |
        | user3 |                 | test@user.com |

    And I'm logged in on the orgs page
    And I follow "Users"

Scenario: Can create a User with a type: student or staff:
    Given I follow "New User"
    Then I should see "Type"
    And I should see "SID"

Scenario: Users page should display type and id information:
    Then I should see "Type"
    And I should see "SID"

Scenario: Can create a User as a student with SID:
    Given I follow "New User"
    When I fill in the fields as follows:
        | field               | value      |
        | User Name           | fake name  |
        | User E-mail address | fake addr  |
        | Type of user        | Student    |
        | SID                 | 11111111   |
    And I press "Save"
    And I should be on the users page
    And I should see "fake name" has type "Student"
    And I should see "fake name" has SID "11111111"

Scenario: Can create a User that is a Staff:
    Given I follow "New User"
    When I fill in the fields as follows:
        | field                  | value      |
        | User Name              | fake name  |
        | User E-mail address    | fake addr  |
        | Type of user           | Staff      |
    And I press "Save"
    And I should be on the users page
    And I should see "fake name" has type "Staff"

Scenario: Edit form for Users has Type and SID fields:
    Given I press "Edit" for "user2"
    Then I should see "Type"
    And I should see "SID"

Scenario: Can edit Users to add Type and SID:
    Given I press "Edit" for "user2"
    When I fill in the following:
        | Type                   | Student    |
        | SID                    | 0          |
    And I press "Save"
    And I should be on the users page
    And I should see "user2" has type "Student"
    And I should see "user2" has SID "0"

# Add tests for create