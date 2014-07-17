# acts_as_addressable

[![Build Status](https://travis-ci.org/mobilityhouse/acts_as_addressable.svg?branch=master)](https://travis-ci.org/mobilityhouse/acts_as_addressable)
[![CodeClimate](https://codeclimate.com/github/mjaneczek/acts_as_addressable.png)](https://codeclimate.com/github/mjaneczek/acts_as_addressable) 
[![Code Climate](https://codeclimate.com/github/mjaneczek/acts_as_addressable/coverage.png)](https://codeclimate.com/github/mjaneczek/acts_as_addressable)

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_addressable', git: 'git@github.com:mobilityhouse/acts_as_addressable.git'

And then execute:

    $ bundle


## Getting started

#### Generate model and migration
First you need to create model and migration for your address. To do this you need to run the generator: 

     rails g acts_as_addressable:install street postcode city country
    
You can pass your own address attributes, default are: street, city and state.

#### Add addresses to your model

You can add addresses to many models and each model can has many address types!
```
class Company < ActiveRecord::Base
  acts_as_addressable :postal, :billing
end

company = Company.create
company.postal_addresses.create street: 'test'

company.addresses # => [#<PostalAddress id: 1, street: "test", ...]
company.postal_addresses # => [#<PostalAddress id: 1, street: "test", ...]
company.billing_addresses # => []
```

## Contributing

1. Fork it ( https://github.com/mjaneczek/acts_as_addressable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
