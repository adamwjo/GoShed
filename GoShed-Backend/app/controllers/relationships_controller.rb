class RelationshipsController < ApplicationController
    skip_before_action :authorized
    def index
        render json: User.all
    end

    def create
        render json: Relationship.create(relationship_params)
    end

    private

    def relationship_params
        params.require(:relationship).permit(:teacher_id, :student_id)
    end
end
