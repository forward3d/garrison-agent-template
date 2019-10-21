require 'bundler'
# Bundler.require(:default, :development)
Bundler.require(:default)
ROOT = File.dirname(__FILE__)

Dir[File.join(ROOT, 'garrison/lib/*.rb')].each do |file|
  require file
end

Dir[File.join(ROOT, 'garrison/checks/*.rb')].each do |file|
  require file
end

Garrison::Api.configure do |config|
  config.url  = ENV['GARRISON_URL']
  config.uuid = ENV['GARRISON_AGENT_UUID']
end

Garrison::Logging.info('Garrison Agent - TEMPLATE')

module Garrison
  module Checks
    @options = {}
    @options[:something] = ENV['SOMETHING_SPECIFIC'] ? ENV['SOMETHING_SPECIFIC'].split(',') : nil
  end
end
