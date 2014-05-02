# Ragadjust

Gem to rag-adjust text content based on Mark Boulton's 24ways article: http://24ways.org/2013/run-ragged/ and Nathan Ford's JS implementation: https://github.com/nathanford/ragadjust

## Installation

Add this line to your application's Gemfile:

    gem 'ragadjust', github: 'aperfect/ragadjust'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ragadjust

## Usage

    Ragadjust::Adjust.ragadjust_content(text_to_adjust, selector = 'p, li, dd, figcaption', method = 'all')

## Contributing

1. Fork it ( https://github.com/aperfect/ragadjust/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
