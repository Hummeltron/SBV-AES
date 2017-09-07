class CopiesController < ApplicationController
	before_action :set_copy, only: [:show, :edit]

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
	
	def create_pdf(copy_ids)
		# set these values according to the required printer page sizes
		printer_width = 150
		printer_height = 120
		
		if copy_ids.empty?
			redirect_to copies_url, notice: "No copy ids privided"
		else
			pdf = Prawn::Document::new(:page_size => [printer_width, printer_height])
			
			first_item = true
			
			copy_ids.each do |copy_id|
				# Generate barcode
				require 'barby'
				require 'barby/barcode/code_128'
				require 'barby/outputter/prawn_outputter'
				
				barcode = Barby::Code128B.new(copy_id)
				
				outputter = Barby::PrawnOutputter.new(barcode)
				
				if first_item
					first_item = false
				else
					pdf.start_new_page
				end
				
				#pdf = outputter.annotate_pdf(pdf, opts = { :x => -16, :y => printer_height - outputter.height * 2, :xdim => printer_width / outputter.width })
				#pdf.text_box "#{copy_id}", :at => [0, 0], :width => printer_width / 2, :height => printer_height - outputter.height, :align => :center, :size => 24
				
				xpos = -20
				ypos = 15
				dim = 1.5
				
				pdf = outputter.annotate_pdf(pdf, opts = { x: xpos, y: ypos, xdim: dim })
				
				pdf.text_box "#{copy_id}", :at => [0, 0], :width => printer_width / 2, :height => printer_height - outputter.height - 15, :align => :center, :size => 24
			end
			
			send_data pdf.render, filename: "Pdf", type: "application/pdf" , disposition: "inline"
		end
	end

	# POST /copies
	# POST /copies.json
	def create
		count = params[:count].to_i
		
		#copy_params.new(:student_id => nil)
		
		new_copies = Array.new
		
		failed = false
		
		for i in 1..count do
			copy = Copy.new(copy_params)
			
			if copy.save(validate: false)
				new_copies.push(copy)
			else
				failed = true
				break
			end
		end
		
		if failed
			new_copies.each do |copy|
				copy.delete
			end
			
			redirect_to copies_url, notice: "Failed to create copies"
		else
			# All copies haven been created properly
			pdf_copies = Array.new
			
			new_copies.each do |copy|
				pdf_copies.push(copy.id)
			end
			
			create_pdf(pdf_copies)
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
		@copy = Copy.find(params[:id])
		
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
				create_pdf([@copy.id])
			end
		end
	end
	# Never trust parameters from the scary internet, only allow the white list through.
	def copy_params
		params.require(:copy).permit(:book_id, :student_id, :topay)
	end
end
