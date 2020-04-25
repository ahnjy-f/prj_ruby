class Account::Base < ApplicationController
    
    private def current_account
        pp "ログインできたのか確認中"
        if session[:account_id]
            pp "入りました"
            @current_account ||=
                Account.find_by(id: session[:account_id])
            pp @current_account
            pp "============="
        end
    end
    
    helper_method :current_account
end 