# CustomErrorsHandler

## Install

    gem install custom_error_handler

and in your Gemfile:
    
    gem 'custom_error_handler'

## About

Custom Errors Handler is intended as an easy alternative to manage showing/rendering exceptions templates (404, 500) in Rails3.

The intent behind it was to KISS as much as it is possible. It allows you to render different 404/500 templates for different controllers/modules. If no errors templates are found, it renders default public/error_code template. It works only with Rails3

## Usage

The basics of Custom Errors Handler are quite simple:

It fetches all errors comming from controllers and it decides frm which file
Rails should render error.

It search throught all the directories from the place where error occured, up
to views root path.

It also checks in subdir "template" in any subdir.

## Example

First easy one:

Error 404 (not found) occurred in controller ErrorMakingController.

Custom Errors Handler searches for template called "404.erb" in following directories:

    /views/error_making/layouts
    /views/error_making/
    /views/layouts
    /views/

After it find template - it just render it.


Controller in Module:

Error 500 occurred in controller MyModule::ErrorMakingController in action index.

Our Custom Errors Handler searches in (searches for "500.erb"):

    /views/my_module/error_making/layouts
    /views/my_module/error_making/
    /views/my_module/layouts
    /views/my_module/
    /views/layouts
    /views/

So as you can see you can use different error templates for both controllers and modules.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with Rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011 Maciej Mensfeld. See LICENSE for details.

