module Revily::Client::Resources::Incidents

  def incidents(service_id=nil, options={})
    service_id ? get("services/#{service_id}/incidents", options) : get("incidents", options)
  end
  alias :list_incidents :incidents

  def incident(id, options={})
    get "incidents/#{id}", options
  end

  def acknowledge_incident(id, options={})
    get "incidents/#{id}/acknowledge", options
  end

  def resolve_incident(id, options={})
    get "incidents/#{id}/resolve", options
  end

end
