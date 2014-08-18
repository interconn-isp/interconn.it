ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  filter :email

  index do
    selectable_column

    id_column

    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  show do
    columns do
      column do
        panel 'Credenziali' do
          attributes_table_for admin_user do
            row :email
          end
        end
      end

      column do
        panel 'Statistiche' do
          attributes_table_for admin_user do
            row :sign_in_count
            row :current_sign_in_at
            row :current_sign_in_ip
            row :created_at
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Credenziali' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end
end
