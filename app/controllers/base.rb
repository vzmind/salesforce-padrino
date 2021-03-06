SalesforcePadrino.controllers :base do

  get '/', :map => '/' do
    redirect "accounts"
  end
  
  get :auth_force, :map => '/auth/forcedotcom/callback' do
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']

    redirect "accounts"
  end

end
