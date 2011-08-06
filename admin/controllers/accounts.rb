
Admin.controllers :accounts do

  get :index do
    @accounts = Account.all
    render 'accounts/index'
  end

  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  post :create do
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']
    #render :text => request.env['omniauth.auth'].inspect

    render :text => Account.get_first_hundred.inspect
  end

  #  @account = Account.new(params[:account])
  #  if @account.save
  #    flash[:notice] = 'Account was successfully created.'
  #    redirect url(:accounts, :edit, :id => @account.id)
  #  else
  #    render 'accounts/new'
  #  end
  #end

  get :edit, :with => :id do
    @account = Account.find(params[:id])
    render 'accounts/edit'
  end

  put :update, :with => :id do
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = 'Account was successfully updated.'
      redirect url(:accounts, :edit, :id => @account.id)
    else
      render 'accounts/edit'
    end
  end

  delete :destroy, :with => :id do
    account = Account.find(params[:id])
    if account != current_account && account.destroy
      flash[:notice] = 'Account was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Account!'
    end
    redirect url(:accounts, :index)
  end
end
