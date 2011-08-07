SalesforcePadrino.controllers :opportunities do

  before do
    if ENV['sfdc_token'].nil?
      redirect "/auth/forcedotcom"
    end 
  end

  get :index, :map => '/opportunities' do
    @opportunities = cache( "cache_for_opportunities", :expires_in => 15 ) do
      @opportunities = SalesforceConnector::Opportunity.get_first_hundred
    end

    render "opportunities/index"
  end

  
end
