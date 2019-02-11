Feature: MediumScraper
  In order to portray or pluralize food
  As a CLI
  I want to be as objective as possible

  Scenario: Posts by User
    When I run `mediumscraper user jinghua.shih`
    Then the output should be an Array

  Scenario: Post by Url 
    When I run `mediumscraper url https://medium.com/@jinghua.shih/container-%E6%A6%82%E5%BF%B5%E7%AD%86%E8%A8%98-b0963ae2d7c6`
    Then the output should be an Array