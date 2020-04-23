class Account::Base < ApplicationController
    
    private def current_account
        pp "ログインできたのか確認中"
        if session[:account_member_id]
            @current_account ||=
                Account.find_by(id: session[:account_member_id])
        end
    end
    
    helper_method :current_account
end 