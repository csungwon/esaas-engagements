Feature: after a user logins with their github id they are redirected to the page they wanted to view prior to login

  As a user who first opens the app
  So that I can efficiently login and browse the app
  I want to return to the page I requested to login

Background: users, orgs and apps have been added to database

  Given I am not logged in

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
  Given I am on the apps page
  And I follow "Orgs"
  And I follow "Log in with GitHub"
  #And I am signed in with provider "GitHub"
  Then I should be on the orgs page
  
Scenario: login with Github from users page and redirect to users
  Given I am not logged in
  And I am on the apps page
  And I follow "Users"
  And I follow "Log in with GitHub"
  Then I should be on the users page

Scenario: login with Github from create page and redirect to create
  Given I follow "Create"
  And I follow "Log in with GitHub"
  Then I should be on the create page
  
  
# Started GET "/auth/github" for 136.152.142.38 at 2017-10-30 02:44:12 +0000

# Started GET "/auth/github/callback" for 136.152.142.38 at 2017-10-30 02:44:12 +0000
# Cannot render console from 136.152.142.38! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by SessionController#create as HTML
# Started GET "/orgs" for 136.152.142.38 at 2017-10-30 02:44:12 +0000

# Started GET "/login" for 136.152.142.38 at 2017-10-30 02:43:23 +0000
# Cannot render console from 136.152.142.38! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by SessionController#login

# simple intergration test cucumber

# Started GET "/users" for 169.229.14.199 at 2017-10-30 22:12:51 +0000
# Cannot render console from 169.229.14.199! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by UsersController#index as HTML
#   User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" IS NULL  ORDER BY name LIMIT 1
# Redirected to https://cs169-kyriakipapadimitriou.c9users.io/login
# Filter chain halted as :logged_in? rendered or redirected
# Completed 302 Found in 14ms (ActiveRecord: 0.6ms)


# Started GET "/login" for 169.229.14.199 at 2017-10-30 22:12:51 +0000
# Cannot render console from 169.229.14.199! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by SessionController#login as HTML
#   Rendered session/login.html.haml within layouts/application (5.6ms)
#   Rendered layouts/_nav_header.html.haml (0.6ms)
#   Rendered shared/_flash_messages.html.haml (0.1ms)
# Completed 200 OK in 54ms (Views: 53.9ms | ActiveRecord: 0.0ms)


# Started GET "/auth/github" for 169.229.14.199 at 2017-10-30 22:13:17 +0000
# Cannot render console from 169.229.14.199! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255


# Started GET "/auth/github/callback" for 169.229.14.199 at 2017-10-30 22:13:17 +0000
# Cannot render console from 169.229.14.199! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by SessionController#create as HTML
#   Parameters: {"provider"=>"github"}
#   User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."github_uid" = ?  ORDER BY name LIMIT 1  [["github_uid", "esaas_developer"]]
# Redirected to https://cs169-kyriakipapadimitriou.c9users.io/users
# Completed 302 Found in 8ms (ActiveRecord: 0.6ms)


# Started GET "/users" for 169.229.14.199 at 2017-10-30 22:13:17 +0000
# Cannot render console from 169.229.14.199! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by UsersController#index as HTML
#   User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ?  ORDER BY name LIMIT 1  [["id", 149]]
#   User Load (1.5ms)  SELECT "users".* FROM "users"  ORDER BY name
#   Rendered users/index.html.haml within layouts/application (42.1ms)
#   Rendered layouts/_nav_header.html.haml (1.2ms)