class StudentsController < ApplicationController
  
  # GET /students
  def index
    render json: Student.all
  end

  # GET /students/:id
  def show
    student = Student.find_by(id: params[:id])
    if student
      render json: student
    else 
      render json: { error: "Student not found" }, status: :not_found
    end
  end

  # POST /students
  def create
    student = Student.create(student_params)
    render json: student, status: :created
  end

  # PATCH /students/:id
  def update
    student = Student.find_by(id: params[:id])
    if student
      student.update(student_params)
      render json: student
    else
      render json: { error: "Student not found" }, status: :not_found
    end
  end

  # DELETE /students/:id
  def destroy
    student = Student.find_by(id: params[:id])
    if student
        student.destroy
        head :no_content
    else 
      render json: { error: "Student not found"}, status: :not_found
    end
  end

  private

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end
end
