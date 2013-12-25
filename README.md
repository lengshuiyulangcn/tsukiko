# Tsukiko

a tool to convert bewteen simpifid Chinese and traditional Chinese

## Installation

Add this line to your application's Gemfile:

    gem 'tsukiko'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsukiko

## Usage

require "tsukiko"

a=Tsukiko.new

to convert sp into tr

irb(main):003:0> a.convert("萝卜青菜各有所爱，我们尝试比较长的文章")

=> "蘿蔔青菜各有所愛，我們嘗試比較長的文章"

to convert tr into sp

irb(main):005:0> a.convert_tw("蘿蔔胡蘿蔔香蕉鳳梨")

=> "萝卜胡萝卜香蕉菠萝"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
