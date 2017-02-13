class CopiesController < ApplicationController
	before_action :set_copy, only: [:show, :edit, :update, :destroy, :search]

	# GET /copies
	# GET /copies.json
	def index
		if params[:search]
			@copies = Copy.search(params[:search])
			render :result
		else
			@copies = Copy.all
		end
	end

	# GET /copies/1
	# GET /copies/1.json
	def show
	end

	# GET /copies/new
	def new
		@copy = Copy.new
	end

	# GET /copies/1/edit
	def edit
	end

	# POST /copies
	# POST /copies.json
	def create
		@copy = Copy.new(copy_params)

		respond_to do |format|
			if @copy.save
				format.html { redirect_to @copy, notice: 'Copy was successfully created.' }
				format.json { render :show, status: :created, location: @copy }
			else
				format.html { render :new }
				format.json { render json: @copy.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /copies/1
	# PATCH/PUT /copies/1.json
	def update
		respond_to do |format|
			if @copy.update(copy_params)
				format.html { redirect_to @copy, notice: 'Copy was successfully updated.' }
				format.json { render :show, status: :ok, location: @copy }
			else
				format.html { render :edit }
				format.json { render json: @copy.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /copies/1
	# DELETE /copies/1.json
	def destroy
		@copy.destroy
		respond_to do |format|
			format.html { redirect_to copies_url, notice: 'Copy was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_copy
			@copy = Copy.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def copy_params
			params.require(:copy).permit(:book_id, :student_id, :topay, :code)
		end
end
