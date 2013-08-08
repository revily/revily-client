module Revily::Client::Resources::Integration

  def service_trigger_incident(key, message=nil, description=nil, options={})
    incident = {
      message: message,
      description: description,
      key: key
    }.reject { |k,v| v.nil? }
    put "trigger", options.merge(incident)
  end
  alias_method :service_trigger, :service_trigger_incident

  def service_acknowledge_incident(key, options={})
    boolean_from_response :put, "acknowledge", options.merge(key: key)
  end
  alias_method :service_acknowledge, :service_acknowledge_incident

  def service_resolve_incident(key, options={})
    boolean_from_response :put, "resolve", options.merge(key: key)
  end
  alias_method :service_resolve, :service_resolve_incident

end
