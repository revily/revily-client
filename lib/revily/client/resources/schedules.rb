module Revily::Client::Resources::Schedules
  def schedules(options={})
    get "schedules", options
  end
  alias :list_schedules :schedules

  def schedule(id, options={})
    get "schedules/#{id}", options
  end

  def create_schedule(name, auto_resolve_timeout, acknowledge_timeout, options={})
    post "schedules", options.merge({name: name})
  end

  def update_schedule(id, options={})
    patch "schedules/#{id}", options
  end

  def delete_schedule(id, options={})
    delete "schedules/#{id}", options
  end
end
