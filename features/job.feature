  Feature: Jobseeker visits the Home page
  In order to read the page
  As a viewer
  I want to see the home page of jobseeker

  Scenario: Fill out form
    Given I am on "\new_jobseekers"
    When I fill in "name" with "Johnny"
    And I fill in "email" with "johnny@oit.edu"
    And I fill in "password" with "johnny"
    And I fill in "password_confirmation" with "johnny"
    And I fill in "phonenumber" with "9284938492"
    And I fill in "skills" with "Java"
    And I fill in "resume" with "Java"
    Then I should see "Signed Up"
