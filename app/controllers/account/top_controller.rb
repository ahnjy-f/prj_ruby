class Account::TopController < Account::Base
    def index
        if current_account
            render action: "dashborad"
        else
            redirect_to:"account_login"
        end
    end
end
