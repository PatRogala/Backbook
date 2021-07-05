class CreateFriendsPendings < ActiveRecord::Migration[6.1]
  def change
    create_table :friends_pendings do |t|
      t.integer :inviter_id
      t.integer :invitee_id
    end
  end
end
