require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
        
        @m=Member.select("*")
        
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root 
        end
        # HitProduct.select("hit_products.id hit_product_id, book_marks.id book_mark_id, hit_q").left_joins(:book_marks)
        @account = current_account
        @member = current_member

        @m = @m.page(params[:page])

    end

    def edit 
        @m = Member.find(params[:id])
        pp @m.account.mail_address
    end

    def update
        @m = Member.find(params[:id])
        @m.assign_attributes(params[:member])
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
end
