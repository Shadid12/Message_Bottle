class PmsController < ApplicationController
    
    def create
        c = Conversation.find(params[:id])
        pm = c.pms.new(body: params[:body], sender_id: current_user.id)
        pm.save
        # if pm.save
        #     respond_to do |f|
        #         f.json { render json: "success"}
        #     end
        # end
    end
    
end
