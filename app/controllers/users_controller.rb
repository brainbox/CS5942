class UsersController < ApplicationController
   before_filter :authenticate, :only => [:edit, :update]
   before_filter :correct_user, :only => [:edit, :update]
   def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  
  def create
    @user = User.new(params[:user])
    @user.functions << Function.find(params[:functions]) unless params[:functions].nil? 
    if @user.save
      flash[:notice] = "User created"
      redirect_to :action => :index
    else
      @functions   = Function.all
      render :action => :new
    end   
  end

  # POST /users
  # POST /users.xml
  

  
  
end
