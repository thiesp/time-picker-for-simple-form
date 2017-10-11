# TimeWrapper

Time wrapper is a simple form integration of `gem bootstrap3-datetimepicker-rails`. With a simple form wrapper `:time`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_wrapper

### Setup dependencies
* bootstrap
* momentjs-rails
* font-awesome-rails
* simple_form
    
### In application.scss

```scss
@import 'time_wrapper';
```

This will `@import 'bootstrap-datetimepicker';` for you.

### In application.js

```
//= require time_wrapper
```

This will `//= require bootstrap-datetimepicker` for you.

## Usage

Given a datetime field named `time` use the following in simple form:

```erbruby
<%= f.input :time, as: :string, wrapper: :time %>
```

To get proper setter and getters, as well as basic format validation (you probably want to add your own) use the following in you model:

```ruby
time_attribute :time
```

## Generate stylesheets

If you want to customize the stylesheets.

    $ rails g time_wrapper:stylesheets


## Generate javascripts

If you want to customize the javascripts.

    $ rails g time_wrapper:javascripts
