ActiveAdmin.register Contact do
  decorate_with ContactDecorator

  filter :full_name
  filter :phone
  filter :email
  filter :source_ip

  index do
    selectable_column

    id_column

    column :full_name
    column :phone
    column :email
    column :source_ip

    actions
  end

  show do
    columns do
      column do
        panel 'Dati utente' do
          attributes_table_for contact do
            row :full_name
            row :phone
            row :email
            row :source_ip
          end
        end
      end

      column do
        panel 'Ticket' do
          attributes_table_for contact do
            row :created_at
            row :message
          end
        end
      end
    end
  end
end
