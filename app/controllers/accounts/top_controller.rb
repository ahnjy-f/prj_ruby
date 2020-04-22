class Accounts::TopController < Accounts::Base
    def index
        if current_accounts
            render action: "dashborad"
        else
            render action:"../session/new"
        end
    end
end
