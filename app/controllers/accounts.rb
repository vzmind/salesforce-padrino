SalesforcePadrino.controllers :accounts do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/accounts' do
    @accounts = cache( "feed_for_vzmind", :expires_in => 15 ) do
      @accounts = SalesforceConnector::Account.get_first_hundred.parsed_response["records"]
    end
    # The path to layout is not clean. Need something like a Padrino.root(params)
    render "accounts/index"
  end

end
