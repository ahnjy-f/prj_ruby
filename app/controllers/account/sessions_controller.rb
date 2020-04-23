class Account::SessionsController < Account::Base
    def new
        if current_account
            pp "indexに行きます"
            redirect_to :account_root
        else
            "ログインページに行きます"
            render action: "new"
        end
    end
end
