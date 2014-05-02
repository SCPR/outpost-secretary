# Outpost/Secretary

[secretary-rails](http://rubygems.org/gems/secretary-rails) integration with Outpost.
Provides views and controller for Outpost.

## Installation

Add this line to your application's Gemfile:

    gem 'outpost-secretary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install outpost-secretary

## Usage

If you already have secretary-rails installed and configured, then all you need to do is add this to your routes about the "outpost" namespace (the "secretary" name is hardcoded and not optional):

```ruby
# ...
mount Outpost::Secretary::Engine, at: "outpost", as: "secretary"

namespace :outpost do
  #...
end
```

And add the stylesheet to your outpost/application.css:

```scss
@import 'outpost/secretary';
```

Finally, be sure to add `logged_user_id` to your Strong Parameters where necessary.

If Secretary isn't yet installed, check out the [secretary-rails documentation](https://github.com/SCPR/secretary-rails) for instructions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
