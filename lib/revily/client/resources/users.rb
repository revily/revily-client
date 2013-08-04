module Revily::Client::Resources::Users
  def users(options={})
    get "users", options
  end
  alias :list_users :users

  def user(id, options={})
    get "users/#{id}", options
  end

  def create_user(name, email, password, options={})
    params = {
      name: name,
      email: email,
      password: password
    }
    post "users", options.merge(params)
  end

  def update_user(id, options={})
    params = {
      name: options[:name],
      email: options[:email],
      password: options[:password]
    }.reject { |k,v| v.nil? }
    boolean_from_response :patch, "users/#{id}", options.merge(params)
  end

  def delete_user(id, options={})
    boolean_from_response :delete, "users/#{id}", options
  end
end
