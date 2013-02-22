Feature: Display details about an audiobook
  In order to know everything about a particular audiobook
  As an audiobook enthusiast
  I want to see the details of an audiobook

  Scenario: Go to the details page of an audiobook
    Given some audiobooks in the collection
    When I visit the list of audiobooks
    And click on "Coraline"
    Then I see the details page for "Coraline"
