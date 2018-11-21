class AssignmentsController < ApplicationController
    def index
        render json: Assignment.all 
    end

    def create
        render json: Assignment.create(file: params[:file])
    end

   
end
