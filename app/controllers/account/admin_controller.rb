require "pp"
class Account::AdminController < Account::Base

    def show
        pp "==============="
        pp session[:admin_flag]
        if current_admin
        @m=Member.joins(:account).select("*").where("accounts.admin_flag='1'")
        @m = @m.page(params[:page])
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root
        end
        # HitProduct.select("hit_products.id hit_product_id, book_marks.id book_mark_id, hit_q").left_joins(:book_marks)

    end    
end
