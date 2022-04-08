# Mydb
Mydb is an in-memory database which supports SQL written in Ruby. This was built for learning.

## Installation and usage

```ruby
git clone https://github.com/ytnk531/mydb.git
cd mydb
bundle exec ruby exe/mydb.rb
```

## Queries
Only supports `CREATE TABLE`, `INSERT`, `SELECT`.

```sql
CREATE TABLE customer (id INTEGER, name VARCHAR(20));
INSERT customer (id, name) VALUE (10, 'arise'), (12, 'bob');
SELECT id, name FROM customer WHERE id=10;
SELECT id, name FROM customer WHERE name='bob';
```
![image](https://user-images.githubusercontent.com/9428628/162443608-453cd701-0bab-462b-8f08-9ef4dd157917.png)


## Why Mydb?

I use RDMS in my work, 
but I don't have knowledge about its implementation. I wanted to try my hand at building one, but in pure Ruby.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mydb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mydb/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mydb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mydb/blob/master/CODE_OF_CONDUCT.md).
