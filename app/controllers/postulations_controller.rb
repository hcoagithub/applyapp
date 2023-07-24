class PostulationsController < ApplicationController

    def index
        @postulations = Postulation.all
    end


    def create
        @postulations = Postulation.all
        @vacant = Vacant.find(params[:postulation][:vacant_id])
        @postulation = Postulation.new(postulation_params)
        @postulation.user = current_user
        
        
        respond_to do |format| 
              
            if @postulation.save
                format.html { redirect_to vacants_url, notice: "Postulation was successfully created." }
            else
                format.html { redirect_to vacant_url(@vacant), alert: "Ya habias postulado antes." }
            end
        end     
    end

    def set_vacant
        @postulation = Postulation.find(params[:id])
    end

    def postulation_params
    params.require(:postulation).permit(:user_id, :vacant_id)
    end
end