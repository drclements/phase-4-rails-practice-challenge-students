class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 

    def index 
        render json: Student.all
    end

    def show 
        student = find_student
        render json: student 
    end

    def create
        student = Student.create!(student_params)
        render json: student , status: :created
    end

    def update 
        student = find_student
        student.update!(student_params)
        render json: student
    end

    def destroy 
        student = find_student
        student.destroy
        head :no_content
    end

private 

    def render_unprocessable_entity_response(invalid) 
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student 
        Student.find(params[:id])
    end
end
