class StaticController < ApplicationController
    def home
    end
    
    def getmessages
        @bottles = current_user.bottles
    end
    
end
