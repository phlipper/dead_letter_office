# Dead Letter Office

[![Dead Letter Office](https://img.skitch.com/20120712-fbycp3kf5yhupq6txnaucknc3d.png)](http://phlippers.net/dead_letter_office)


## Description

This project implements a [Dead letter office](https://en.wikipedia.org/wiki/Dead_letter_office) (mail recovery center) as an engine for your Rails 3 application. Undeliverable emails which raise exceptions will be logged to the database and can be viewed via a mountable web interface.


## Requirements

### Support Platforms

Dead letter office is currently being developed against the following stack:

* Ruby 1.9.x
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



## TODO

* retry delivery
* clear failures
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
