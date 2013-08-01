module Revily::Client::Resources::Services
  def services(options={})
    get "services", options
  end
  alias :list_services :services

  def service(id, options={})
    get "services/#{id}", options
  end

  def create_service(name, loop_limit, options={})
    post "services", options.merge({name: name})
  end

  def update_service(id, options={})
    patch "services/#{id}", options
  end

  def delete_service(id, options={})
    delete "services/#{id}", options
  end
end
