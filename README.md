# Lita::Github::WebHooks::Core

Lita and GitHub web hooks are two great tastes that taste great together.

This extension is designed to make using GitHub web hooks as easy as possible in your own handlers.  You may be familiar with the [three types of events](http://docs.lita.io/plugin-authoring/handlers/) Lita supports.  In short, this extension transforms raw data arriving via the [HTTP routing](http://docs.lita.io/plugin-authoring/handlers/#http-routes) system, and publishes a Ruby object (including the original payload) for consumption via an [event route](http://docs.lita.io/plugin-authoring/handlers/#event-routes).  This way, with a simple ```on``` declaration in your handler, you've got the power of the GitHub and Lita at your fingertips.

Installing this extension in your lita bot will not change its behavior.  Extensions are designed to enable handlers, and this one is no exception.  A [simple example handler](https://github.com/GetLevvel/lita-github-web-hooks-storer) demonstrates how easy it can be to get up and running with GitHub Web Hooks in your own bot.

## Installation

Add lita-github-web-hooks-core to your Lita plugin's gemspec:

``` ruby
spec.add_runtime_dependency "lita-github-web-hooks-core"
```

And then execute:

    $ bundle

## Hooks and Listeners

A Hook is intended to capture a [Webhook event from GitHub](https://developer.github.com/webhooks/).  There is only one kind of Hook per GitHub API event type.  This extension takes events from the HTTP Post mechanism of interacting with Lita and publishes them on the event mechanism inside lita.  It also provides a collection of data-transfer objects designed to facilitate working with the payloads that GitHub sends along with the webhooks in question within your own plugins.

For example, receipt of a deployment message might query a statistics API to publish performance metrics about the deployment that's being retired.  Tagging a pull request event might trigger a GitHub status update, or a prompt within your chat room for someone to review it.  Want to use [atmos/heaven](https://github.com/atmos/heaven), but have a coffeescript allergy?  This is a great starting place.  Let your imagination be your guide!

## Usage

1. Subclass the HookReceiver Handler class to create something you can mount at a path with http.post and register with Lita
1. Define a listener, specifying which events you'd want to subscribe to.
1. Register that listener as a Lita handler.

A [step-by-step walkthrough](https://github.com/GetLevvel/lita-github-web-hooks-storer/blob/master/docs/handler-walkthrough.md)
 is available at [our example handler](https://github.com/GetLevvel/lita-github-web-hooks-storer/).



## Configuration

In the chatbot itself, where your own users will be interacting with the bot, the listeners will need to be configured.  Listeners can listen only to particular events, or all events.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GetLevvel/lita-github-web-hooks-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

