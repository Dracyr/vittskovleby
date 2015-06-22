%w(admin editor reservation_manager).each do |role|
  Role.create(role_name: role)
end
