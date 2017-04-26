class ClassnamesController < ApplicationController
	before_action :set_classname, only: [:show, :edit, :update, :destroy, :search]

	# GET /classnames
	# GET /classnames.json
	def index
		if params[:search]
			@classnames = Classname.search(params[:search])
			render :result
		else
			@classnames = Classname.all
		end
	end

	# GET /classnames/1
	# GET /classnames/1.json
	def show
	end

	# GET /classnames/new
	def new
		@classname = Classname.new
	end

	# GET /classnames/1/edit
	def edit
	end

	# POST /classnames
	# POST /classnames.json
	def create
		@classname = Classname.new(classname_params)

		respond_to do |format|
			if @classname.save
				format.html { redirect_to @classname, notice: 'Classname was successfully created.' }
				format.json { render :show, status: :created, location: @classname }
			else
				format.html { render :new }
				format.json { render json: @classname.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /classnames/1
	# PATCH/PUT /classnames/1.json
	def update
		respond_to do |format|
			if @classname.update(classname_params)
				format.html { redirect_to @classname, notice: 'Classname was successfully updated.' }
				format.json { render :show, status: :ok, location: @classname }
			else
				format.html { render :edit }
				format.json { render json: @classname.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /classnames/1
	# DELETE /classnames/1.json
	def destroy
		@classname.destroy
		respond_to do |format|
			format.html { redirect_to classnames_url, notice: 'Classname was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		def set_classname
			@classname = Classname.find(params[:id])
				t = Time.new
			respond_to do |format|
				format.html
				format.pdf do
					pdf = Prawn::Document.new
					
					pdf.text "#{t.strftime("%Y-%m-%d")}"
					pdf.text "#{@classname.full_name}"
					pdf.text "\n"
					pdf.image Rails.root.join("public", "images", "AES.jpg"), :at => [510,740], :width => 50 
					
					books = Array.new
					books_id = Array.new
					
					@classname.students.to_ary.each do |student|
						student.copies.to_ary.each do |copy|
							if not books.include? copy.book.label
								books.push(copy.book.label)
								if books.count < 10
									books_id.push("0#{books.count}")
								else
									books_id.push("#{books.count}")
								end
							end
						end
					end
					
					table = Array.new
					table.push(["Name"].concat(books_id))
					
					@classname.students.to_ary.each do |student|
						value = ""
						rows = Array.new
						books.each do |book|
							student.copies.to_ary.each do |copy|
								if copy.book.label == book
									value = "X"
									break
								else
									value = ""
								end
							end
							rows.push(value)
						end
						table.push(["#{student.full_name}"].concat(rows))
					end
			
					pdf.table table, :cell_style => { :size => 8 }, :row_colors => ["F0F0F0", "FFFFCC"], :width => 540
					
					legend = Array.new
					
					legend.push(["Id", "Name"])
					
					(0..books.count).each do |i|
						legend.push([books_id[i], books[i]])
					end
					
					pdf.text "\n"
					
					pdf.table legend, :cell_style => { :size => 8, :overflow => :shrink_to_fit }, :row_colors => ["F0F0F0", "FFFFCC"]
					
					send_data pdf.render, filename: "Pdf", type: "application/pdf" , disposition: "inline"
				end
			end
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def classname_params
			params.require(:classname).permit(:name, :year)
		end
end
