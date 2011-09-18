SalesforcePadrino.controllers :leads do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/visitors' do
    @leads = cache( "cache_for_visitors", :expires_in => 15 ) do
      @leads = SalesforceConnector::Visitor.get_first_hundred
    end

    render "visitors/index"
  end  

  
end
