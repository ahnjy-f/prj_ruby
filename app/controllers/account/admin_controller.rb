require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
        
        @m=Member.select("*")
        
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
        @m.assign_attributes(params[:member])
        if @m.save
            flash.notice = "編集成功"
            redirect_to:account_root
        else
            flash.notice = "編集成功"
            redirect_to:account_root
        end
    end
end
