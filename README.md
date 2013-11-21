# FfcrmEndpoint

A plugin that enables Fat Free CRM (http://www.fatfreecrm.com) to receive webhooks.

Many websites allow you to send webhooks whenever actions take place. This plugin provides a framework to quickly write custom classes that consume these webhooks and process the data into Fat Free CRM objects.

It was originally built to consume user submitted forms sent via formstack.com but was turned into a generic solution to support wider varieties of input data.

This plugin is aimed at Fat Free CRM developers who want to quickly integrate incoming requests from other websites / services.

Please note this is *not* yet production ready code.

## Installation

Add ```ffcrm_endpoint``` to your Fat Free CRM application Gemfile and run bundle install.

```gem 'ffcrm_endpoint', :github => 'fatfreecrm/ffcrm_endpoint'```

## How it works / Setup steps

* Create a class called ```MyCustomEndpoint``` in ```/app/services/my_custom_endpoint.rb```
  * Subclass from FfcrmEndpoint::Endpoint
  * Define a ```process``` method which will receive the request data.
  * Define an ```authenticate``` method which should return true if the request is allowed to proceed.

  ```ruby
  class FfcrmEndpoint::MyCustomEndpoint < FfcrmEndpoint::Endpoint

    #
    # This is where you write code to turn the data into Fat Free CRM objects.
    # You have access to request and params here
    def process
    end

    #
    # return true only if allowed to proceed.
    def authenticate
      params[:token].present? && params[:token] == Setting.my_custom_endpoint[:token]
    end

  end
  ```

* Point your browser to http://path.to.ffcrm/endpoints/my_custom_endpoint

That's it!

## Under the hood / More details

Simply by going to the URL ```/endpoints/my_custom_endpoint```, the plugin knows to look for the ```MyCustomEndpoint``` class.

### Keeping things secure

```MyCustomEndpoint``` must be subclassed from ```FfcrmEndpoint::Endpoint``` otherwise it will not be allowed as an action. This is deliberate in order to ensure that arbitary ruby classes cannot be called. Consider for a moment what would happen on the URL ```/endpoints/object``` if this protection wasn't built in!

Also note, that you are responsible for sanitizing your data... just as you would in a normal rails action. Be careful.

### Authentication / Tokens

The ```endpoints``` controller delegates authentication to the custom class. This is to allow you to define your own security. A common practice is to use a token that is shared between your external service and Fat Free CRM. Implementation is left to the developer. Just be sure to define the ```authenticate``` method.

## TODO list

* More tests
* Consolidate how to pass in data

## Bug Fixes / Contributions

Please open issues in the GitHub issue tracker and use pull requests for new features.

## License

MIT (see LICENSE for more details)

## Author

Steve Kenworthy (steveyken@gmail.com)
