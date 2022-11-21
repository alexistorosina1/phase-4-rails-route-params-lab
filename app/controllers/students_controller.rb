class StudentsController < ApplicationController
  # check if theres a query param called "name"
  # only want to get students that have a matching first or last name // case insensitive
  # return the first or last name if query matches 

  # def index
  #   if students = Student.all
  #   render json: students 
  #   else 
  #     students = Student.find_by(params[:name])
  #   end
  # end

  # def index
  #   if students = Student.where("lower(last_name) = ? OR lower(first_name) =?", params[:name].downcase, params[:name].downcase)
  #   else
  #     Student.all
  #   end
  # end
  def index
    students = if params[:name]
                 Student.where("lower(last_name) = ? OR lower(first_name) =?", params[:name].downcase, params[:name].downcase)
               else
                 Student.all
               end    
    render json: students
  end


  def show
    students = Student.find(params[:id])
    render json: students
  end

end
