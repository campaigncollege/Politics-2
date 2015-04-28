class TripsController < ApplicationController
	def new
		@trip = Trip.new
	end

	def create
  		@pol = Politician.find(params[:politician_id])
		@trip = @pol.trips.create(trip_params)

  		respond_to do |format| 
	 		if @trip.save
	  			format.html { redirect_to trips_url, 
	  				notice: 'Politician was successfully created.' }
	  			format.json {render json: @trip, status: created,
	  				location: @trip}
	  		else
	  			format.html { render action: "new" }
	  			format.json { render json: @trip.errors, 
	  				status: :unprocessable_entity }
	  		end
	  	end
	end

	def show
  		@pol = Politician.find(params[:politician_id])
  		@trip = @pol.trips.find(params[:id])
	end

	def destroy
		@pol = Politician.find(params[:politician_id])
		@trip = @pol.trips.find(params[:id])
		@trip.destroy
	end

	def index
		@trips = Trip.all
	end

	def edit
		@pol = Politician.find(params[:politician_id])
		@trip = @pol.trips.find(params[:id]) 
	end

	def update
		@pol = Politician.find(params[:politician_id])
		@trip = @pol.trips.find(params[:id])
		if @trip.update(trip_params)
			redirect_to root_path 
		else
			render 'edit'
		end
	end

	private
		def trip_params
			params.require(:trip).permit(:name, :city, :state, :office)
		end
end
