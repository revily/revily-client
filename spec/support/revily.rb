ENV['REVILY_API_ENDPOINT'] ||= "http://localhost:9001"
ENV['REVILY_AUTH_TOKEN']   ||= "dGpYyvbApYxXGAvPkQjt"

module RequestHelpers
  def ignore(&block)
    cassette_name = VCR.current_cassette && VCR.current_cassette.name
    VCR.eject_cassette
    VCR.turn_off!
    WebMock.allow_net_connect!
    result = block.call
    WebMock.disable_net_connect!
    VCR.turn_on!
    VCR.insert_cassette(cassette_name) if cassette_name
    return result
  end
end

RSpec.configure do |config|
  config.include RequestHelpers
end