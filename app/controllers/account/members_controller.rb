class Account::MembersController < Account::Base
    def index
    end

    def show 
        @member = current_member
    end

    private def current_member
        if session[:account_id]
            @current_member ||=
                Member.find_by(id: session[:account_id])
        end
    end

end
