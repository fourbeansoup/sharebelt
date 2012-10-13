Feature:
  As a twitter user
  I want to sign in
  So that I can manage my account

  Scenario: Sign in to twitter
    When I visit the landing page
    Then I should see a twitter sign in button

  Scenario: Signed in to twitter
    Given I am signed in with twitter
    Then I should be on the sites screen
    And I should see "Add a site" button

