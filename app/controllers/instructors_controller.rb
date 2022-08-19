class InstructorsController < ApplicationController


    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def index
        render json: Instructor.all
    end

    def show
        render json: find_instructor, status: :ok
    end

    def destroy
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        return Instructor.find(params[:id])
    end
end
