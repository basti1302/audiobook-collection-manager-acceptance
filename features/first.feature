#encoding: utf-8

Feature: Showcase the simplest possible cucumber scenario
  In order to verify that cucumber is installed and configured correctly
  As an aspiring BDD fanatic 
  I should be able to run this scenario and see that the steps pass (green like a cuke)

  Scenario: Cutting vegetables
    Given a cucumber that is 30 cm long
    When I cut it in halves
    Then I have two cucumbers
    And both are 15 cm long
