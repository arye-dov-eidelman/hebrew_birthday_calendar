# Rails project prep - Hebrew Birthday Calendar

## Checklist

- A summary of the application

  A shared birthday calendar following the jewish (lunar) calendar. Where you can create shared calendars with birthdays and other events, browse by month/day.

- What will your models and associations be and why? You will need a has_many and belongs_to relationship as well as a many to many relationship.

  - A calendar has many events.
  - Events belongs to a calendar.
  - Users have a many to many relationship with calendars.

- How will you implement a user submittable attribute on the join table of the many to many relationship?

  - The join table CalendarUser has an access_level attribute, which can be view, edit, or admin.

- What it is an ActiveRecord scope method and what is your implementation plan?

  - A method that adds sql to the select statement. (often a where clause.)

  ```ruby
  class User
    scope -> editors => {}
    scope -> admins => {}
    scope -> viewers => {}
  end

  class Event
    scope -> in_month(month_slug) => {}
    scope -> on_day(day) => {}
    scope -> on_date(month_slug, day) => {}
  end
  ```

- What validations will you have for your models?

  - Year is between 1-9999.
  - Month is a valid month-slug.
  - Day is between 1-30.
  - Calendar slug is unique.
  - All required strings are > 0 characters after being stripped.

- How will you implement an authentication system?

  - using bcrypt (has_secure_password)

  - to verify email addresses I will:

    - use ActionMailer to send verification emails. or
    - when admins invites a member I will provide a one time code for the new user to sign up if they don't already have an account

- What 3rd party login service will you use?

  - Facebook or google

- With the way your models are setup what nested routes will you use to meet the requirement?

  - `/months/:month_slug/events/new`
  - `/months/:month_slug/days/:day/events/new`
  - `/months/:month_slug/days/:day`
