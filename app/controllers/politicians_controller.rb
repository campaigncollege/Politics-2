class PoliticiansController < ApplicationController
	def new
		@pol = Politician.new
	end

	def create
  		@pol = Politician.new(pol_params)
  		respond_to do |format| 
	 		if @pol.save
	  			format.html { redirect_to pols_url, 
	  				notice: 'Politician was successfully created.' }
	  			format.json {render json: @pol, status: created,
	  				location: @pol}
	  		else
	  			format.html { render action: "new" }
	  			format.json { render json: @pol.errors, 
	  				status: :unprocessable_entity }
	  		end
	  	end
	end

	def show
  		@pol = Politician.find(params[:id])
	end

	def destroy
		@pol = Politician.find(params[:id])
		@pol.destroy
	end

	def index
		@pols = Politician.where(draft: false)
		@pols = @pols.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def edit
		@pol = Politician.find(params[:id])
	end

	def update
		@pol = Politician.find(params[:id])
		if @pol.update(pol_params)
			redirect_to admin_path 
		else
			render 'edit'
		end
	end

	private
		def pol_params
			params.require(:politician).permit(:name, :city, :state, :office)
		end
end
