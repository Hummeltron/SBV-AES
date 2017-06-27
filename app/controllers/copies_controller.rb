class CopiesController < ApplicationController
	before_action :set_copy, only: [:show, :edit, :destroy]

	# GET /copies
	# GET /copies.json
	def index
		if params[:search]
			@copies = Copy.search(params[:search])
			render :result
		elsif params[:page]
			@page = params[:page].to_i - 1
			tmp = @page * 20
			@copies = Copy.where(:id => tmp...tmp+20)
		else
			@page = 0
			tmp = @page * 20
			@copies = Copy.where(:id => tmp...tmp+20)
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
		@copy = Copy.find(params[:id])
		
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
		@copy.destroy#.update_attribute(:student_id, nil);
		respond_to do |format|
			format.html { redirect_to copies_url, notice: 'Kopie erfolgreich entfernt.' }
			format.json { head :no_content }
		end
	end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_copy
		@copy = Copy.find(params[:id])
		
		respond_to do |format|
			format.json
			format.html
			format.pdf do
				# hier noch das format spezifizieren
				pdf = Prawn::Document.new(:page_size => [150, 150])
				
				require 'barby'
				require 'barby/barcode/code_128'
		
				# herausfinden welche barcode klasse wir benoetigen
				# bzw welche der sensor kann
				barcode = Barby::Code128B.new(@copy.code)
				
				require 'barby/outputter/prawn_outputter'
				outputter = Barby::PrawnOutputter.new(barcode);
				
				# hier in to_pdf(pdf, <options>) x, y etc einfuegen https://github.com/toretore/barby/wiki/Outputters
				# oder http://www.rubydoc.info/github/toretore/barby/Barby/PrawnOutputter
				pdf = outputter.annotate_pdf(pdf, opts = { :x => 0, :y => 20})
				
				# hier noch die position so setzen das sie mittig unter dem barcode ist
				pdf.draw_text"#{@copy.code}", :at => [30,0]
				
				send_data pdf.render, filename: "Pdf", type: "application/pdf" , disposition: "inline"
			end
		end
	end
	# Never trust parameters from the scary internet, only allow the white list through.
	def copy_params
		params.require(:copy).permit(:book_id, :student_id, :topay, :code)
	end
end
