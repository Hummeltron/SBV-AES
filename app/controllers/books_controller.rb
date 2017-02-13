class BooksController < ApplicationController
	before_action :set_book, only: [:show, :edit, :update, :destroy, :search, :attachment]

	# GET /books
	# GET /books.json
	def index
		# @books = Book.all

		if params[:search]
			@books = Book.search(params[:search])
			render :result
		else
			@books = Book.all
		end
	end

	# GET /books/1
	# GET /books/1.json
	def show
	end

	# GET /books/new
	def new
		@book = Book.new
	end

	# GET /books/1/edit
	def edit
	end

	# POST /books
	# POST /books.json
	def create
		@book = Book.new(book_params)
		upload_cover

		respond_to do |format|
			if @book.save
				format.html { redirect_to @book, notice: 'Book was successfully created.' }
				format.json { render :show, status: :created, location: @book }
			else
				format.html { render :new }
				format.json { render json: @book.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /books/1
	# PATCH/PUT /books/1.json
	def update
		upload_cover

		respond_to do |format|
			if @book.update(book_params)
				format.html { redirect_to @book, notice: 'Book was successfully updated.' }
				format.json { render :show, status: :ok, location: @book }
			else
				format.html { render :edit }
				format.json { render json: @book.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /books/1
	# DELETE /books/1.json
	def destroy
		cover = cover_path
		File.delete(cover) if File.exist?(cover)
		# Copy.find(@book.id).destroy
		# TODO: Delete all corresponding copies to prevent errors

		@book.destroy
		respond_to do |format|
			format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_book
			@book = Book.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def book_params
			params.require(:book).permit(:label, :price, :isbn, :image)
		end

		def upload_cover
			if !params[:book][:attachment].present?
					return
			end
			upload = params[:book][:attachment]
			filename = cover_path
			File.open(filename, 'wb') do |file|
				file.write(upload.read)
			end
		end

		def cover_path
			Rails.root.join("public", "images", "#{@book.label}.jpg")
		end
end
