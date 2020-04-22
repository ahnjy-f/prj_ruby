class Accounts::Base < ApplicationController
    private def current_accounts
        if session[:accounts_id]
            @current_accounts||=
            Account.find_by(id: session[:accounts_id])
        end
    end

    helper_method :current_accounts
end