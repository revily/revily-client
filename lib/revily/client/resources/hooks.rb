module Revily::Client::Resources::Hooks

  def hooks(options={})
    get "hooks", options
  end
  alias :list_hooks :hooks

  def hook(id, options={})
    get "hooks/#{id}", options
  end

  def create_hook(name, events, options={})
    post "hooks", options.merge({name: name, events: events})
  end

  def update_hook(id, options={})
    boolean_from_response :patch, "hooks/#{id}", options
  end

  def delete_hook(id, options={})
    boolean_from_response :delete, "hooks/#{id}", options
  end

end
