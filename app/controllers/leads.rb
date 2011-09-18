SalesforcePadrino.controllers :leads do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  before :agent => /iPhone|Mobile|MIDP/ do
    @mobile_agent=true
  end

  get :index, :map => '/leads' do
    @leads = cache( "cache_for_leads", :expires_in => 15 ) do
      @leads = SalesforceConnector::Lead.get_first_hundred
    end

    render "leads/index"
  end  

  
end
