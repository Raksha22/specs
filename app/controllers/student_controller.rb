class StudentController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    # render :new
  end

  def create
    @student = Student.new(student_params)
    
    if @student.save
      redirect_to student_index_path
    else
      redirect_to new_student_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_index_path(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to student_index_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end
end