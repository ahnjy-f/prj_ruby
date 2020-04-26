require "pp"
class Account::MembersController < Account::Base
    def index
    end

    def show 
        @member = current_member
    end

    def edit
        @member = current_member
        @account = Account.find_by(id: session[:account_id])
        
    end

    def update
        @account = Account.find_by(id: session[:account_id])
        @member = current_member
        @member.assign_attributes(member_params)
        if @member.save
            flash.notice = "情報更新ができました。"
            redirect_to :account_member
        else
            render action: "edit"
        end
    end

    def current_member
        if session[:account_id]
            @current_member ||=
                Member.find_by(id: session[:account_id])
        end
    end

    private def member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic, :face_photo_path,
            :birth_year_month, :one_word_comment, :personality,
            :hobby, :favorite_things, :hate_things,
            :strong_point, :week_point, :special_skill,
            :week_things, :happy_done_things, :disgusted_things,
            :freedom_message
        )
    end

end
