Feature:
  As a sharebelt user
  I want to add and remove sites
  So that I can start getting more social sharing

  Background:
    Given I am signed in with twitter

  Scenario: Adding a site
    When I go to add a new site
    And input valid site information
    Then I should see "www.test.com" in my list of sites

  @wip
  Scenario: Only seeing my sites
    Given a site "www.notmysite.com" exists for another user
    When I go to the sites page
    Then I should not see "www.notmysite.com" in my list of sites
