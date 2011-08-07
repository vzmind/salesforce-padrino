SalesforcePadrino.controllers :contacts do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/contacts' do
    @contacts = cache( "cache_for_contacts", :expires_in => 15 ) do
      @contacts = SalesforceConnector::Contact.get_first_hundred
    end

    render "contacts/index"
  end

  
end
