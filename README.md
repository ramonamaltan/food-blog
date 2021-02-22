### Table of contents
* [General info](#general-info)
* [Features](#features)
* [Status](#status)
* [Setup](#setup)

### General info
> This is a passion project, a vegan food blog for family and friends

### Features
* Recipes overview incl. search and filter for recipes (pg-search)
* Recipe Instructions incl. rich text editor (Action Text)
* Create new recipes incl. image upload (Active Storage), edit/update, delete recipes (only authorized users)
* Mark recipes as favorites/ favorite recipes overview

### Status
Project is: _in progress_

### Setup
The setup steps expect following tools installed on the system.

- Github
- Ruby
- Rails

#### Clone the repository

```shell
git clone git@github.com:ramonamaltan/food-blog.git
cd food-blog
```

#### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.6`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.6
```

#### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

#### Initialize the database

```shell
rails db:create db:migrate db:seed
```

#### Start Rails server

```shell
rails s
```

And now you can visit the site with the URL http://localhost:3000
