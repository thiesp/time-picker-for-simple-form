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
    
### SCSS

```scss
@import 'time_wrapper';
```

This will `@import 'bootstrap-datetimepicker';` for you.

### JS

```
//= require time_wrapper
```

This will `//= require bootstrap-datetimepicker` for you.

## Usage

Given a datetime field named `time` use the following in simple form:

```erbruby
<%= f.input :time, as: :string, wrapper: :time %>
```

## Generate SCSS


    $ rails g time_wrapper:stylesheets


## Generate JS

    $ rails g time_wrapper:javascripts
