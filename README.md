== INTRODUCTION ==
Welcome to RxMagic! A basic web application meant to act as an inventory interface for pharmaceuticals.

== CURRENT ISSUES ==
1. Changing "png" back to "pdf"
* Most of the code is already there, but just in case a guide is here: https://github.com/shairontoledo/rghost/wiki/Converting-PDF-into-other-formats

2. Opening a new tab via redirect
* This is more difficult, but essentially use the redirect function I've built, but with "<meta http-equiv="refresh" content="5; URL=javascript:window.open('http://google.com','_parent');">" as a model (i.e. pass in the whole javascript as the URL with google replaced with the target)

3. Calendar
* I'm currently using this gem: https://github.com/Nerian/bootstrap-datepicker-rails but there is probably a better one...this RailsCast might be helpful: http://railscasts.com/episodes/213-calendars?view=asciicast

4. Public Activity
* The bootstrapping for the side bar requires some minor CSS fixes...this is in the html files themselves (use the "dispensed meds" views as a model). Inventory form seems to be one that isn't working...

5. Make automated fields hidden
* Example: http://stackoverflow.com/questions/16280341/hidden-field-in-rails-form

6. Expiration date is ONLY month/year
* I really hope you don't need to change the datatype (although this would require a migration)... A javascript example is here: http://stackoverflow.com/questions/4725187/jquery-datepicker-display-year-month-only check the documentation for whatever datepicker you end up using

7. Redirects for PAP/General inventory
* I have looked over this and do not immediately see why it isn't working. It might be worth scaffolding another table, but needs more analysis first (an error in the console might indicate another problem...)

8. User System
* https://www.railstutorial.org/book/modeling_users
* Americore (can't dispense), Pharmacist (basic applications), Admin (all applications) --> I recommend CanCan (https://github.com/sferik/rails_admin/wiki/Cancan) for this situation