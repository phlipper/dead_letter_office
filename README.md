# Dead Letter Office

[![Build Status](https://secure.travis-ci.org/phlipper/dead_letter_office.png?branch=master)](http://travis-ci.org/phlipper/dead_letter_office) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/phlipper/dead_letter_office)

[![Dead Letter Office](https://img.skitch.com/20120712-fbycp3kf5yhupq6txnaucknc3d.png)](http://phlippers.net/dead_letter_office)


## Description

This project implements a [Dead letter office](https://en.wikipedia.org/wiki/Dead_letter_office) (mail recovery center) as an engine for your Rails 3 application. Undeliverable emails which raise exceptions will be logged to the database and can be viewed via a mountable web interface.


## Requirements

### Supported Platforms

Dead letter office is currently being developed against the following stack:

**Ruby**

* Ruby 1.9.2
* Ruby 1.9.3
* ~~JRuby 1.6+ (1.9 mode)~~ (passes locally, fails on [Travis CI](http://travis-ci.org/#!/phlipper/dead_letter_office))
* ~~Rubinius 2.0 (1.9 mode)~~ (I am anxiously awaiting passable 1.9 support)

**Rails**

* Rails 3.2.x

It is possible that this may work on older versions of Rails. I do not have any plans to support older versions of Ruby.


## Installation

* Add `dead_letter_office` to your Gemfile

```ruby
gem "dead_letter_office"
```

* Run `bundle`
* Copy the migrations and prepare your databases:

```
rake dead_letter_office:install:migrations db:migrate db:test:prepare
```

* Mount the web interface in your `config/routes.rb` file:

```ruby
namespace :admin do
  mount DeadLetterOffice::Engine => "/dead_letter_office"
end
```

Using the example above, you may now view the UI at http://lvh.me:3000/admin/dead_letter_office


## TODO

* add http authentication
* retry message delivery
* clear all failures
* customizable alert notifications


## Contributing

1. [Fork it](https://help.github.com/articles/fork-a-repo)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](https://help.github.com/articles/using-pull-requests)


## License

**dead_letter_office**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2012/license.html).
* Copyright (c) 2012 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)
* http://phlippers.net/


[![Dead Letter Office](https://img.skitch.com/20120712-1e4nk7b2dcemxw4deqt9db4fc9.png)](http://phlippers.net/dead_letter_office)
