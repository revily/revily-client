module Revily::Client::Resources::Users
  def users(options={})
    get "users", options
  end
  alias :list_users :users

  def user(id, options={})
    get "users/#{id}", options
  end

  def create_user(name, email, password, options={})
    post "users", options.merge({name: name, email: email, password: password})
  end

  def update_user(id, options={})
    patch "users/#{id}", options
  end

  def delete_user(id, options={})
    delete "users/#{id}", options
  end
end
