module Revily::Client::Resources::Policies

  def policies(options={})
    get "policies", options
  end
  alias :list_policies :policies

  def policy(id, options={})
    get "policies/#{id}", options
  end

  def create_policy(name, loop_limit, options={})
    params = {
      name: name,
      loop_limit: loop_limit
    }
    post "policies", options.merge(params)
  end

  def update_policy(id, options={})
    boolean_from_response :patch, "policies/#{id}", options
  end

  def delete_policy(id, options={})
    boolean_from_response :delete, "policies/#{id}", options
  end

end