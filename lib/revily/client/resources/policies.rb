module Revily::Client::Resources::Policies

  def policies(options={})
    get "policies", options
  end
  alias :list_policies :policies

  def policy(id, options={})
    get "policies/#{id}", options
  end

  def create_policy(name, loop_limit, options={})
    post "policies", options.merge({name: name, loop_limit: loop_limit})
  end

  def update_policy(id, options={})
    patch "policies/#{id}", options
  end

  def delete_policy(id, options={})
    delete "policies/#{id}", options
  end

end