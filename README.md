# DecoratedAccessor

An experiment simplifying sharing state between Rails controllers and views when using Draper decorators.

This is similar to Draper's very own `decorates_assigned` which decorates assigned *instance variables* on render. This library provides controller accessors and does the same for them.

Based on [view_accessor](https://github.com/invisiblefunnel/view_accessor).

## Installation

Add this line to your application's Gemfile:

    gem 'decorated_accessor', github: 'mikekreeki/decorated_accessor'

And then execute:

    $ bundle

## Usage

Include it in your controller:

```ruby
class ApplicationController < ActionController::Base
  include DecoratedAccessor::Core
end
```

In controller assign the accessor:

```ruby
class UsersController < ApplicationController
  decorate :user

  def show
    self.user = User.find(1)
  end
end
```

DecoratedAccessor is designed to play nice with [draper](https://github.com/drapergem/draper) decorators (both single resource and collection decorators) wrapping the value in a decorator if the object responds to `#decorate`.

```ruby
# app/decorators/user_decorator.rb
class UserDecorator < Draper::Decorator
  def membership_status
    if subscribed?
      "Active membership"
    else
      "Inactive membership"
    end
  end
end

# app/views/users/show.html.slim
= user.membership_status
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
