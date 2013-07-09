module FfcrmEndpoint

  class EndpointNotDefinedError < StandardError; end
  class EndpointNoActionError < StandardError; end

  class Endpoint

    attr_accessor :params
    cattr_accessor :klasses do
      []
    end

    def initialize(params)
      @params = params
      raise EndpointNoActionError, "No action defined." unless params[:klass_name].present?
    end

    #
    # The main function to process the incoming data.
    # It delegates to the process function in your custom endpoint class.
    def process
      if klasses.include?(klass_name)
        klass.new(params).process
      else
        raise EndpointNotDefinedError, "To call /endpoints/#{params[:klass_name]} you must define 'class FfcrmEndpoint::#{params[:klass_name].classify} < FfcrmEndpoint::Endpoint'"
      end
    end

    #
    # The authentication method is called by the endpoint controller before 'process' is run.
    # 'process' will only be called if authenticate returns true
    def authenticate
      false
    end

    protected

    #
    # Configuration is assumed to be in Settings namespaced under the name of the action
    # If class is MyCustomEndpoint, then configuration should be in Setting[:my_custom_endpoint]
    # You can override this behaviour in the endpoint subclass if desired
    def config
      Setting[klass_name]
    end

    #
    # We derive the name of the endpoint subclass from the action
    # /endpoints/my_custom_endpoint corresponds to MyCustomEndpoint
    def klass
      klass_name.constantize
    end

    #
    # We derive the name of the endpoint subclass from the action
    # /endpoints/my_custom_endpoint corresponds to MyCustomEndpoint
    def klass_name
      "FfcrmEndpoint::#{params[:klass_name].classify}"
    end

    private

    #
    # Endpoints must be registered (by subclassing) before they can be called.
    # This ensures actions such as "/endpoints/object" don't result in dangerous calls to the Object class
    def self.inherited(subclass)
      klasses << subclass.name
    end

  end

  # Use this hook to load your endpoint subclasses
  ActiveSupport.run_load_hooks(:ffcrm_endpoint, self)

end
