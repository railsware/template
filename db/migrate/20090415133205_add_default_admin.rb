class AddDefaultAdmin < ActiveRecord::Migration
  def self.up
    @u = User.create(:login => 'admin', :email => 'admin@railsware.com',
                     :password => 'admin12345', :password_confirmation => 'admin12345')
    @u.has_role!(:admin)
    @u.save
  end

  def self.down
    User.find_by_login('admin').destroy
  end
end
