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
    end 
end
