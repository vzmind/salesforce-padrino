Admin.controllers :settings do

  get :index do
    @settings = Setting.all
    render 'settings/index'
  end

  get :new do
    @setting = Setting.new
    render 'settings/new'
  end

  post :create do
    @setting = Setting.new(params[:setting])
    if @setting.save
      flash[:notice] = 'Setting was successfully created.'
      redirect url(:settings, :edit, :id => @setting.id)
    else
      render 'settings/new'
    end
  end

  get :edit, :with => :id do
    @setting = Setting.find(params[:id])
    render 'settings/edit'
  end

  put :update, :with => :id do
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(params[:setting])
      flash[:notice] = 'Setting was successfully updated.'
      redirect url(:settings, :edit, :id => @setting.id)
    else
      render 'settings/edit'
    end
  end

  delete :destroy, :with => :id do
    setting = Setting.find(params[:id])
    if setting.destroy
      flash[:notice] = 'Setting was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Setting!'
    end
    redirect url(:settings, :index)
  end
end