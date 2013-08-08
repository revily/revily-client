module Revily::Client::Resources::Schedules
  def schedules(options={})
    get "schedules", options
  end
  alias_method :list_schedules, :schedules

  def schedule(id, options={})
    get "schedules/#{id}", options
  end

  def create_schedule(name, time_zone=nil, options={})
    params = {
      name: name,
      time_zone: time_zone
    }
    post "schedules", options.merge(params)
  end

  def update_schedule(id, options={})
    params = {
      name: options[:name],
      time_zone: options[:time_zone]
    }.reject { |k,v| v.nil? }
    boolean_from_response :patch, "schedules/#{id}", options
  end

  def delete_schedule(id, options={})
    boolean_from_response :delete, "schedules/#{id}", options
  end
end
