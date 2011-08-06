class Admin < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Admin::AccessControl

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

  set :login_page, "/sessions/new"


  access_control.roles_for :any do |role|
    role.protect "/"
    role.allow "/sessions"
  end

  access_control.roles_for :admin do |role|
    role.project_module :settings, "/settings"
    role.project_module :accounts, "/accounts"
  end

  use Rack::Session::Pool, :key => settings.session_key, :secret => settings.session_secret
  use Rack::Flash

  OmniAuth.config.full_host = 'https://localhost:3000'

  use OmniAuth::Builder do
    provider :forcedotcom, '3MVG9PhR6g6B7ps6in8a_o8S1IvXGM41y725iSJXhSWZm5GJ0gZgvuQkLdT7YWOLciMWxn5yDglwAcjkGzcal', '2539130913145733702'
  end
  
end
