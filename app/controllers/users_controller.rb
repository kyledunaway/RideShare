class UsersController < ApplicationController
	def new
  		@user = User.new
	end

	def create
  		@user = User.new(params[:user])
  		if @user.save
    		redirect_to root(@user), :notice => "Signed up!, Now Log In!"
  		else
    		render "new"
  		end
	end

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
  
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def rate
    @user = User.find(params[:id])
    @user.rate(params[:stars], current_user, params[:dimension])
    render :update do |user|
      user.replace_html @user.wrapper_dom_id(params), ratings_for(@user, params.merge(:wrap => false))
      user.visual_effect :highlight, @user.wrapper_dom_id(params)
    end
  end

  def accept_for
    @trip = Trip.find(params[:trip_id])
    @seat = @trip.seats.where(:user_id => params[:user_id]).first
    @seat.pending = false
    @seat.accepted = true
    @seat.save
    redirect_to trip_path(@trip)
  end

  def unaccept_for
    @trip = Trip.find(params[:trip_id])
    @seat = @trip.seats.where(:user_id => params[:user_id]).first
    @seat.pending = true
    @seat.accepted = false
    @seat.save
    redirect_to trip_path(@trip)
  end
end