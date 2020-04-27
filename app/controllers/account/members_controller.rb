require "pp"
class Account::MembersController < Account::Base
    def index
        @member = Member.order(:first_name, :last_name)
        @member = @member.page(params[:page])
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

            save_history

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

    def save_history
        edithistory = MemberEditHistory.new
        edithistory.member_id = @member.id
        edithistory.face_photo_path = @member.face_photo_path
        edithistory.one_word_comment = @member.one_word_comment
        edithistory.personality = @member.personality
        edithistory.hobby = @member.hobby
        edithistory.favorite_things = @member.favorite_things
        edithistory.hate_things = @member.hate_things
        edithistory.strong_point = @member.strong_point
        edithistory.week_point = @member.week_point
        edithistory.special_skill = @member.special_skill
        edithistory.week_things = @member.week_things
        edithistory.happy_done_things = @member.happy_done_things
        edithistory.disgusted_things = @member.disgusted_things
        edithistory.freedom_message = @member.freedom_message
        edithistory.save
    end

end
