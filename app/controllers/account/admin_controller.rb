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

    def new
        @member = Member.new
        @member.build_account
    end

    def create
        @member = Member.new(member_params)
        pp @member
        
            if @member.save
                flash.notice = "登録されました"
                redirect_to "/account/admin/show"
            else
                pp @member.errors
                flash.now.alert = "登録されませんでした"
                render action: "new"
            end
    end



    private def member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic, :face_photo_path,
            :birth_year_month, :joining_year, :one_word_comment, :personality,
            :hobby, :favorite_things, :hate_things,
            :strong_point, :week_point, :special_skill,
            :week_things, :happy_done_things, :disgusted_things,
            :freedom_message,
            account_attributes: [
                :member_id,
                :mail_address,
                :password,
                :admin_flag
            ]
        )
    end

end
