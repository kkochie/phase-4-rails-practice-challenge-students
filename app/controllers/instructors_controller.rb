class InstructorsController < ApplicationController

  # GET /instructors
  def index
    render json: Instructor.all
  end

  # GET /instructors/:id
  def show
    instructor = Instructor.find_by(id: params[:id])
    if instructor
      render json: instructor
    else 
      render json: { error: "Instructor not found" }, status: :not_found
    end
  end

  # POST /instructors
  def create
    instructor = Instructor.create(instructor_params)
    render json: instructor, status: :created
  end

  # PATCH /instructors/:id
  def update
    instructor = Instructor.find_by(id: params[:id])
    if instructor
      instructor.update(instructor_params)
      render json: instructor
    else
      render json: { error: "Instructor not found" }, status: :not_found
    end
  end

  # DELETE /instructors/:id
  def destroy
    instructor = Instructor.find_by(id: params[:id])
    if instructor
      instructor.destroy
      head :no_content
    else
      render json: { error: "Instructor not found" }, status: :not_found
    end
  end

  private

  def instructor_params
    params.permit(:name)
  end
end
