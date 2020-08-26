# Weblog Parser

## Table of Contents
1. [About the project](#about-the-project)
2. [Code Style](#code-style-and-principles)
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Tests](#tests)
7. [Contribution](#contribution)

## About the project
Weblog parser is script written in Ruby programming language. With provided path to a webserver.log, it is parsing and calculating webpage visits using IPs. Parser is generating two type of reports:
* Total webpage visits
* Unique webpage visits

## Code Style and Principles
* TDD - test-driven development
* OOP - Service Objects pattern
* DRY - don't repeat yourself
* SOLID design principle
* RuboCop - static code analyzer and code formatter

## Dependencies
* Ruby 2.5.1
* RSpec 3.9
* RuboCop 0.89.1

## Installation
Parser is written in Ruby programming language so make sure you have it installed. You can check it with this command:

    ruby -v

If Ruby is not installed on your OS please follow the [offical documentation](https://www.ruby-lang.org/en/documentation/installation/) for installation guide.

RSpec and RuboCop gems are used as a testing tool and static code analyzer and can be installed in two ways:
* Using commands:

      gem install rspec
      gem install rubocop

* Using provided Gemfile:

  Check if bundler is available and install it if needed:

       bundler -v
       gem install bundler

  Use this command to install gems:

       bundle install --path .bundle

## Usage
**Make sure you have all dependencies installed before you start using Weblog parser**
1. Clone the repo
2. Navigate to the directory where repo was cloned
3. Run the script with log path as an argument:

       ruby parser.rb webserver.log

## Tests
RSpec is testing tool used in this project. Test files can be found in /spec directory and it consists of multiple unit and one integration test.
Navigate to the root project directory and use use following commands:

Start all tests:

    rspec spec

Start one test:

    rspec path/to/spec/file

To start RuboCop:

    rubocop

## Contribution
Project is used for private purposes but in case you want to contribute you can follow these steps:
1. **Fork** the repo on GitHub
2. **Clone** the project to your own machine
3. **Commit** changes to your own branch
4. **Push** your work back up to your fork
5. **Submit** a Pull request so that I can review your changes
