class BookdetailsController < ApplicationController
  before_action :set_bookdetail, only: [:show, :edit, :update, :destroy]

  # GET /bookdetails
  # GET /bookdetails.json
  def index
    @bookdetails = Bookdetail.all
  end

  # GET /bookdetails/1
  # GET /bookdetails/1.json
  def show
  end

  # GET /bookdetails/new
  def new
    @bookdetail = Bookdetail.new
  end

  # GET /bookdetails/1/edit
  def edit
  end

  # POST /bookdetails
  # POST /bookdetails.json
  def create
    @bookdetail = Bookdetail.new(bookdetail_params)

    respond_to do |format|
      if @bookdetail.save
        format.html { redirect_to @bookdetail, notice: 'Bookdetail was successfully created.' }
        format.json { render :show, status: :created, location: @bookdetail }
      else
        format.html { render :new }
        format.json { render json: @bookdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookdetails/1
  # PATCH/PUT /bookdetails/1.json
  def update
    respond_to do |format|
      if @bookdetail.update(bookdetail_params)
        format.html { redirect_to @bookdetail, notice: 'Bookdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookdetail }
      else
        format.html { render :edit }
        format.json { render json: @bookdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookdetails/1
  # DELETE /bookdetails/1.json
  def destroy
    @bookdetail.destroy
    respond_to do |format|
      format.html { redirect_to bookdetails_url, notice: 'Bookdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookdetail
      @bookdetail = Bookdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookdetail_params
      params.require(:bookdetail).permit(:ISBN, :Leihbuch, :imgpath, :preis)
    end
end
