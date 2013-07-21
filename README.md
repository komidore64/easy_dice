# easy_dice [![Build Status](https://travis-ci.org/komidore64/easy_dice.png?branch=master)](https://travis-ci.org/komidore64/easy_dice)

super simple gem for rolling polyhedral dice

## todo

- push to rubygems

## usage

### ruby

include the gem in your project with `require 'easy_dice'`

1. `easy_dice` will parse dice formatted as Strings
```ruby
irb> d = EasyDice.read("1d6 + 8")
 => #<Dice:0x00 ... >
irb> d.roll
 => 10
```

2. you can throw straight ruby at `easy_dice` too
```ruby
irb> d = 2.d(8) + 1.d(6) + 12
 => #<Dice:0x00 ... >
irb> d.roll
 => 28
irb> (12.d(6) + 10).roll
 => 61
```

3. `easy_dice` can give you a little bit of miscellaneous information
```ruby
irb> (1.d(6) + 1.d(8)).min # what's the smallest number that can be rolled?
 => 2
irb> (1.d(6) + 1.d(8)).max # what's the largest number that can be rolled?
 => 14
irb > puts 1.d(10) + 1.d(8) # "i forgot what dice i was going to roll"
1d10 + 1d8
 => nil
```

### bash

```bash
$ roll 1d8 + 1d6 + 8
16
```

## help me help you

If you've come across a bug or error in `easy_dice`, please submit a [Github issue](https://github.com/komidore64/easy_dice/issues) describing the problem, and what version of `easy_dice` you're using.
