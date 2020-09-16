ActiveAdmin.register User do

  permit_params :email, :password, :nickname

  
end
