class StudentsController < ApplicationController
    
    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def index
        render json: Student.all
    end

    def show
        render json: find_student, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        return Student.find(params[:id])
    end
end
