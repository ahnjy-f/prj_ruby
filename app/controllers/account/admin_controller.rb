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
    end

    def update
        @m = Member.find(params[:id])
        @m.assign_attributes(member_params)
        pp @m.account
        pp @m
        if @m.save!
            pp "saveしました"
            @m=Member.select("*")
            @m = @m.page(params[:page])
            flash.notice ="更新成功"
            redirect_to:account_admin_show
        else
            pp "save"
            flash.alert="変更できませんでした"
            redirect_to:account_admin_show
        end

        
    # pp "================="
    # pp @m.assign_attributes(params[:member])    
    # pp "================="
    #     if @m.save
    #         flash.notice = "編集成功"
    #         redirect_to:account_root
    #     else
    #         flash.notice = "編集成功"
    #         redirect_to:account_root
    #     end
    end
    private def member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic,
            account_attributes:[
                :mail_address,
                :password,
                :admin_flag,
                :id
            ]
        )
    end



end
