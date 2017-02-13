class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :search, :selected_ids, :mode]

  # GET /students
  # GET /students.json
  def index
    if params[:search]
      @students = Student.search(params[:search])
      render :result
    elsif params[:selected_ids]
      @students = Student.find(params[:selected_ids])
      @students.each do |student|
        student.destroy
      end
      redirect_to students_url, :notice => "Destroyed Students"
    else
      @students = Student.all
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = Prawn::Document.new
          pdf.text "#{@student.full_name}"
          pdf.text "#{@student.classname.full_name}", size: 12
          pdf.text "#{@student.birth}", size: 10
          pdf.text "\n"

          arr = Array.new
          arr.push(["Buch", "Preis", "Code"])
          price = 0
          @student.copies.to_ary.each do |copy|
            if copy.topay
              arr.push(["#{copy.book.label}", "#{copy.book.price}€", "#{copy.code}"])
              price += copy.book.price
            else
              arr.push(["#{copy.book.label}", "0.0€", "#{copy.code}"])
            end
          end

          pdf.table arr, :width => 540
          pdf.text "\n"
          pdf.text "Summe: #{price}€"

          send_data pdf.render, filename: "Pdf", type: "application/pdf" , disposition: "inline"
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :surname, :birth, :classname_id, :price)
    end
end
