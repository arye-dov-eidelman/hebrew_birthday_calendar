# Rails Project

## Requirements

1. Use the Ruby on Rails framework.
    - 🔸 ✔ no duh!

2. Your models must:

    - Include at least one has_many, at least one belongs_to, and at least one has_many :through relationship
      - 🔸 Calendar `has_many :events`, event `belongs_to :calendar`, a user `has_many :events, through: :calendars`
    - Include a many-to-many relationship with a model acting as a join table. That join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
      - 🔸 users have a many to many relationship with calendars through calendar_users which includes the access_level attribute

3. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
    - 🔸 year is between 1-7000
    - 🔸 month is a valid month-slug
    - 🔸 day is between 1-30
    - 🔸 calendar slug is unique
    - 🔸 all required strings are > 0 characters after being striped (profile username, calendar title)

4. You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
    - 🔸 `events.in_month(month_slug)`
    - 🔸 `events.on_day(day)`
    - 🔸 `events.on_date(month_slug, day)`

5. Your application must provide standard user authentication, including signup, login, logout, and passwords.
    - 🔸

6. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
    - 🔸

7. You must include and make use of a nested resource with the appropriate RESTful URLs.
    - You must include a nested new route with form that relates to the parent resource
      - 🔸 `/months/:month_slug/events/new`
      - 🔸 `/months/:month_slug/days/:day/events/new`
    - You must include a nested index or show route
      - 🔸 `/months/:month_slug/days/:day`

8. Your forms should correctly display validation errors. a. Your fields should be enclosed within a fields_with_errors class b. Error messages describing the validation failures must be present within the view.
    - 🔸

9. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

    - Logic present in your controllers should be encapsulated as methods in your models.
      - 🔸

    - Your views should use helper methods and partials when appropriate.
      - 🔸

    - Follow patterns in the Rails Style Guide and the Ruby Style Guide.
      - 🔸

10. Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
    - 🔸

## DataBase

- users
  - OmniAuth stuff
  - username
  - password-digest
- calendars
  - title
  - slug
- calendars_users
  - user_id
  - calendar_id
  - access_level [view, edit, admin]
- events
  - content
  - calendar_id
  - year
  - month_slug
  - day

## Models

```ruby
class User
  has_many :calendars_users
  has_many :calendars, through: :calendars_users

  scope -> editors => {}
  scope -> admins => {}
  scope -> viewers => {}

  def can_edit?(calendar)
  end
  
  def can_invite?(calendar)
  end
end

class Calendar
  has_many :calendars_users
  has_many :users, through: :calendars_users
  has_many :events
end

class CalendarUser
  belongs_to :calendar
  belongs_to :user
end

class Event
  belongs_to :calendar

  scope -> in_month(month_slug) => {}
  scope -> on_day(day) => {}
  scope -> on_date(month_slug, day) => {}
end
```

## Routes

```ruby
resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :calendars do
  resources :calendars_users , except: [:show]

  resources :events, except: :delete # the delete button should be on the day view

  # calendar#show sets current calendar and redirects to (or renders?) monthes/tishrei (or first month)
  resources :months, only: :show do
    resources :events, only: :new

    resources :days, only: :show do
      resources :events, only: :new
    end
  end
end


```

## Other

### Date helpers

```ruby
hebrew_year(year)
hebrew_month(month_slug)
hebrew_day(day)
hebrew_date(year, month_slug, day)
```

### Hebrew dates gem (not for use on mvp)

<https://rubygems.org/gems/hebrew_date>
<https://github.com/dorner/hebrew_date>
