module Revily::Client::Resources::Incidents

  def incidents(service_id=nil, options={})
    service_id ? get("services/#{service_id}/incidents", options) : get("incidents", options)
  end
  alias :list_incidents :incidents

  def incident(id, options={})
    get "incidents/#{id}", options
  end

  def acknowledge_incident(id, options={})
    boolean_from_response :put, "incidents/#{id}/acknowledge", options
  end
  alias_method :acknowledge, :acknowledge_incident

  def resolve_incident(id, options={})
    boolean_from_response :put, "incidents/#{id}/resolve", options
  end
  alias_method :resolve, :resolve_incident

end
