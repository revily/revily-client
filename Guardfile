guard 'spork', rspec_env: { 'RAILS_ENV' => 'test' }, rspec_port: 19004, aggressive_kill: false do
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end

guard :rspec, cli: "--color --drb --drb-port=19004 --tty -f doc --profile", bundler: false, all_after_pass: false, all_on_start: false, keep_failed: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

notification :tmux,
  display_message: true,
  timeout: 3, # in seconds
  default_message_format: '%s >> %s',
  default: 'default',
  success: 'default',
  failed: 'colour1',
  # the first %s will show the title, the second the message
  # Alternately you can also configure *success_message_format*,
  # *pending_message_format*, *failed_message_format*
  line_separator: ' > ', # since we are single line we need a separator
  color_location: 'status-left-fg' # to customize which tmux element will change color
