module FfcrmEndpoint

  class EndpointNotDefinedError < StandardError; end
  class EndpointNoActionError < StandardError; end
  class EndpointDuplicateError < StandardError; end

  class Endpoint

    attr_accessor :request, :params
    cattr_accessor :klasses do
      []
    end

    def initialize(request)
      @request = request
      @params = request.params
      raise EndpointNoActionError, "No action defined." unless params[:klass_name].present?
    end

    #
    # The main function to process the incoming data.
    # It delegates to the process function in your custom endpoint class.
    def process
      klass.new(request).process
    end

    #
    # The authentication method is called by the endpoint controller before 'process' is run.
    # 'process' will only be called if authenticate returns true
    def authenticate
      klass.new(request).authenticate == true
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
    # klasses are stored as MyPluginName::MyCustomEndpoint
    # Return first match on "MyCustomEndpoint"
    def klass
      @klass ||= klasses.select{|k| k.to_s.demodulize == klass_name}.compact.first
      raise EndpointNotDefinedError, "To call /endpoints/#{params[:klass_name]} you must define 'class #{params[:klass_name].classify} < FfcrmEndpoint::Endpoint'" if !@klass.present?
      @klass
    end

    #
    # We derive the name of the endpoint subclass from the action
    # /endpoints/my_custom_endpoint corresponds to MyCustomEndpoint
    def klass_name
      "#{params[:klass_name].classify}"
    end

    private

    #
    # Endpoints must be registered (by subclassing) before they can be called.
    # This ensures actions such as "/endpoints/object" don't result in dangerous calls to the Object class
    def self.inherited(subclass)
      # handle name duplicates
      if (duplicates = klasses.select{ |klass| klass.to_s.demodulize == subclass.to_s.demodulize }).any?
        raise EndpointDuplicateError, "You cannot have endpoints with the same name: #{duplicates.join(', ')}"
      else
        klasses << subclass
      end
    end

  end

  # Use this hook to load your endpoint subclasses
  ActiveSupport.run_load_hooks(:ffcrm_endpoint, self)
end
