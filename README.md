# Tsukiko

Now it can convert Simplified Chinese into Traditional Chinsese with a high accuracy

I will add the opposite converation soon.

## Installation

Add this line to your application's Gemfile:

    gem 'tsukiko'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsukiko

## Usage

require "tsukiko"

str=Tsukiko.new

1.9.3-p448 :012 > a.convert("2001年新年钟声即将敲响")
 => "2001年新年鐘聲即將敲響" 
1.9.3-p448 :013 > a.convert("占卜，萝卜，国家")
 => "佔卜，蘿蔔，國家" 
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
