# lita-github-web-hooks-core

This Lita extension is designed to empower your chatbot with full knowledge of GitHub Web Hooks.

Installing this extension in your lita bot will not change its behavior.  Extensions are designed to enable handlers, and this one is no exception.  A simple example handler demonstrates how easy it can be to get up and running with GitHub Web Hooks in your own bot.  The bot is trained to speak in English already, and can be made to speak any other language by providing a locale.

## Installation

Add lita-github-web-hooks-core to your Lita plugin's gemspec:

``` ruby
spec.add_runtime_dependency "lita-github-web-hooks-core"
```

## Hooks and Listeners

A Hook is intended to capture a WebHook event from GitHub.  There is only one kind of Hook per GitHub API event type.

Listeners are used to react to hooks.  Users of this extension will register listeners that they write with a configuration object to make them eligible for receiving hooks.  A Hook can be heard by any number of listeners.  Listeners can be configured to share their information in any number of rooms.  The listeners are designed to be extended by handler developers to take specific actions that may be relevant.  For example, receipt of a deployment message might query a statistics API to publish performance metrics about the deployment just concluded.  Let your imagination be your guide!

## Usage

1. Subclass the HookReceiver Handler class to create something you can mount at a path with http.post and register with Lita
1. Define a listener, choosing which listener class to inherit from.
1. Override the act method in a manner of your choosing, making sure to write a test!
1. Register each listener class that you'd like to activate with the Configuration object

## Configuration

In the chatbot itself, where your own users will be interacting with the bot, the listeners will need to be configured.  Listeners can listen only to particular events, or all events.  Each particular repository will need to be configured separately at this time (PR's accepted).  A repository can have only certain types of events triggered, or can exclude specific types of events.