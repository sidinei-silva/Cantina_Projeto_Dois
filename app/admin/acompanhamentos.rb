ActiveAdmin.register Acompanhamento do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :nome_acompanhamento, :valor_acompanhamento, :produto_id
  menu priority: 3

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#

  form  do |form|
    form.semantic_errors *form.object.errors.keys
    form.inputs "Details" do
      form.input :produto_id, :as => :select, :collection => Produto.all.collect {|produto| [produto.nome_produto, produto.id]}
      form.input :nome_acompanhamento
      form.input :valor_acompanhamento
    end
    form.actions
  end

  show :title => :nome_acompanhamento do
    attributes_table_for acompanhamento.produto do
      row :nome_produto
    end
    attributes_table do
      row :nome_acompanhamento
      row :valor_acompanhamento
    end

  end
end
