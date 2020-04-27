require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
        
        @m=Member.joins(:account).select("*")
        
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root 
        end
        @m = @m.page(params[:page])

    end

    def edit 
        @m = Member.find(params[:id])
        pp @m.account.mail_address
    end

    def update
        
        @m = Member.find(params[:id])
        @m.assign_attributes(params[member])
        pp @m
    end
end
