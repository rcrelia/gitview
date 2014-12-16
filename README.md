# gitview 

[![Gem Version](https://badge.fury.io/rb/gitview.svg)](http://badge.fury.io/rb/gitview) [![Build Status](https://travis-ci.org/rcrelia/gitview.svg?branch=master)](https://travis-ci.org/rcrelia/gitview) [![Code Climate](https://codeclimate.com/github/rcrelia/gitview/badges/gpa.svg)](https://codeclimate.com/github/rcrelia/gitview) [![Test Coverage](https://codeclimate.com/github/rcrelia/gitview/badges/coverage.svg)](https://codeclimate.com/github/rcrelia/gitview)

## Description

Sometimes it's nice to see a terminal screen's worth of stats about a git repo without having to type a bunch of git commands or even look up specifics about said git commands. gitview was created to scratch this particular itch (and also help me learn about making my own Gems). Hopefully, you will find it helpful. 

## Installation

    gem install gitview

To upgrade to the latest version: <tt>gem update gitview</tt>

Use with git v1.9.x or later (earlier versions may work)

This was developed on OS X 10.9.2 and has been tested on travis-ci. As
with most things, ymmv.

## Usage

Here's an example using the local copy of my gitview repo

### Example:

    user1@host $: cd ~/my-gitrepos/gitview

    user1@host $: gitview

    ------------------------------------------------------------------------
    Repository: gitview - (git version 1.9.3) 
    ------------------------------------------------------------------------

    Repo status: Current

    Total number of files: 11

    Repo user name: Rick Crelia
    Repo user email: rcrelia.github@gmail.com

    Remote repo(s):
      origin	git@github.com:rcrelia/gitview.git (fetch)
      origin	git@github.com:rcrelia/gitview.git (push)

    Number of non-master branches: 0

    Total number of commits: 6
      Oldest commit on: 2014-12-08 12:25:09 -0800
      Newest commit on: 2014-12-08 16:00:18 -0800

    Most changed files: 
      3 README.md
      2 README.rdoc
      2 gitview.gemspec

    Least changed files: 
      1 lib/gitview.rb
      1 spec/gitvew.spec
      1 spec_helper.rb

    Most active committers:
      6	Rick Crelia



    ------------------------------------------------------------------------


## Development

Send patches to rcrelia.github@gmail.com, or fork the project on GitHub and 
send me a pull request. 

## Authors

Author:: Rick Crelia<br>

## License

Copyright:: Copyright (c) 2014 Rick Crelia<br>
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

