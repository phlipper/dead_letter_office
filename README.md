# DeadLetterOffice

## Description

This project implements a [Dead letter office](https://en.wikipedia.org/wiki/Dead_letter_office) for your Rails 3 application. Undeliverable emails (deliveries which raise exceptions) will be logged to the database and can be viewed via a mountable web interface.


## Requirements

### Support Platforms

Dead letter office is currently being developed against the following stack:

* Ruby 1.9.x
* Rails 3.2.x

It is possible that this may work on older versions of Rails. I do not have any plans to support older versions of Ruby.


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
