# CucumberRubySeleniumExample
UI Acceptance **automated testing** example, using **Cucumber** + **Ruby** + **Selenium**.   

Guerrilla Mail - Disposable Temporary E-Mail Address   
Avoid spam and stay safe - use a disposable email address!   
The following UI Acceptance test scenario is used to test [Guerrilla Mail website] (https://www.guerrillamail.com/):   
```
Feature: As a user, I wish to generate a temporary email and use it

  Scenario: Generate temporary email and send email to self
    Given I generated a new email
    When I send a new email to self
    Then I can see the new email in the inbox
```

## Requirements
*Ruby 2.0.0p657 (may work in later version too)  
Install bundler gem:   
```
gem install bundler
```

*WebDriver   
Find it [here](http://www.seleniumhq.org/download/)   
Download the target one and save it somewhere in your file system    

## Supported architectures  
* Windows   
* Mac   
* Linux   

## Supported browsers   
* Chrome     
* Firefox   
* IE   
* Edge   

## How to use    
Using the command-line, navigate to the project's root directory and run:   
*Install dependencies*   
```
bundle install
```
*Default browser dimensions are 1080Wx720H*   
```
cucumber BROWSER=TARGETBROWSER [WIDTH=TARGETWIDTH HEIGHT=TARGETHEIGHT] DRIVER_PATH=TRAGETDRIVERPATH
```
Example:   
```
cucumber BROWSER=chrome WIDTH=1440 HEIGHT=900 DRIVER_PATH=driver/chrome/chromedriver.exe
```
BROWSER   
```
chrome | firefox | ie | edge   
```
## References
* [Cucumber] (https://cucumber.io/)
* [Selenium] (http://www.seleniumhq.org/)
* [Ruby Doc] (http://www.rubydoc.info/gems/selenium-webdriver/0.0.28/Selenium/WebDriver)
