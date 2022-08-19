class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid

    
    
    
    
    private

    def not_valid(exception)
        render json: { errors: exception }, status: :unprocessable_entity
    end

    def not_found(errors)
        
        render json: { errors: errors }, status: :not_found
    end
end
