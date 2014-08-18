ActiveAdmin.register Inquiry do
  decorate_with InquiryDecorator

  permit_params :full_name, :address, :telephone, :email, :product, :notes, :status

  filter :code
  filter :full_name
  filter :address
  filter :telephone
  filter :email
  filter :created_at
  filter :product, as: :select, collection: Inquiry.product.options

  scope :all
  scope :requested
  scope :completed
  scope :infeasible

  index do
    selectable_column

    id_column

    column :code
    column :full_name
    column :address
    column :created_at
    column :status

    actions
  end

  show do
    columns do
      column do
        panel 'Dati cliente' do
          attributes_table_for inquiry do
            row :full_name
            row :telephone
            row :email
          end
        end
      end

      column do
        panel 'Dati sopralluogo' do
          attributes_table_for inquiry do
            row :status
            row :product
            row :address
            row :notes
          end
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'Dati cliente' do
      f.input :full_name
      f.input :telephone, hint: I18n.t('formtastic.hints.inquiry.telephone')
      f.input :email, hint: I18n.t('formtastic.hints.inquiry.email')
    end

    f.inputs 'Dati sopralluogo' do
      f.input :address, input_html: { style: 'height: 100px' }
      f.input :product
      f.input :notes, input_html: { style: 'height: 100px' }
    end

    f.inputs 'Stato sopralluogo' do
      f.input :status, include_blank: false
    end

    f.actions
  end
end
