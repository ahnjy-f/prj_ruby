require "pp"
class Account::AdminController < Account::Base

    def show
        # pp member
        # pp Account.joins(:member).select("accounts.member_id, members.id").where("account.addmin_flag ="1"")
            @m=Member.joins(:account).select("*").where("accounts.admin_flag='1'")
            @m = @m.page(params[:page])
        # HitProduct.select("hit_products.id hit_product_id, book_marks.id book_mark_id, hit_q").left_joins(:book_marks)

    end    
end
