Admin.controllers :base do

  get :index, :map => "/" do
    render "base/index"
  end

  get :auth_force, :map => '/auth/forcedotcom/callback' do
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']

    render :text => "Connection Successful"
  end

  get :list, :map => '/salesforce/accounts' do
    @account = SalesforceConnector::Account.get_first_hundred.inspect
  end
end
