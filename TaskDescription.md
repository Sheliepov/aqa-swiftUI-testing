## Greetings %username% !

This is a quick manual on what we expect from you during performing the test task.

This will be a simple app that contains two features: Login & Checklist.

* First of all, get to know with the application under test, build the test app and check out its possibilities and bugs. 

* Second of all, we need to evaluate your qa manual background, so create down below:
 - short testplan 
 - list of the testcases
 - list of discovered issues
 
* Third of all, write test automation according test automation purposes  

* And fourth of all, push the whole project to github.com and notice us with a link to your repo on completion. 

## Good Luck!
* p.s. Do not tamper codebase of application

#YOUR TASK STARTS HERE: 


# TEST PLAN: 

- What parts of app will be tested:

Test plan for an iOS app
1. Login Page:

Test Case 1: Attempt to login with correct credentials
    - Enter the correct email and password
    - Press "Login"
    - Verify that the login is successful and proceed to the next page
    
Test Case 2: Attempting to log in with incorrect credentials
    - Enter an incorrect email and/or password
    - Click "Login"
    - Verify that an error message is displayed or login is not successful
    
2. List Page (Tasks Page):

Test Case 3: Checking List Checkboxes
    - Verify that all product checkboxes can be selected and unselected
    - Verify that the state of the checkboxes is maintained after selection
Test Case 4: Checking the "Complete All" button
    - Press the "Complete All" button
    - Check that all checkboxes of the items become checked
    - Press "Cancel All" button
    - Check that all checkboxes are unchecked.
Test Case 5: Checking the "Sort By Name" button
    - Press the "Sort By Name" button
    - Check that the items in the list are sorted by name in alphabetical order
3.List Page (Sleep Page):

Test Case 6: Check List Checkboxes
    - Verify that all checkboxes in the list are selectable and unselectable
    - Verify that the state of the checkboxes is maintained after selection
    - Test Case 7: Checking the "Complete All" button

    - Press the "Complete All" button
    - Verify that all checkboxes in the list become checked
    - Press "Cancel All" button
    - Check that all checkboxes are unchecked.
Test Case 8: Checking the "Sort By Name" button
    - Press the "Sort By Name" button
    - Check that the items in the list are sorted by name in alphabetical order.

General Tests:

Test Case 9: Verify that the Complete All and Sort By Name buttons work on both pages
    - Click Complete All and Sort By Name on both pages
    - Verify that the functionality works correctly or find and describe bugs
Test Case 10: Switching between pages
    - Go from the first page to the second page, then from the second page to the first page
    - Check that the transitions are error-free

# LIST OF TEST CASES: 
// Only summaries of tests: e.g. 
- Perform login with empty password field

### Login Page
    - Check field email is displayed.
    - Check field password is displayed.
    - Check successful login with correct email and password.
### Login Page
    - Check login with both "email" and "password" fields empty.
    - Check login with a filled "email" field and an empty "password" field.
    - Check login with an empty "email" field and a filled "password" field.
    - Check successful login with correct email and password.
### Login Page
    - Сheck login with incorrect email and correct password
    - Check display of a pop-up window when an invalid email is entered
    - Check error message text in the pop-up window is correct
### Tasks Page
    - Check Tasks page is open.
    - Check Tasks title field is displayed.
    - Check the names of items in the checklist.
    - Check the number of items on the checklist.
    - Check the visibility of the Complete All button.
    - Check the visibility of the Sort By Name button.
    - Check that More Info icon is displayed.
    - Check that Logout button is displayed.
    - Check that Logout popup is open.
    - Logout title is displayed.
    - Logout title is correct.
    - Cansel button functionality
### Tasks Page
    - Check that checkboxes status is not selected.
    - Check that checkboxes are selected after clicking the Complete All button.
### Tasks Page
    - Check the visibility of the Cancel All button.
    - Check that checkboxes status is not selected.
    - Check that checkboxes are not selected after clicking the Cancell All button.
### Tasks Page
    - Check the visibility of the Sort By Name button.
    - Sort By Name button functionality.
### Tasks Page
    - First checkBox and verify selected.
### Tasks Page
    - Back button functionality.
### Sleep Page
    - Check Tasks page is open.
    - Check Tasks title field is displayed.
    - Check the names of items in the checklist.
    - Check the number of items on the checklist.
    - Check the visibility of the Complete All button.
    - Check the visibility of the Sort By Name button.
    - Check that More Info icon is displayed.
    - Check that Logout button is displayed.
    - Check that Logout popup is open.
    - Logout title is displayed.
    - Logout title is correct.
    - Cansel button functionality
### Sleep Page
    - Check that checkboxes status is not selected.
    - Check that checkboxes are selected after clicking the Complete All button.
### Sleep Page
    - Check the visibility of the Cancel All button.
    - Check that checkboxes status is not selected.
    - Check that checkboxes are not selected after clicking the Cancell All button.
### Sleep Page
    - Check the visibility of the Sort By Name button.
    - Sort By Name button functionality.
### Sleep Page
    - First checkBox and verify selected.
### Sleep Page
    - Back button functionality.

# LIST OF DISCOVERED ISSUES:
// Only summaries of bug reports: e.g.
- Login is possible with an empty "password" field (not a real issue).

1. Functionality "Complete All" button on the Tasks list page:
Issues with "Complete All" button (on the Tasks list page):
    - Clicking "Complete All" button on the "Tasks List" page does not always deselect the checkboxes upon repeated clicking (bug).
    - Clicking "Complete All" button may not check all checkboxes in the list (bug)
    - After clicking "Complete All" button, it does not change its state to "Cancel All" button (bug)
    - "Complete All" button may not work the first time (bug)
    
2. Functionality "Sort By Name" button on the Tasks list page:
Issues with "Sort By Name" button (on Tasks list page):
    - Clicking "Sort By Name" button on the "Tasks List" page does not always restore products to their original order upon repeated clicking (bug).
    - "Sort By Name" button works the same way as "Complete All" button after several clicks (bug)
    - "Sort By Name" button can sort the list without checkbox marks (bug)
    - "Sort By Name" button, when pressed, may not perform the sorting action at all (bug)
    
3. Functionality of checkboxes on the Tasks list page:
Issues with Checkboxes (on the Task list page):
    - When clicking on a checkbox from the list, the next item in the list, which is at the top, may be checked (bug)
    - Clicking on a checked checkbox may not uncheck it (bug)
    - When you click on a checkbox, it may not create a checkmark (bug)
    - Clicking on the checkbox may uncheck the top checkbox;
    - Clicking "Complete All" button on the Tasks list page marks all items on the next "Sort By Name" page (bug)
    
4. Functionality "Complete All" button on the Sleep list page:
Issues with "Complete All" button (on the Sleep list page):
    - Clicking "Complete All" button on the "Sleep List" page does not always deselect the checkboxes upon repeated clicking (bug).
    - Clicking "Complete All" button may not check all checkboxes in the list (bug)
    - After clicking "Complete All" button, it does not change its state to "Cancel All" button (bug)
    - "Complete All" button may not work the first time (bug)
    
5. Functionality "Sort By Name" button on the Sleep list page:    
Issues with "Sort By Name" button (on the Sleep list page):
    - Clicking the "Sort By Name" button on the "Sleep List" page does not always restore products to their original order upon repeated clicking (bug).
    - "Sort By Name" button, after several clicks, works as "Complete All" button functionality (bug)
    - "Sort By Name" button can sort the list without checkbox marks (bug)
    - "Sort By Name" button, when pressed, may not perform the sorting action at all (bug)
    
6. Functionality of checkboxes on the Sleep list page:
Issues with Checkboxes (on the Sleep list page):
    - When clicking on a checkbox from the list, the next item in the list, which is at the top, may be checked (bug)
    - Clicking on a checked checkbox may not uncheck it (bug)
    - Clicking on a checkbox may not uncheck it (bug)
    - Clicking on a checkbox may uncheck the top checkbox (bug)
    - Clicking "Complete All" button on the Tasks list page marks all items on the next "Sort By Name" page (bug)
