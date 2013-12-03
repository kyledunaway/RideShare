class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @tripLocation = Trip.pluck(:id)
    @markers = Marker.where("trip_id in (?)", @tripLocation)
    @gmaps_options = @markers.to_gmaps4rails

    @polylines_json = {}
    polylines = []

    @trips.each_with_index do |trip, i|
      polylines[i] = []
      trip.markers.each do |marker|
        polylines[i] += [{:lng=>marker.longitude.to_f, :lat=>marker.latitude.to_f}]
      end
    end
    
    @polylines_json = polylines.to_json

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  def apply_for
    @trip = Trip.find(params[:id])
    @trip.seats.create(:user_id => params[:user_id])
    redirect_to trip_path(@path)
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @markers = @trip.markers
    @gmaps_options = @markers.to_gmaps4rails

    @polylines_json = {}
    polylines = [] 
    polylines[0] = []
      @trip.markers.each do |marker|
        polylines[0] += [{:lng=>marker.longitude.to_f, :lat=>marker.latitude.to_f}]
      end

    
    @polylines_json = polylines.to_json

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])
    @trip.user = current_user

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

end
