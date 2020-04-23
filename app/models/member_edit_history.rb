class MemberEditHistory < ApplicationRecord
    belongs_to :member, class_name: "Member", foreign_key: "id",optional: true
end
