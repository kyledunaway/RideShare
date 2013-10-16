class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @markers = Array.new
    @trips.each do |trip|
      for marker in trip.markers
        @markers.push(marker)
      end
    end

    @gmaps_options =
    {
      "markers"     => { "data" => '[{ "lng": "-99.9018131", "lat": "31.9685988"},
                                     { "lng": "-102.552784", "lat": "23.634501"},
                                     { "lng": "-122.3667", "lat": "40.5833"},
                                     { "lng": "-121.8356", "lat": "39.7400"}
                                      ]', },
      "polylines"   => { "data" => ' [ [
                         {"lng": -99.9018131, "lat": 31.9685988},
                         {"lng": -102.552784, "lat": 23.634501},
                         ], [
                          { "lng": "-122.3667", "lat": "40.5833"},
                          { "lng": "-121.8356", "lat": "39.7400"}
                          ] ]' }
    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @gmaps_options =
    {
      "markers"     => { "data" => '[{ "lng": "-99.9018131", "lat": "31.9685988"} ,{ "lng": "-102.552784", "lat": "23.634501"} ]', },
      "polylines"   => { "data" => ' [ [
                         {"lng": -99.9018131, "lat": 31.9685988},
                         {"lng": -102.552784, "lat": 23.634501}
                         ] ]' }
    }


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    2.times {@trip.markers.build}


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
