SalesforcePadrino.controllers :accounts do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/accounts' do
    @accounts = cache( "cache_for_accounts", :expires_in => 15 ) do
      @accounts = SalesforceConnector::Account.get_first_hundred
    end

    render "accounts/index"
  end

end
