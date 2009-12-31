#Set up admin user(s)
admin_role = Role.new
admin_role.name = "admin"
admin_role.save

admin_user = User.new
admin_user.login = "admin"
admin_user.email = "admin@railsware.com"
admin_user.password = "admin12345"
admin_user.password_confirmation = "admin12345"
admin_user.save
#admin_user.save_with_validation(false)
admin_user.has_role! :admin