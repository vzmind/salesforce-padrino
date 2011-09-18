SalesforcePadrino.controllers :visitors do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/visitors' do
    @visitors = cache( "cache_for_visitors", :expires_in => 15 ) do
      @visitors = SalesforceConnector::Visitor.get_first_hundred
    end

    render "visitors/index"
  end  

  
end
