module Revily::Client::Resources::Services
  def services(options={})
    get "services", options
  end
  alias :list_services :services

  def service(id, options={})
    get "services/#{id}", options
  end

  def create_service(name, acknowledge_timeout, auto_resolve_timeout, options={})
    params = {
      name: name,
      acknowledge_timeout: acknowledge_timeout,
      auto_resolve_timeout: auto_resolve_timeout
    }
    post "services", options.merge(params)
  end

  def update_service(id, options={})
    boolean_from_response :patch, "services/#{id}", options
  end

  def delete_service(id, options={})
    boolean_from_response :delete, "services/#{id}", options
  end
end
