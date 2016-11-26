class ClassnamesController < ApplicationController
  before_action :set_classname, only: [:show, :edit, :update, :destroy, :search]

  # GET /classnames
  # GET /classnames.json
  def index
    if params[:search]
      @classnames = Classname.search(params[:search])
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
    # Use callbacks to share common setup or constraints between actions.
    def set_classname
      @classname = Classname.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classname_params
      params.require(:classname).permit(:name, :year)
    end
end
