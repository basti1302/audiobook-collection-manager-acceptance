Feature: Display the list of audiobooks
  In order to know which audiobooks the collection contains
  As an audiobook enthusiast
  I want to see a list of all audiobooks

  Scenario: Display the list of all audiobooks in the collection
    Given some audiobooks in the collection
    When I visit the list of audiobooks
    Then I see the application name
    And I see all audiobooks
