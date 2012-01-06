# MavenPom

[![Build Status](https://secure.travis-ci.org/finn-no/maven_pom.png)](http://travis-ci.org/finn-no/maven_pom)

Tiny library to work with Maven's pom.xml files from Ruby.

The code was extracted and gemified from an internal project. The API and functionality is based on that project's relatively simple needs. For instance, it does not care about artifact versions and won't check the validity of the poms.

The project is also in "patches only" mode.

## Installation

Add this line to your application's Gemfile:

    gem 'maven_pom'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maven_pom

## Usage

```ruby
pom = MavenPom.from("path/to/some/pom.xml")

pom.packaging     #=> "pom"
pom.parent        #=> "com.example:parent"
pom.key           #=> "com.example:this"
pom.dependencies  #=> ["com.example:foo", "com.example:bar"]

# topological sort - should roughly match e.g. reactor order
MavenPom.sort [pom1, pom2, pom3]
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make your changes and add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
