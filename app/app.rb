class SalesforcePadrino < Padrino::Application
  register SassInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  
  #enable :sessions


  ##
  # Caching support
  #
  register Padrino::Cache
  enable :caching
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
     set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => 'angler.redistogo.com', :port => 9352, :password => 'a2acfa23d878840fb6255a95d469bde3'))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true     # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true      # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true  # Shows a stack trace in browser (default for development)
  # set :logging, true          # Logging in STDOUT for development and file for production (default only for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (default your_app/locales)
  # disable :sessions           # Disabled sessions by default (enable if needed)
  # disable :flash              # Disables rack-flash (enabled by default if Rack::Flash is defined)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #

  # Session storing using cookies and Rack::Session::Pool
  #use Rack::Session::Pool, :key => settings.session_key, :secret => settings.session_secret
  #use Rack::Flash
  # OmniAuth configuration using Forcedotcom strategy
  OmniAuth.config.full_host = 'https://salesforce-padrino.heroku.com'

  use OmniAuth::Builder do
    provider :forcedotcom, '3MVG9PhR6g6B7ps6in8a_o8S1Ii7Alq423LWj8XaSlFOIG_DjMsQb..mF32hPoK89..fU.zGxtuV6jbANj5je', '5960576012903158319'
  end

  # Salesforce API connection params
  ENV['sfdc_instance_url'] = "https://eu1.salesforce.com"
  ENV['sfdc_api_version']  = "21.0"
  
end
