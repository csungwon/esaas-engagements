@wip
Feature: User can add a profile picture that shows up in User details page/comments
	As a user of the app
	So that I can easily communicate with other users
	I want to be able to upload a profile picture and see it on the users page

Background:
	Given the following images exist:
		| file_path                              |
		| features/upload_files/ArmandoFox.png   |
		| features/upload_files/AdnanHemani.jpg  |
		| features/upload_files/_default.png     |
		| features/upload_files/randomImage.gif  |
		| features/upload_files/notanimage.txt   |
		| features/upload_files/notjsagain.js    |
		| features/upload_files/haterspec.rb     |

	And the following users exist:
		| name            | github_uid      | email                         |
		| ESaaS Developer | esaas_developer | esaas_developer@saasbook.info |
		| Armando Fox     | armandofox      | fox@berkeley.edu              |
		| Adnan Hemani    | adnanhemani     | adnan.h@berkeley.edu          |

	And the follwing orgs exist:
		| name                     | contact_id |
		| UC Berkeley CS169        | 3          |
		| Armando's Secret Society | 2          |

	And the following apps exist:
		| name      | description | status  |
		| AFX Dance | good stuff  | pending |

	And I am logged in
	And I follow "Users" within "#nav_header"

# Story ID: 153069541
Scenario: Each user has a default profile image
	When I follow "Armando Fox"
	Then I should find an image with alternate text "Missing medium"
	When I follow "Users" within "#nav_header"
	And I follow "Adnan Hemani"
	Then I should find an image with alternate text "Missing medium"

# Story ID: 153069541
Scenario: Each user can upload a image by local file
	When I follow "Armando Fox"
	And I follow "Edit User"
	Then I should see "Upload Profile Image"
	When I attach the file "features/upload_files/ArmandoFox.png" to "Upload Profile Image"
	And I press "Save"
	And I follow "Armando Fox"
	Then I should find an image with alternate text "Armandofox"

# Story ID: 153069541
Scenario: User can upload a valid image file (happy path)
	When I follow "Armando Fox"
	And I follow "Edit User"
	When I attach the file "features/upload_files/randomImage.gif" to "Upload Profile Image"
	And I press "Save"
	And I follow "Armando Fox"
	Then I should find an image with alternate text "Randomimage"

# Story ID: 153069541
Scenario: User cannot upload an invalid image file (sad path)
	When I follow "Armando Fox"
	And I follow "Edit User"
	When I attach the file "features/upload_files/notanimage.txt" to "Upload Profile Image"
	And I press "Save"
	Then I should see "Profile picture content type is invalid"

	When I attach the file "app/assets/images/notjsagain.js" to "Upload Profile Image"
	And I press "Upload Image"
	Then I should see "Not a valid image file"

	When I attach the file "app/assets/images/haterspec.rb" to "Upload Profile Image"
	And I press "Upload Image"
	Then I should see "Not a valid image file"

# Story ID: 153069541
Scenario: User profile picture is also shown on comments
	Given the user "Armando Fox" has a profile image "app/assets/images/ArmandoFox.png"
	And I go to the app details page for "AFX Dance"
	When I fill in "Write a comment..." with "AFX Dance is awesome!"
	And I press "Post"
	Then I should find an image with alternate text "Armandofox"
