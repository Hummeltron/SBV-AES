class AesclassesController < ApplicationController
  before_action :set_aesclass, only: [:show, :edit, :update, :destroy]

  # GET /aesclasses
  # GET /aesclasses.json
  def index
    @aesclasses = Aesclass.all
  end

  # GET /aesclasses/1
  # GET /aesclasses/1.json
  def show
  end

  # GET /aesclasses/new
  def new
    @aesclass = Aesclass.new
  end

  # GET /aesclasses/1/edit
  def edit
  end

  # POST /aesclasses
  # POST /aesclasses.json
  def create
    @aesclass = Aesclass.new(aesclass_params)

    respond_to do |format|
      if @aesclass.save
        format.html { redirect_to @aesclass, notice: 'Aesclass was successfully created.' }
        format.json { render :show, status: :created, location: @aesclass }
      else
        format.html { render :new }
        format.json { render json: @aesclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aesclasses/1
  # PATCH/PUT /aesclasses/1.json
  def update
    respond_to do |format|
      if @aesclass.update(aesclass_params)
        format.html { redirect_to @aesclass, notice: 'Aesclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @aesclass }
      else
        format.html { render :edit }
        format.json { render json: @aesclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aesclasses/1
  # DELETE /aesclasses/1.json
  def destroy
    @aesclass.destroy
    respond_to do |format|
      format.html { redirect_to aesclasses_url, notice: 'Aesclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aesclass
      @aesclass = Aesclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aesclass_params
      params.require(:aesclass).permit(:name)
    end
end
