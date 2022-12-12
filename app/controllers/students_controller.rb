class StudentsController < ApplicationController

  def index
    if params[:name]

      filtered_students = Student.all.filter do |student|
        student.to_s.downcase.include?(params[:name])
      end

      render json: filtered_students
      
    else
      students = Student.all
      render json: students 
    end
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

end
